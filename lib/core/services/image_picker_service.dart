import 'dart:io';

import 'package:image_picker/image_picker.dart';

class ImagePickerService {
  ImagePickerService._();

  static Future pickImageFromCamera() async {
    File image;
    final picker = ImagePicker();
    var _pickedFile = await picker.pickImage(
      source: ImageSource.camera,
    );

    image = File(_pickedFile!.path);
    return image;
  }

  static Future pickImageFromGallery() async {
    File image;
    final picker = ImagePicker();
    var _pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );

    image = File(_pickedFile!.path);
    return image;
  }
}
