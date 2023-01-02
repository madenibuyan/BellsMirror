import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bells_mirror/Services/auth_service/auth_service.dart';
import 'package:bells_mirror/datamodel/notification_data.dart';
import 'package:bells_mirror/datamodel/student_data.dart';
import 'package:bells_mirror/utils/locator.dart';

abstract class NotificationService {
  Stream<List<NotificationData>> listenForStudentData();
}

class NotificationServiceFake extends NotificationService {
  @override
  Stream<List<NotificationData>> listenForStudentData() async* {
    yield [
      NotificationData(
          type: 0,
          title: "Take Peciline",
          time: DateTime.now().millisecondsSinceEpoch),


      NotificationData(
          type: 0,
          title: "Take Paracetamol",
          time: DateTime.now().millisecondsSinceEpoch),


      NotificationData(
          type: 1,
          title: "Appointment Approved",
          time: DateTime.now().millisecondsSinceEpoch),
    ];
  }
}

class NotificationServiceReal extends NotificationService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  AuthService _authService = locator<AuthService>();

  @override
  Stream<List<NotificationData>> listenForStudentData() async* {
    _authService.currentUserId();

    yield* firestore
        .collection("users")
        .doc(_authService.currentUserId())
        .collection("notifications")
        .snapshots()
        .map((event) => mapData(event.docs));
  }

  List<NotificationData> mapData(List<DocumentSnapshot> data) {
    if (data == null) return [];

    List<NotificationData> dataList = [];

    data.forEach((element) {
      dataList.add(NotificationData.fromMap(element.data()));
    });

    return dataList;
  }
}
