import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sosmed_sample/theme/app_icons.dart';
import 'package:sosmed_sample/theme/style.dart';

class PrivacyPolicyView extends StatefulWidget {
  const PrivacyPolicyView({Key? key}) : super(key: key);

  @override
  State<PrivacyPolicyView> createState() => _PrivacyPolicyViewState();
}

class _PrivacyPolicyViewState extends State<PrivacyPolicyView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kebijakan', style: AppStyle.appBarTitle),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(AppIcons.ic_more_vertical),
          ),
        ],
      ),
      body: Container(
        child: const Text('Body Kebijakan', style: AppStyle.medium),
      ),
    );
  }
}
