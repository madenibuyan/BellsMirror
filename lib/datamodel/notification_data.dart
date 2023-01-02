class NotificationData {
  int type;
  String title;
  int time;

  NotificationData({this.type, this.title, this.time});

  factory NotificationData.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return new NotificationData(
      type: map['type'] as int,
      title: map['title'] as String,
      time: map['time'] as int,
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'type': this.type,
      'title': this.title,
      'time': this.time,
    } as Map<String, dynamic>;
  }
}
