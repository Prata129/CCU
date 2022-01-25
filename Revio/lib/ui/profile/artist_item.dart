import 'package:flutter/cupertino.dart';
import 'package:revio/models/artist_model.dart';

class ArtistItem extends StatelessWidget {
  final Artist artist;

  ArtistItem({Key? key, required this.artist}) : super(key: key);

  @override 
  Widget build(BuildContext context) {
    return Container(child: Text("this is a test"));
  }
}
