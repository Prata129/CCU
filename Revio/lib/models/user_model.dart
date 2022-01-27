class User {
  String id;
  String email;
  String displayName;
  bool? isArtist;
  String avatarUrl;
  double money;
  String? genre;

  User({
    required this.id,
    required this.email,
    required this.displayName,
    required this.isArtist,
    required this.avatarUrl,
    required this.money,
    this.genre,
  });

  Map<String, dynamic> toMap() {
    if (this.id == '') {
      return {
        'email': email,
        'displayName': displayName,
        'isArtist': isArtist,
        'avatarUrl': avatarUrl,
        'money': money,
        'genre': genre
      };
    }
    return {
      'id': id,
      'email': email,
      'displayName': displayName,
      'isArtist': isArtist,
      'avatarUrl': avatarUrl,
      'money': money,
      'genre': genre
    };
  }
}
