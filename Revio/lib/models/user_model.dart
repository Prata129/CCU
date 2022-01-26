class User {
  String id;
  String email;
  String displayName;
  bool? isArtist;
  String avatarUrl;
  double money;

  User(
      {required this.id,
      required this.email,
      required this.displayName,
      required this.isArtist,
      required this.avatarUrl,
      required this.money});

  Map<String, dynamic> toMap() {
    if (this.id == '') {
      return {
        'email': email,
        'displayName': displayName,
        'isArtist': isArtist,
        'avatarUrl': avatarUrl,
        'money': money,
      };
    }
    return {
      'id': id,
      'email': email,
      'displayName': displayName,
      'isArtist': isArtist,
      'avatarUrl': avatarUrl,
      'money': money
    };
  }
}
