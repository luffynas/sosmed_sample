import 'package:flutter/material.dart';
import 'package:sosmed_sample/modules/walkthrough/component/ornament_left.dart';

import 'component/ornament_midle.dart';
import 'component/ornament_right.dart';
import 'walkthrough_view.dart';
import 'walktrough_item.dart';

class WalkthroughScreen extends StatelessWidget {
  const WalkthroughScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WalkthroughView(
      walkthroughList: [
        _welcomeScreen1(),
        _welcomeScreen2(),
        _welcomeScreen3(),
      ],
    );
  }
}

WalkthroughItem _welcomeScreen1() {
  return WalkthroughItem(
    title: 'Technosantra',
    content: 'Solusi untuk membantu dan memudahkan bisnis anda.',
    imageContent: 'assets/images/walkthrough/walkhtrough_1.png',
    painter: OrnamentLeftPainter(),
  );
}

WalkthroughItem _welcomeScreen2() {
  return WalkthroughItem(
    title: 'Portofolio',
    content:
        'Sebagai Software House yang merancang dan mengembangkan web app, mobile app, dan PWA sejak 2013, kami telah dipercaya oleh klien kami dari Amerika, Eropa, Australia, dan Asia.',
    imageContent: 'assets/images/walkthrough/walkhtrough_2.png',
    painter: OrnamentMidlePainter(),
  );
}

WalkthroughItem _welcomeScreen3() {
  return WalkthroughItem(
    title: 'Punya Project atau Ingin Membuat Aplikasi?',
    content:
        'Hubungi kami segera dan konsultasikan kebutuhan digital untuk bisnis Anda lebih lanjut.',
    imageContent: 'assets/images/walkthrough/walkhtrough_3.png',
    painter: OrnamentRightPainter(),
  );
}
