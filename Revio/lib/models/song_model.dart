class Song {
  String name;
  String description;
  String features;
  String path;

  Song(
      {required this.name,
      required this.description,
      required this.features,
      required this.path});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'features': features,
      'path': path,
    };
  }
}
