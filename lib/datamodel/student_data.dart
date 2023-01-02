class StudentData {
  String matric;
  String name;
  String email;
  String uid;
  String phoneNumber;
  String gender;

  StudentData({this.matric, this.name, this.email, this.uid, this.phoneNumber,
      this.gender});

  factory StudentData.fromMap(Map<String, dynamic> map) {

    if(map == null) return null;

    return new StudentData(
      matric: map['matric'] as String,
      name: map['name'] as String,
      email: map['email'] as String,
      uid: map['uid'] as String,
      phoneNumber: map['phoneNumber'] as String,
      gender: map['gender'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'matric': this.matric,
      'name': this.name,
      'email': this.email,
      'uid': this.uid,
      'phoneNumber': this.phoneNumber,
      'gender': this.gender,
    } as Map<String, dynamic>;
  }
}



