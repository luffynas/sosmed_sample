import 'package:sosmed_sample/theme/color.dart';
import 'package:flutter/material.dart';

class DividerWidget extends StatelessWidget {
  final double height;
  final Color? color;
  const DividerWidget({Key? key, this.height = 1, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      color: color ?? AppColors.divider,
    );
  }
}
