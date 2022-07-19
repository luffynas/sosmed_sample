import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sosmed_sample/theme/app_icons.dart';
import 'package:sosmed_sample/theme/style.dart';

class AboutUsView extends StatefulWidget {
  const AboutUsView({Key? key}) : super(key: key);

  @override
  State<AboutUsView> createState() => _AboutUsViewState();
}

class _AboutUsViewState extends State<AboutUsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tentang Edtrons', style: AppStyle.appBarTitle),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(AppIcons.ic_more_vertical),
          ),
        ],
      ),
      body: Container(
        child: const Text('Body About Edtrons', style: AppStyle.medium),
      ),
    );
  }
}
