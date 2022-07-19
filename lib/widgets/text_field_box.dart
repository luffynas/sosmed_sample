import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sosmed_sample/theme/color.dart';
import 'package:sosmed_sample/theme/style.dart';
// class TextFieldBox extends StatefulWidget {
//   final bool readOnly;
//   final bool enable;
//   final TextInputType textInputType;
//   final ValueChanged? onSubmited;
//   final ValueChanged? onChanged;
//   final String? helperText;
//   final String? labelText;
//   final bool obscureText;
//   final bool sufficIcon;
//   final int maxLines;
//   final TextEditingController? textController;

//   const TextFieldBox({
//     Key? key,
//     required this.labelText,
//     this.readOnly = false,
//     this.enable = true,
//     this.textInputType = TextInputType.name,
//     this.onSubmited,
//     this.onChanged,
//     this.helperText,
//     this.textController,
//     this.obscureText = false,
//     this.sufficIcon = false,
//     this.maxLines = 1,
//   }) : super(key: key);

//   @override
//   _TextFieldBoxState createState() => _TextFieldBoxState(this.obscureText);
// }

// class _TextFieldBoxState extends State<TextFieldBox> {
//   bool obscureText = true;
//   _TextFieldBoxState(this.obscureText);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       mainAxisAlignment: MainAxisAlignment.start,
//       children: [
//         Visibility(
//           child: Padding(
//             padding: EdgeInsets.symmetric(vertical: 4),
//             child: Text(
//               widget.labelText!,
//               style: AppStyle.medium12,
//               textScaleFactor: 1,
//             ),
//           ),
//           visible: widget.labelText != null,
//         ),
//         TextField(
//           controller: widget.textController ?? TextEditingController(),
//           cursorHeight: 24,
//           decoration: InputDecoration(
//             // helperText: widget.helperText,
//             // helperStyle: AppStyle.standart10,
//             floatingLabelBehavior: FloatingLabelBehavior.always,
//             errorStyle: AppStyle.errorStyle,
//             counter: Offstage(),
//             suffixIcon: Visibility(
//               child: _passwordWidget(obscureText),
//               visible: widget.sufficIcon,
//             ),
//             contentPadding: EdgeInsets.only(
//               top: 4,
//               bottom: 4,
//               left: 10,
//               right: 10,
//             ),
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(4),
//               borderSide: BorderSide(
//                 color: AppColors.borderTextField,
//                 width: 1,
//               ),
//             ),
//             enabledBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(8),
//               borderSide: BorderSide(
//                 color: AppColors.borderTextField,
//                 width: 1,
//               ),
//             ),
//             disabledBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(8),
//               borderSide: BorderSide(
//                 color: AppColors.border,
//                 width: 1,
//               ),
//             ),
//             errorBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(8),
//               borderSide: BorderSide(
//                 color: AppColors.error,
//                 width: 1,
//               ),
//             ),
//             focusedBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(8),
//               borderSide: BorderSide(
//                 color: AppColors.primary,
//                 width: 1,
//               ),
//             ),
//           ),
//           textInputAction: TextInputAction.next,
//           enabled: widget.enable,
//           style: AppStyle.medium14,
//           maxLength: 25,
//           maxLines: widget.maxLines,
//           autocorrect: false,
//           obscureText: obscureText,
//           keyboardType: widget.textInputType,
//           enableSuggestions: true,
//           onEditingComplete: () {},
//           onSubmitted: widget.onSubmited,
//           onChanged: widget.onChanged,
//           readOnly: widget.readOnly,
//         ),
//       ],
//     );
//   }

//   Widget _passwordWidget(bool obscureText) {
//     return GestureDetector(
//       onTap: () {
//         setState(() {
//           this.obscureText = !obscureText;
//         });
//       },
//       child: this.obscureText
//           ? Icon(
//               Icons.remove_red_eye_rounded,
//               color: AppColors.divider,
//             )
//           : Icon(
//               Icons.remove_red_eye,
//               color: Colors.green,
//             ),
//     );
//     // if (obscureText) {
//     //   return Icon(
//     //     Icons.remove_red_eye,
//     //     color: Colors.green,
//     //   );
//     // } else {
//     //   return Icon(
//     //     Icons.remove_red_eye_rounded,
//     //     color: Colors.green,
//     //   );
//     // }
//   }
// }

class TextFieldBox extends StatelessWidget {
  final bool readOnly;
  final bool enable;
  final TextInputType textInputType;
  final TextInputType keyboardType;
  final ValueChanged? onSubmited;
  final ValueChanged? onChanged;
  final String labelText;
  final String labelTextRight;
  final TextEditingController? textController;
  final TextInputAction textInputAction;
  final bool obscureText;
  final String? obscuringCharacter;
  final int maxLines;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final double radius;
  final bool isDense;
  final String? hintText;
  final VoidCallback? onLabelPressed;
  final InputDecoration? inputDecoration;
  final BoxDecoration? wrappedBorder;
  final EdgeInsetsGeometry? wrappedBorderPadding;
  final FocusNode? focusNode;
  final int? maxLength;
  final InputCounterWidgetBuilder? buildCounter;
  final List<TextInputFormatter>? inputFormatters;
  final String? helperText;

  const TextFieldBox({
    Key? key,
    this.readOnly = false,
    this.enable = true,
    this.textInputType = TextInputType.name,
    this.onSubmited,
    this.onChanged,
    this.labelText = '',
    this.labelTextRight = '',
    this.textController,
    this.textInputAction = TextInputAction.next,
    this.obscureText = false,
    this.obscuringCharacter,
    this.maxLines = 1,
    this.suffixIcon,
    this.prefixIcon,
    this.radius = 10.0,
    this.isDense = false,
    this.hintText,
    this.keyboardType = TextInputType.text,
    this.onLabelPressed,
    this.inputDecoration,
    this.wrappedBorder,
    this.wrappedBorderPadding,
    this.focusNode,
    this.maxLength,
    this.buildCounter,
    this.inputFormatters,
    this.helperText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Visibility(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  labelText,
                  style: AppStyle.caption.copyWith(
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              visible: labelText.isNotEmpty,
            ),
            Visibility(
              child: GestureDetector(
                onTap: onLabelPressed,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    labelTextRight,
                    style: AppStyle.medium.copyWith(
                      color: AppColors.primary,
                    ),
                  ),
                ),
              ),
              visible: labelTextRight.isNotEmpty,
            ),
          ],
        ),
        Container(
          decoration: wrappedBorder,
          padding: wrappedBorderPadding,
          child: TextField(
            inputFormatters: inputFormatters,
            maxLength: maxLength,
            buildCounter: buildCounter,
            controller: textController,
            focusNode: focusNode,
            decoration: inputDecoration ??
                InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  // contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 14),
                  // isDense: true,
                  filled: true,
                  suffixIcon: suffixIcon,
                  prefixIcon: prefixIcon,
                  isDense: isDense,
                  hintText: hintText,
                  helperText: helperText,
                  helperStyle: AppStyle.caption.copyWith(
                    fontWeight: FontWeight.w400,
                  ),
                  fillColor: readOnly ? const Color(0xFFDDEEFF) : Colors.white,
                  hintStyle: AppStyle.medium.copyWith(color: Color(0xFFc0c3cb)),
                  // border: UnderlineInputBorder(
                  //   borderRadius: BorderRadius.circular(radius),
                  //   borderSide: BorderSide(
                  //     color: AppColors.divider,
                  //     width: 1,
                  //   ),
                  // ),
                  // enabledBorder: UnderlineInputBorder(
                  //   borderRadius: BorderRadius.circular(radius),
                  //   borderSide: BorderSide(
                  //     color: Colors.transparent,
                  //   ),
                  // ),
                  // disabledBorder: UnderlineInputBorder(
                  //   borderRadius: BorderRadius.circular(radius),
                  //   borderSide: BorderSide(
                  //     color: Colors.transparent,
                  //   ),
                  // ),
                  // errorBorder: UnderlineInputBorder(
                  //   borderRadius: BorderRadius.circular(radius),
                  //   borderSide: BorderSide(
                  //     color: Colors.red,
                  //   ),
                  // ),
                  // focusedBorder: UnderlineInputBorder(
                  //   borderRadius: BorderRadius.circular(radius),
                  //   borderSide: BorderSide(
                  //     color: Colors.transparent,
                  //   ),
                  // ),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    borderSide: BorderSide(
                      color: AppColors.dividerPrimary,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    borderSide: BorderSide(
                      color: readOnly
                          ? Colors.transparent
                          : AppColors.dividerPrimary,
                    ),
                  ),
                  disabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    borderSide: BorderSide(
                      color: AppColors.divider,
                    ),
                  ),
                  errorBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    borderSide: BorderSide(
                      color: Colors.red,
                    ),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    borderSide: BorderSide(
                      color: AppColors.dividerPrimary,
                    ),
                  ),
                ),
            textInputAction: textInputAction,
            enabled: enable,
            style: AppStyle.standart.copyWith(fontSize: 16),
            maxLines: maxLines,
            autocorrect: false,
            keyboardType: keyboardType,
            enableSuggestions: true,
            onEditingComplete: () {},
            onSubmitted: onSubmited,
            onChanged: onChanged,
            readOnly: readOnly,
            obscureText: obscureText,
            // obscuringCharacter: this.obscuringCharacter,
          ),
        ),
      ],
    );
  }
}
