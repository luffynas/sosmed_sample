import 'package:flutter/material.dart';
import 'package:progressive_image/progressive_image.dart';

class ImageWidget extends StatelessWidget {
  final String placeholder;
  final String thumbnail;
  final String image;
  final double width;
  final double height;
  final BoxFit fit;
  final BorderRadius radius;
  const ImageWidget({
    Key? key,
    required this.placeholder,
    required this.thumbnail,
    required this.image,
    required this.width,
    required this.height,
    this.radius = const BorderRadius.all(Radius.circular(0)),
    this.fit = BoxFit.fill,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      borderRadius: radius,
      child: image != ""
          ? ProgressiveImage.assetNetwork(
              placeholder: placeholder,
              thumbnail: thumbnail,
              image: image,
              width: width,
              height: height,
              fit: fit,
            )
          : Image.asset(
              placeholder,
              fit: fit,
              width: width,
              height: height,
            ),
    );
  }
}
