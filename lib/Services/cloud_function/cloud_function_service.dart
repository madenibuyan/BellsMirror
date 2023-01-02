import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/material.dart';

abstract class CloudFunctionService {
  Future<dynamic> callFunction({@required String name, Map<String, dynamic> data});
}

class CloudFunctionServiceFake implements CloudFunctionService {
  @override
  Future callFunction({String name, data}) async {


    await Future.delayed(Duration(seconds: 4));

    return 1;

  }
}

class CloudFunctionServiceReal implements CloudFunctionService {
  @override
  Future callFunction({String name, Map<String, dynamic> data}) async {
    // var cloud = CloudFunctions.instance
    //     .useFunctionsEmulator(origin: "http://10.0.2.2:5001");

    HttpsCallable callable =
    FirebaseFunctions.instance.httpsCallable( name);

    var result;

    try {
      var call = await callable.call(data);

      result = call.data;

      return result;
    } catch (e) {
      print(e);
      result = -1;
    }

    return result;
  }
}
