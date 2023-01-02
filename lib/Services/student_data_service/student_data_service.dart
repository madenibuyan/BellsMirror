import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bells_mirror/Services/auth_service/auth_service.dart';
import 'package:bells_mirror/datamodel/student_data.dart';
import 'package:bells_mirror/utils/locator.dart';

abstract class StudentDataService {
  Stream<StudentData> listenForStudentData();
}

class StudentDataServiceFake extends StudentDataService {
  @override
  Stream<StudentData> listenForStudentData() async* {
    yield StudentData(
        name: "Malik",
        matric: "2017/2020",
        email: "malikguy@gmail.com",
        gender: "Male",
        phoneNumber: "08036007161",
        uid: "hfefufjfufkbewrg");
  }
}

class StudentDataServiceReal extends StudentDataService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  AuthService _authService = locator<AuthService>();

  @override
  Stream<StudentData> listenForStudentData() async* {
    _authService.currentUserId();

    yield* firestore
        .collection("users")
        .doc(_authService.currentUserId())
        .snapshots()
        .map((event) => mapData(event));
  }

  StudentData mapData(DocumentSnapshot data){


    if(data == null) return null;

    return StudentData.fromMap(data.data());

  }
}
