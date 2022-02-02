import 'package:flutter/material.dart';
import 'artist/albumScreen.dart';

// ignore: constant_identifier_names
const double SQUARE_SIZE = 158;

class FolderScreen extends StatelessWidget {
  String _title;
  String _name;

  FolderScreen({Key? key, required String title})
      : _title = title,
        _name = '',
        super(key: key) {
    if (title == 'Folder 1') {
      _name = 'Playlist 4';
    } else if (title == 'Folder 2') {
      _name = 'Playlist 5';
    } else {
      _title = 'Albums';
      _name = 'I\'m John';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF222222),
        body: SingleChildScrollView(
          child: Column(
            children: [
              AppBar(
                leading: IconButton(
                    icon: const Icon(Icons.arrow_back_ios),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
                iconTheme: IconThemeData(color: const Color(0xFFC2C2C2)),
                automaticallyImplyLeading: false,
                backgroundColor: const Color(0xFF222222),
                title: Text(_title,
                    style: TextStyle(fontSize: 32.0, color: Color(0xFFC2C2C2))),
                elevation: 0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: SizedBox(
                          width: SQUARE_SIZE,
                          height: SQUARE_SIZE,
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          AlbumScreen(title: _name)));
                            },
                            child: Stack(
                              children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: AssetImage(
                                        'assets/images/$_name.png',
                                      ),
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        begin: FractionalOffset.topCenter,
                                        end: FractionalOffset.bottomCenter,
                                        colors: [
                                          Colors.black.withOpacity(0),
                                          Colors.black,
                                        ],
                                        stops: const [
                                          0,
                                          1
                                        ]),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                Container(
                                  child: Align(
                                    alignment: Alignment
                                        .bottomCenter, // Align however you like (i.e .centerRight, centerLeft)
                                    child: Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: Text(
                                        _name,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: SizedBox(
                          width: SQUARE_SIZE,
                          height: SQUARE_SIZE,
                          child: Stack(
                            children: <Widget>[
                              Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: FractionalOffset.topCenter,
                                      end: FractionalOffset.bottomCenter,
                                      colors: [
                                        Colors.black.withOpacity(0),
                                        Colors.black.withOpacity(0),
                                      ],
                                      stops: const [
                                        0,
                                        1
                                      ]),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              Container(
                                child: const Align(
                                  alignment: Alignment
                                      .bottomCenter, // Align however you like (i.e .centerRight, centerLeft)
                                  child: Padding(
                                    padding: EdgeInsets.all(5),
                                    child: Text(
                                      '',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
