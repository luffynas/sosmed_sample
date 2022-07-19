import 'package:flutter/material.dart';
import 'package:sosmed_sample/theme/color.dart';
import 'package:sosmed_sample/theme/style.dart';

class TextFieldUnderline extends StatelessWidget {
  final bool readOnly;
  final bool enable;
  final TextInputType textInputType;
  final TextInputAction? textInputAction;
  final ValueChanged? onSubmited;
  final ValueChanged? onChanged;
  final String? helperText;
  final String labelText;
  final String? hintText;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  final bool disableCounter;
  final bool disableHelper;
  final bool disableLabel;
  final TextEditingController? textController;

  const TextFieldUnderline({
    Key? key,
    this.readOnly = false,
    this.enable = true,
    this.textInputType = TextInputType.name,
    this.textInputAction = TextInputAction.next,
    this.onSubmited,
    this.onChanged,
    this.helperText,
    this.hintText,
    this.maxLines,
    this.minLines = 1,
    this.maxLength = 25,
    required this.labelText,
    this.textController,
    this.disableCounter = false,
    this.disableHelper = false,
    this.disableLabel = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textController ?? TextEditingController(),
      cursorHeight: 24,
      decoration: InputDecoration(
        labelText: disableLabel ? labelText : null,
        labelStyle: AppStyle.labelStyle,
        helperText: disableHelper ? helperText : null,
        helperStyle: AppStyle.standart10,
        hintText: hintText,
        hintStyle: AppStyle.standart14,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        errorStyle: AppStyle.errorStyle,
        contentPadding: EdgeInsets.only(top: 4, bottom: 4),
        counter: disableCounter ? Offstage() : null,
        border: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(
            color: AppColors.border,
            width: 2,
          ),
        ),
        enabledBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(
            color: AppColors.primary,
            width: 2,
          ),
        ),
        disabledBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(
            color: AppColors.border,
            width: 2,
          ),
        ),
        errorBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(
            color: AppColors.error,
            width: 2,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(
            color: AppColors.primary,
            width: 2,
          ),
        ),
      ),
      textInputAction: textInputAction,
      enabled: enable,
      style: AppStyle.medium14,
      maxLength: maxLength,
      maxLines: maxLines,
      minLines: minLines,
      autocorrect: false,
      keyboardType: textInputType,
      enableSuggestions: true,
      onEditingComplete: () {},
      onSubmitted: onSubmited,
      onChanged: onChanged,
      readOnly: readOnly,
    );
  }
}
