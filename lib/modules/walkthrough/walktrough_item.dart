import 'package:flutter/material.dart';
import 'package:sosmed_sample/theme/color.dart';
import 'package:sosmed_sample/theme/style.dart';

class WalkthroughItem extends StatefulWidget {
  const WalkthroughItem({
    this.title = '',
    this.content = '',
    this.imageContent = '',
    this.imageIcon = '',
    this.imagecolor = Colors.redAccent,
    this.painter,
  });

  final String title;
  final String content;
  final String imageContent;
  final String imageIcon;
  final Color imagecolor;
  final CustomPainter? painter;

  @override
  _WalkthroughItemState createState() {
    return new _WalkthroughItemState();
  }
}

class _WalkthroughItemState extends State<WalkthroughItem>
    with SingleTickerProviderStateMixin {
  late Animation animation;
  late AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    animation = Tween(begin: -250, end: 0.0).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.easeInOut,
    ));

    animation.addListener(() => setState(() {}));

    animationController.forward();

    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _buildContext1();
  }

  Widget _buildContext1() {
    final WIDTH = MediaQuery.of(context).size.width;
    final HEIGHT = (WIDTH * 0.9805555555555555).toDouble();
    return Container(
      // padding: EdgeInsets.only(top: 20.0),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: CustomPaint(
              size: Size(WIDTH, HEIGHT),
              painter: widget.painter,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 96, horizontal: 32),
            child: Align(
              alignment: Alignment.topCenter,
              child: Image.asset(widget.imageContent),
            ),
          ),
          Positioned(
            top: HEIGHT,
            left: 0,
            right: 0,
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 32),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      widget.title,
                      style: AppStyle.medium.copyWith(
                        fontSize: 24,
                        color: AppColors.primary,
                      ),
                      textAlign: TextAlign.center,
                      textScaleFactor: 1,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 64),
                    child: Text(
                      widget.content,
                      style: AppStyle.standart14.copyWith(
                        letterSpacing: 0.25,
                        color: AppColors.textSecondary,
                      ),
                      textScaleFactor: 1,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
