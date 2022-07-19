import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sosmed_sample/theme/style.dart';

typedef OnRadioValue(Object value);
typedef OnRadioChanged(Object? value);

class CustomRadioButton extends StatelessWidget {
  final String title;
  final Object groupValue;
  final Object onValue;
  final OnRadioChanged? onRadioChanged;
  const CustomRadioButton({
    super.key,
    required this.title,
    required this.onValue,
    required this.groupValue,
    this.onRadioChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Radio(
          value: onValue,
          groupValue: groupValue,
          onChanged: onRadioChanged,
        ),
        Text(title, style: AppStyle.medium),
      ],
    );
  }
}
