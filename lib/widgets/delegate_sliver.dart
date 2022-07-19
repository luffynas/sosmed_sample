import 'package:flutter/material.dart';

class SliverDelegate extends SliverPersistentHeaderDelegate {
  final Widget? child;
  final double height;

  SliverDelegate({this.child, this.height = 150});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child ?? const SizedBox();
  }

  @override
  double get maxExtent => height;

  @override
  double get minExtent => 60;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
