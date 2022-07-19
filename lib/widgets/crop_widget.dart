import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sosmed_sample/theme/color.dart';
import 'package:sosmed_sample/theme/style.dart';
import 'package:sosmed_sample/utils/cropperx.dart';

import 'progress_loader.dart';
// import 'progress_loader.dart';

class CropWidget extends StatefulWidget {
  final String path;
  final double aspectRatio;
  final Function(File)? onSave;
  const CropWidget(
      {Key? key, required this.path, this.aspectRatio = 1.0, this.onSave})
      : super(key: key);

  @override
  _CropWidgetState createState() => _CropWidgetState();
}

class _CropWidgetState extends State<CropWidget> {
  final GlobalKey _cropperKey = GlobalKey(debugLabel: 'cropperKey');
  int _rotationTurns = 0;
  double _zoomScale = 1.0;

  @override
  void initState() {
    super.initState();
    // controller.aspectRatio = widget.aspectRatio;
  }

  void _cropImage() async {
    showLoading(context, 'Please Wait...');
    final imageBytes = await Cropper.crop(
      cropperKey: _cropperKey,
    );

    if (imageBytes != null) {
      dissmissLoading(context);
      final tempFile = File(
          "${(await getTemporaryDirectory()).path}/crop_${DateTime.now().millisecondsSinceEpoch}.png");
      final file = await tempFile.writeAsBytes(imageBytes);
      widget.onSave!(file);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      // appBar: AppBar(
      //   title: Text(
      //     'Crop',
      //     style: AppStyle.appBarTitle.copyWith(
      //       color: AppColors.primary,
      //     ),
      //   ),
      // ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    // final _imageData = File(widget.path).readAsBytesSync();
    return Column(
      children: <Widget>[
        Expanded(
          child: Container(
            color: Colors.black,
            padding: const EdgeInsets.all(8),
            child: Cropper(
              cropperKey: _cropperKey,
              overlayType: OverlayType.rectangle,
              rotationTurns: _rotationTurns,
              image: Image.file(
                File(widget.path),
                fit: BoxFit.contain,
              ),
              aspectRatio: widget.aspectRatio,
              backgroundColor: Colors.black,
              gridLineThickness: 1,
              // overlayColor: Colors.white,
              zoomScale: _zoomScale,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            TextButton(
              onPressed: () async {
                Navigator.pop(context);
              },
              child: Text(
                'Cancel',
                style: AppStyle.button.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            IconButton(
              color: AppColors.primary,
              icon: const Icon(Icons.rotate_left),
              tooltip: 'Rotate Left',
              onPressed: () {
                setState(() {
                  _rotationTurns -= 45;
                });
              },
            ),
            IconButton(
              color: AppColors.primary,
              icon: const Icon(Icons.undo),
              tooltip: 'Reset',
              onPressed: () {
                // controller.rotation = 0;
                // controller.scale = 1;
                // controller.offset = Offset.zero;
                setState(() {
                  _zoomScale = 1.0;
                  _rotationTurns = 0;
                });
              },
            ),
            IconButton(
              color: AppColors.primary,
              icon: const Icon(
                Icons.rotate_right,
              ),
              tooltip: 'Rotate right',
              onPressed: () {
                setState(() {
                  _rotationTurns += 45;
                });
              },
            ),
            TextButton(
              onPressed: () async {
                _cropImage();
              },
              child: Text(
                'Done',
                style: AppStyle.button.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
