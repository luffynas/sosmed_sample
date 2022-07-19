import 'package:sosmed_sample/theme/color.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Stack(
        // fit: StackFit.loose,
        alignment: Alignment.center,
        children: <Widget>[
          // Container(
          //   child: Image.asset(
          //     'assets/images/splash_top.png',
          //     alignment: Alignment.center,
          //     fit: BoxFit.fitWidth,
          //   ),
          //   width: MediaQuery.of(context).size.width,
          // ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                alignment: Alignment.center,
                child: Image.asset(
                  "assets/images/edtrons_logo.png",
                  // height: 30,
                  width: MediaQuery.of(context).size.width - 150,
                ),
              ),
            ],
          ),
          // Align(
          //   alignment: Alignment.bottomCenter,
          //   child: Container(
          //     child: Image.asset(
          //       'assets/images/splash_bottom.png',
          //       alignment: Alignment.center,
          //       fit: BoxFit.fitWidth,
          //     ),
          //     width: MediaQuery.of(context).size.width,
          //   ),
          // ),
        ],
      ),
    );
  }
}
