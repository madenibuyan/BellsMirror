import 'dart:async';
import 'package:multi_image_picker/multi_image_picker.dart';

abstract class PickImageService {
  Future<Asset> selectImage();
}
class PickImageServiceReal implements PickImageService{
  @override
  Future<Asset> selectImage() async {

    List<Asset> resultList =  [];
    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 1,
      );
    } on Exception catch (e) {
      print(e);
    }

    if(resultList.isEmpty) return null;

    return resultList[0];

  }

}