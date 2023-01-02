import 'dart:async';

import 'package:bells_mirror/datamodel/deggia_image_class.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:multi_image_picker/multi_image_picker.dart';


abstract class UploadImageService {
  Future<String> uploadImage({Asset asset, String reference});

  Future<DeggiaImageClass> uploadImageCollection({Asset asset, String reference});
}

class UploadImageServiceReal implements UploadImageService {
  @override
  Future<String> uploadImage({Asset asset, String reference}) async {



    ByteData byteData = await asset.getByteData(
        quality: 50); // requestOriginal is being deprecated
    List<int> imageData = byteData.buffer.asUint8List();
    StorageReference ref = FirebaseStorage()
        .ref()
        .child(reference); // To be aligned with the latest firebase API(4.0)



    StorageUploadTask uploadTask = ref.putData(imageData);

    StorageTaskSnapshot snapshot = await uploadTask.onComplete;

    String url;
    if (snapshot != null) {
      url = await snapshot.ref.getDownloadURL();
    }
    return url;
  }

  @override
  Future<DeggiaImageClass> uploadImageCollection({Asset asset, String reference}) async {


    ByteData byteData = await asset.getByteData(
        quality: 50); // requestOriginal is being deprecated
    List<int> imageData = byteData.buffer.asUint8List();
    StorageReference ref = FirebaseStorage()
        .ref()
        .child(reference); // To be aligned with the latest firebase API(4.0)



    StorageUploadTask uploadTask = ref.putData(imageData);

    StorageTaskSnapshot snapshot = await uploadTask.onComplete;

    DeggiaImageClass imageClass;




    if (snapshot != null) {
      String url = await snapshot.ref.getDownloadURL();

      imageClass = DeggiaImageClass(
        url: url,
        ref: ref.path
      );
    }


    return imageClass;
  }
}
