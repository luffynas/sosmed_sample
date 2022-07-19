import 'dart:developer';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_image/flutter_native_image.dart';
import 'package:sosmed_sample/widgets/crop_widget.dart';
import 'package:image_picker/image_picker.dart';
// import  'package:images_picker/images_picker.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

Future<File?> chooseImage(ImageSource source, {bool isCompress = false}) async {
  final ImagePicker _picker = ImagePicker();
  var imageFile = await _picker.pickImage(source: source, imageQuality: 80);
  if (imageFile != null) {
    if (isCompress) {
      return await FlutterNativeImage.compressImage(
        imageFile.path,
        quality: 50,
      );
    } else {
      return File(imageFile.path);
    }
  } else {
    return null;
  }
}

Future<File?> chooseVideo({ImageSource source = ImageSource.gallery}) async {
  final ImagePicker _picker = ImagePicker();
  // var imageFile = await _picker.pickVideo(
  //   source: source,
  //   maxDuration: Duration(minutes: 5),
  // );
  // return imageFile;
  final assets = await FilePicker.platform.pickFiles(type: FileType.video);
  if (assets != null) {
    return File(assets.files.single.path!);
  }
}

Future<List<int>> chooseImageAsByte(ImageSource source) async {
  final ImagePicker _picker = ImagePicker();
  var imageFile = await _picker.pickImage(
      source: source,
      imageQuality: 80); //getImage(source: source, imageQuality: 80);
  // final File file = File(imageFile!.path);
  // //print("image ${file.path}");
  return imageFile!.readAsBytes(); //file.readAsBytes();
}

Future<List<AssetEntity>?> chooseMultipleImage(BuildContext context,
    {int maxAssets = 5}) async {
  // return await ImagesPicker.pick(count: 5);
  return await AssetPicker.pickAssets(
    context,
    pickerConfig: AssetPickerConfig(
      maxAssets: maxAssets,
      textDelegate: EnglishAssetPickerTextDelegate(),
    ),
  );
}

Future<void> cropImage(
  BuildContext context, {
  required String path,
  double aspectRatio = 1.0,
  Function(File)? onSave,
}) async {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => CropWidget(
        path: path,
        aspectRatio: aspectRatio,
        onSave: (file) async {
          if (file.existsSync()) {
            log("CropWidget file exist");
            //print("save $file");
            final compressedFile = await FlutterNativeImage.compressImage(
              file.path,
              quality: 50,
            );
            onSave!(compressedFile);
            file.deleteSync();
          }
          // return compressedFile;
        },
      ),
    ),
  );
}
