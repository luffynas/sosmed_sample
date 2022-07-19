import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sosmed_sample/theme/app_icons.dart';
import 'package:sosmed_sample/theme/style.dart';

class TermConditionView extends StatefulWidget {
  const TermConditionView({Key? key}) : super(key: key);

  @override
  State<TermConditionView> createState() => _TermConditionViewState();
}

class _TermConditionViewState extends State<TermConditionView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Syarat Dan Ketentuan', style: AppStyle.appBarTitle),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(AppIcons.ic_more_vertical),
          ),
        ],
      ),
      body: Container(
        child: const Text('Body Syarat Dan Ketentuan', style: AppStyle.medium),
      ),
    );
  }
}
