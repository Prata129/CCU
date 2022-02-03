class Song {
  String id;
  String artist;
  String description;
  String features;
  String name;
  bool inPlaylist = false;

  Song({
    required this.id,
    required this.artist,
    required this.description,
    required this.features,
    required this.name,
    inPlaylist,
  });

  Map<String, dynamic> toMap() {
    if (this.id == '') {
      return {
        'artist': artist,
        'description': description,
        'features': features,
        'name': name,
        'inPlaylist': inPlaylist,
      };
    }
    return {
      'id': id,
      'artist': artist,
      'description': description,
      'features': features,
      'name': name,
      'inPlaylist': inPlaylist,
    };
  }
}
