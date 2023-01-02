import 'package:bells_mirror/datamodel/news_model.dart';
import 'package:bells_mirror/utils/test_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

abstract class BookmarkService {
  Stream<List<NewsModel>> listenForNewsService();

  Future<void> addNews({NewsModel news});

  Future<void> deleteNews({String documentId, String path});
}

class BookmarkServiceFake extends BookmarkService {
  @override
  Future<void> addNews({NewsModel news}) {}

  @override
  Future<void> deleteNews({String documentId, String path}) {}

  @override
  Stream<List<NewsModel>> listenForNewsService() async* {
    yield TestData.fakeNews();
  }
}

class BookmarkServiceReal extends BookmarkService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Future<void> addNews({NewsModel news}) async {

    print("Added to bookmark");

    await firestore.collection("bookmark").doc(news.documentId).set(news.toMap());
  }

  @override
  Future<void> deleteNews({String documentId, String path}) async {
    await firestore.collection("bookmark").doc(documentId).delete();

  }

  @override
  Stream<List<NewsModel>> listenForNewsService() async* {
    yield* firestore
        .collection("bookmark")
        .snapshots()
        .map((event) => mapData(event.docs));
  }

  List<NewsModel> mapData(List<QueryDocumentSnapshot> docs) {
    List<NewsModel> news = [];

    docs.forEach((element) {
      news.add(NewsModel.fromMap(element.data()));
    });

    return news;
  }
}
