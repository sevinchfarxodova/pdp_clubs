class Club {
  final String id;
  final String clubName;
  final String type;
  final String desc;
  final String date;
  final String courseName;
  final String? img;
  List<String> comment;

  Club({
    required this.id,
    required this.clubName,
    required this.type,
    required this.desc,
    required this.date,
    required this.courseName,
    this.img,
    this.comment = const [],
  });

  factory Club.fromJson(Map<String, dynamic> json) {
    return Club(
      id: json['_id'] ?? '',
      clubName: json['clubName'] ?? 'Unknown Club',
      type: json['type'] ?? 'General',
      desc: json['desc'] ?? 'No Description',
      date: json['date'] ?? 'N/A',
      courseName: json['courseName'] ?? 'Unknown Course',
      img: json['img'] ?? "No Img",
      comment:
          json['comments'] is List ? List<String>.from(json['comments']) : [],
    );
  }
}
