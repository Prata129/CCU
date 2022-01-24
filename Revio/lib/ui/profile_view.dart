import 'package:flutter/material.dart';
import 'package:revio/models/user_model.dart';
import 'package:revio/ui/profile/avatar.dart';
import 'package:revio/data/user_repo.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileView extends StatefulWidget {

  @override 
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  //late UserModel currentUser;
  List<Image> images = [
    Image.asset("assets/images/playlist1.png"),
    Image.asset("assets/images/playlist2.png"),
    Image.asset("assets/images/playlist3.png"),
  ];
  
  Widget myImage(int index) {
    int number = index+1;
    return Stack(
      children: <Widget>[
        Container(
          width: 180,
          decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          image: DecorationImage(image: images[index].image, fit: BoxFit.cover),
          ),
        ),
        Center(
          child: Padding(
            padding: EdgeInsets.only(top: 115, left: 55), 
            child: Text(
              "Playlist $number",
              style: GoogleFonts.roboto(
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.bold
              ),
            )
          )
        )
      ]
    );
  }
  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF222222),
      appBar: 
        AppBar(
              leading: IconButton(icon: Icon(Icons.arrow_back_ios), 
              onPressed: (){
                //TODO GO BACK
              }
              ),
              iconTheme: const IconThemeData(
                color: Color(0xFFC2C2C2)
              ),
              backgroundColor: const Color(0xFF222222),
              title: Text("Username", style: const TextStyle(fontSize: 32.0, color: Color(0xFFC2C2C2))),
            elevation: 0,
        ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.only(top: 40, right: 200),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const <Widget>[
                CircleAvatar( 
                  radius: 65.0, 
                  backgroundColor: Color(0xFFE5E5E5),
                  child:  CircleAvatar(
                    radius: 63.0,
                    backgroundImage: AssetImage('assets/images/adele25.jpg')
                    ,)
                  ,)
                //Avatar(
                 // avatarUrl: currentUser.avatarUrl,
                //  onTap: () {
                  //TODO TAP TO CHANGE PHOTO
                //})
              ],
            ) 
          ),
          Padding( 
            padding: EdgeInsets.only(top: 20, right: 250),
            child: Text('Playlists',
              textAlign: TextAlign.left,
              style: GoogleFonts.roboto(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.w400
              )
            ),
          ),
          Expanded(
            child: new ListView.separated(
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                  width: 10,
                  );
                },
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  return myImage(index);
                },
              scrollDirection: Axis.horizontal,
            )
          ),
          Padding(padding: const EdgeInsets.only(top: 10, bottom: 180),
          child: Text(
                  "Favorite Artists",
                  style: GoogleFonts.roboto(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.w400
                ),
            )
          )
        ]
      )
    );
  }
}