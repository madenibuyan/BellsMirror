class AppointmentHistory {
  String title;
  int time;

  AppointmentHistory({this.title, this.time});

  factory AppointmentHistory.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return new AppointmentHistory(
      title: map['title'] as String,
      time: map['time'] as int,
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'title': this.title,
      'time': this.time,
    } as Map<String, dynamic>;
  }
}
