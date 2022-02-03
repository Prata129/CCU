class User {
  String id;
  String email;
  String displayName;
  bool isArtist;
  String avatarUrl;

  String? genre;

  User({
    required this.id,
    required this.email,
    required this.displayName,
    required this.isArtist,
    required this.avatarUrl,
    this.genre,
  });

  Map<String, dynamic> toMap() {
    if (this.id == '') {
      return {
        'email': email,
        'displayName': displayName,
        'isArtist': isArtist,
        'avatarUrl': avatarUrl,
        'genre': genre
      };
    }
    return {
      'id': id,
      'email': email,
      'displayName': displayName,
      'isArtist': isArtist,
      'avatarUrl': avatarUrl,
      'genre': genre
    };
  }
}
