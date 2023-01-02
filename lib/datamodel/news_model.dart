class NewsModel{

  String topic;
  String image;
  String author;
  String documentId;
  String path;
  String body;
  int date;

  NewsModel({this.topic, this.image, this.author, this.date, this.documentId, this.body, this.path});

  factory NewsModel.fromMap(Map<String, dynamic> map) {
    return new NewsModel(
      topic: map['topic'] as String,
      image: map['image'] as String,
      author: map['author'] as String,
      body: map['body'] as String,
      date: map['date'] as int,
      path: map['pth'] as String,
      documentId: map['documentId'] as String
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'topic': this.topic,
      'image': this.image,
      'author': this.author,
      'date': this.date,
      'documentId' : this.documentId,
      'path' : this.path,
      'body' : this.body,
    } as Map<String, dynamic>;
  }
}