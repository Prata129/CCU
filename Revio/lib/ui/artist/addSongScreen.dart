import 'dart:ffi';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:revio/ui/myMusic.dart';
import 'package:revio/ui/widgets/button.dart';
import '../api/firebase_api.dart';
import 'package:revio/models/song_model.dart';
import 'package:path/path.dart';

class AddSongScreen extends StatefulWidget {
  @override
  _AddSongState createState() => _AddSongState();
}

class _AddSongState extends State<AddSongScreen> {
  UploadTask? task;
  File? file;
  Color buttoncolor = Color(0xFFC2C2C2);
  bool isvisible = false;
  bool completed = false;

  @override
  Widget _songScreen(BuildContext context, Song viewModel) {
    final fileName = file != null ? basename(file!.path) : 'No File Selected';

    return Scaffold(
        backgroundColor: Color(0xFF222222),
        body: SingleChildScrollView(
            child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                AppBar(
                  leading: IconButton(
                      icon: Icon(Icons.arrow_back_ios),
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                  iconTheme: IconThemeData(color: Color(0xFFC2C2C2)),
                  backgroundColor: Color(0xFF222222),
                  title: Text("Add Song",
                      style:
                          TextStyle(fontSize: 32.0, color: Color(0xFFC2C2C2))),
                  elevation: 0,
                ),
                Container(
                    padding: const EdgeInsets.all(32),
                    child: SizedBox(
                      width: 300,
                      height: 60,
                      child: TextField(
                        style: const TextStyle(color: Colors.black),
                        decoration: const InputDecoration(
                            filled: true,
                            floatingLabelBehavior: FloatingLabelBehavior.auto,
                            fillColor: Color(0xFFC2C2C2),
                            labelText: 'Name',
                            labelStyle: TextStyle(color: Colors.black),
                            hintText: 'Enter song name (Required)'),
                        onChanged: (value) => viewModel.name = value,
                      ),
                    )),
                Container(
                    padding: const EdgeInsets.all(32),
                    child: SizedBox(
                      width: 300,
                      height: 60,
                      child: TextField(
                        style: const TextStyle(color: Colors.black),
                        decoration: const InputDecoration(
                            filled: true,
                            fillColor: Color(0xFFC2C2C2),
                            labelText: 'Description',
                            labelStyle: TextStyle(color: Colors.black),
                            hintText: 'Enter description (Required)'),
                        onChanged: (value) => viewModel.description = value,
                      ),
                    )),
                Container(
                    padding: const EdgeInsets.all(32),
                    child: SizedBox(
                      width: 300,
                      height: 60,
                      child: TextField(
                        style: const TextStyle(color: Colors.black),
                        decoration: const InputDecoration(
                            filled: true,
                            fillColor: Color(0xFFC2C2C2),
                            labelText: 'Artist Features',
                            labelStyle: TextStyle(color: Colors.black),
                            hintText: 'Enter artists'),
                        onChanged: (value) => viewModel.features = value,
                      ),
                    )),
                Container(
                  padding: EdgeInsets.all(32),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ButtonWidget(
                          text: 'Select Audio File',
                          icon: Icons.attach_file,
                          color: const Color(0xFFE5BE58),
                          onClicked: () => selectFile(viewModel),
                        ),
                        SizedBox(height: 8),
                        Text(
                          fileName,
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                        SizedBox(height: 48),
                        ButtonWidget(
                          text: 'Upload and Add Song',
                          icon: Icons.cloud_upload_outlined,
                          color: buttoncolor,
                          onClicked: () => uploadSong(viewModel),
                        ),
                        SizedBox(height: 20),
                        task != null ? buildUploadStatus(task!) : Container(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Visibility(
              visible: isvisible,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: DecoratedBox(
                    decoration:
                        BoxDecoration(color: Colors.black.withOpacity(0.6))),
              ),
            ),
            Visibility(
                visible: isvisible,
                child: Align(
                    alignment: Alignment.center,
                    child: Padding(
                        padding: const EdgeInsets.only(top: 300),
                        child: SizedBox(
                          width: 350,
                          height: 250,
                          child: Stack(children: <Widget>[
                            Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10))),
                            Align(
                                alignment: Alignment.center,
                                child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      const Text(
                                        'Song Added!',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 40,
                                            color: Colors.black),
                                      ),
                                      ButtonWidget(
                                        text: 'OK',
                                        color: const Color(0xFFE5BE58),
                                        onClicked: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      MyMusic()));
                                        },
                                      ),
                                    ]))
                          ]),
                        )))),
          ],
        )));
  }

  Future selectFile(Song viewModel) async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);

    if (result == null) return;
    final path = result.files.single.path!;

    setState(() => file = File(path));

    if (viewModel.name != "" && viewModel.description != "") {
      setState(() {
        buttoncolor = Color(0xFFE5BE58);
      });
    }
  }

  Future uploadSong(Song viewModel) async {
    if (file == null || viewModel.name == "" || viewModel.description == "") {
      print('ERRO');
      return;
    }

    final fileName = basename(file!.path);
    final destination = 'files/$fileName';
    viewModel.path = destination;
    if (FirebaseAuth.instance.currentUser != null) {
      viewModel.artist = FirebaseAuth.instance.currentUser!.email.toString();
    } else {
      print('NO SESSION');
    }
    viewModel.addSong();

    task = FirebaseApi.uploadFile(destination, file!);
    
    setState(() {});
  }

  Widget buildUploadStatus(UploadTask task) => StreamBuilder<TaskSnapshot>(
        stream: task.snapshotEvents,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final snap = snapshot.data!;
            final progress = snap.bytesTransferred / snap.totalBytes;
            final percentage = (progress * 100).toStringAsFixed(2);

            if (progress == 1) {
              isvisible = true;
              WidgetsBinding.instance
                  ?.addPostFrameCallback((_) => setState(() {}));
            }
            return Text(
              '$percentage %',
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            );
          } else {
            return Container();
          }
        },
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<Song>(
          builder: (context, viewModel, child) =>
              _songScreen(context, viewModel)),
    );
  }
}
