import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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

  @override
  Widget _songScreen(BuildContext context, Song viewModel) {
    final fileName = file != null ? basename(file!.path) : 'No File Selected';

    return Scaffold(
      backgroundColor: Color(0xFF222222),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            AppBar(
              leading: IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              iconTheme: IconThemeData(color: Color(0xFFC2C2C2)),
              backgroundColor: Color(0xFF222222),
              title: Text("Add Album",
                  style: TextStyle(fontSize: 32.0, color: Color(0xFFC2C2C2))),
              elevation: 0,
            ),
            Container(
                child: TextField(
              style: const TextStyle(color: Colors.white),
              obscureText: true,
              decoration: const InputDecoration(
                  filled: true,
                  fillColor: Color(0xFFC2C2C2),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                  labelText: 'Password',
                  labelStyle: TextStyle(color: Colors.white),
                  hintText: 'Enter secure password'),
              onChanged: (value) => viewModel.name = value,
            )),
            Container(
              padding: EdgeInsets.all(32),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ButtonWidget(
                      text: 'Select File',
                      icon: Icons.attach_file,
                      onClicked: selectFile,
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
                      text: 'Upload File',
                      icon: Icons.cloud_upload_outlined,
                      onClicked: uploadFile,
                    ),
                    SizedBox(height: 20),
                    task != null ? buildUploadStatus(task!) : Container(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);

    if (result == null) return;
    final path = result.files.single.path!;

    setState(() => file = File(path));
  }

  Future uploadFile() async {
    if (file == null) return;

    final fileName = basename(file!.path);
    final destination = 'files/$fileName';

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
