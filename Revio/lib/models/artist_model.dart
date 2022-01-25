import 'dart:core';

class Artist {
  final String id;
  final String name;
  final int level;
  final int timesListened;

  const Artist({
    required this.id,
    required this.name,
    required this.level,
    required this.timesListened,
  });

  String getRankName() {
    if (level == 1) return 'Rookie';
    else if (level == 2) return 'Amateur';
    else if (level == 3) return 'Pro';
    return 'Unknown';
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'level': level,
      'times_listened': timesListened
    };
  }
}