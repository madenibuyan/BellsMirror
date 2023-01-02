class PillData{

  String name;
  String intake;
  String documentId;

  PillData({this.name, this.intake, this.documentId});

  factory PillData.fromMap(Map<String, dynamic> map) {
    return new PillData(
      name: map['name'] as String,
      intake: map['intake'] as String,
        documentId : map['documentId'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'name': this.name,
      'intake': this.intake,
      'documentId' : this.documentId,
    } as Map<String, dynamic>;
  }
}