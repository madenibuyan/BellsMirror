

class DeggiaImageClass {
  String url;
  String ref;

  DeggiaImageClass({this.url, this.ref});

  factory DeggiaImageClass.fromMap(Map<String, dynamic> map) {
    if(map == null) return null;
    return new DeggiaImageClass(
      url: map['url'] as String,
      ref: map['ref'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'url': this.url,
      'ref': this.ref,
    } as Map<String, dynamic>;
  }
}