
class Song {
  String id;
  String artist;
  String description;
  String features;
  String path;
  String name;

  Song({required this.id, 
      required this.artist,
      required this.description,
      required this.features,
      required this.path,
      required this.name});

  Map<String, dynamic> toMap() {
    if (this.id == '') {
      return {
        'artist': artist,
        'description': description,
        'features': features,
        'path': path,
        'name': name,
      };
    }
    return {
      'id': id,
      'artist': artist,
      'description': description,
      'features': features,
      'path': path,
      'name': name,
    };
  }



}
