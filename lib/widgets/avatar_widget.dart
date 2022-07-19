import 'package:flutter/material.dart';
import 'package:sosmed_sample/widgets/image_widget.dart';

class AvatarWidget extends StatelessWidget {
  const AvatarWidget({
    super.key,
    this.width = 32.0,
    this.heigh = 32.0,
    this.radius = 100,
    this.thumbnailUrl = 'https://picsum.photos/seed/picsum/200/300',
    this.url = 'https://picsum.photos/seed/picsum/200/300',
  });

  final double width;
  final double heigh;
  final String? thumbnailUrl;
  final String? url;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      borderRadius: BorderRadius.all(Radius.circular(radius)),
      child: ImageWidget(
        placeholder: 'assets/images/placeholder/ic_default_avatar.png',
        thumbnail: url ?? '',
        image: url ?? '',
        width: width,
        height: heigh,
      ),
    );
  }
}
