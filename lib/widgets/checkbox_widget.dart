import 'package:sosmed_sample/theme/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CheckBoxWidget extends StatelessWidget {
  final String title;
  final bool value;
  final ValueChanged onChanged;
  const CheckBoxWidget({
    Key? key,
    required this.title,
    required this.onChanged,
    this.value = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 32,
          height: 32,
          child: Checkbox(
            value: value,
            onChanged: onChanged,
          ),
        ),
        Text(title, style: AppStyle.standart),
      ],
    );
  }
}
