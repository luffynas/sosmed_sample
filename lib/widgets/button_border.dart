import 'package:flutter/material.dart';
import 'package:sosmed_sample/theme/color.dart';
import 'package:sosmed_sample/theme/style.dart';

enum ButtonType { big, standard, small }

class ButtonBorder extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;
  final ButtonType buttonType;
  final bool isFill;
  final bool value;
  final bool leftIcon;
  final bool rightIcon;
  final Color? color;
  final Color? textColor;
  final Color? borderColor;
  final double minWidth;
  final double radius;
  final IconData? icon;
  final IconData? iconRight;
  final String? iconImage;
  const ButtonBorder({
    Key? key,
    required this.title,
    this.buttonType = ButtonType.standard,
    this.onPressed,
    this.isFill = false,
    this.value = false,
    this.leftIcon = false,
    this.rightIcon = false,
    this.color,
    this.textColor = AppColors.textPrimary,
    this.borderColor,
    this.minWidth = 24.0,
    this.radius = 8,
    this.icon,
    this.iconRight,
    this.iconImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (buttonType == ButtonType.small) {
      return isFill ? _buttonSmallFill2() : _buttonSmall();
    } else if (buttonType == ButtonType.big) {
      return isFill ? _buttonBigFill() : _buttonBig();
    } else {
      return isFill ? _buttonStandardFill() : _buttonStandard();
    }
  }

  Widget _buttonSmall() {
    return OutlinedButtonTheme(
      data: OutlinedButtonThemeData(
        style: ButtonStyle(
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          minimumSize: MaterialStateProperty.all<Size>(Size(minWidth, 30)),
          textStyle: MaterialStateProperty.all<TextStyle>(
            TextStyle(color: _textColor()),
          ),
          side: MaterialStateProperty.all<BorderSide>(
            BorderSide(color: _borderColor()),
          ),
          shape: MaterialStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(radius),
              ),
            ),
          ),
        ),
      ),
      child: OutlinedButton(
        onPressed: onPressed,
        child: Text(
          title,
          style: AppStyle.standart12.copyWith(color: _textColor()),
        ),
      ),
    );
  }

  Widget _buttonSmallFill() {
    return ButtonTheme(
      height: 32,
      minWidth: minWidth,
      child: RaisedButton(
        onPressed: onPressed,
        child: Text(
          title,
          style: AppStyle.standart12.copyWith(color: _textColorFill()),
        ),
        textColor: _textColorFill(),
        color: color != null ? _borderCustomColor() : _borderColor(),
        // borderSide: BorderSide(color: _borderColor()),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(radius),
          ),
        ),
      ),
    );
  }

  Widget _buttonSmallFill2() {
    return Container(
      height: 30,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          title,
          style: AppStyle.standart12.copyWith(color: _textColorFill()),
        ),
        style: ElevatedButton.styleFrom(
          elevation: 0,
          primary: value ? AppColors.primary : AppColors.textCaption,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(radius),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buttonStandard() {
    return OutlinedButtonTheme(
      data: OutlinedButtonThemeData(
          style: ButtonStyle(
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        minimumSize: MaterialStateProperty.all<Size>(Size(minWidth, 32)),
        textStyle: MaterialStateProperty.all<TextStyle>(
          TextStyle(color: _textColor()),
        ),
        side: MaterialStateProperty.all<BorderSide>(
          BorderSide(color: _borderColor()),
        ),
        shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(radius),
            ),
          ),
        ),
      )),
      child: OutlinedButton(
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: AppStyle.standart14,
              ),
              Visibility(
                visible: icon != null || iconImage != null,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: icon != null
                      ? Icon(icon)
                      : Image.asset(
                          iconImage ?? "",
                          width: 24,
                          height: 24,
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buttonStandardFill() {
    return ButtonTheme(
      minWidth: minWidth,
      padding: EdgeInsets.all(0),
      child: RaisedButton(
        onPressed: onPressed,
        textColor: _textColorFill(),
        color: color != null ? _borderCustomColor() : _borderColor(),
        padding: const EdgeInsets.symmetric(horizontal: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(radius),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Visibility(
              visible: icon != null || iconImage != null,
              child: icon != null
                  ? Icon(icon)
                  : Image.asset(
                      iconImage ?? '',
                      width: 24,
                      height: 24,
                    ),
            ),
            if (icon != null || iconImage != null)
              Expanded(
                child: Text(
                  title,
                  style: AppStyle.standart14.copyWith(color: _textColorFill()),
                  textAlign: TextAlign.center,
                ),
              )
            else
              Text(
                title,
                style: AppStyle.standart14.copyWith(color: _textColorFill()),
              ),
            Visibility(visible: iconRight != null, child: Icon(iconRight)),
          ],
        ),
      ),
    );
  }

  Widget _buttonBig() {
    return OutlinedButtonTheme(
      data: OutlinedButtonThemeData(
          style: ButtonStyle(
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        minimumSize: MaterialStateProperty.all<Size>(Size(minWidth, 50)),
        textStyle: MaterialStateProperty.all<TextStyle>(
          TextStyle(color: _textColor()),
        ),
        side: MaterialStateProperty.all<BorderSide>(
          BorderSide(color: borderColor ?? _borderColor()),
        ),
        shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(radius),
            ),
          ),
        ),
      )),
      child: OutlinedButton(
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Visibility(
              visible: leftIcon && (icon != null || iconImage != null),
              child: icon != null
                  ? Icon(icon)
                  : Image.asset(
                      iconImage ?? "",
                      width: 24,
                      height: 24,
                    ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: leftIcon ? 8 : 0,
                right: rightIcon ? 8 : 0,
              ),
              child: Text(
                title,
                style: AppStyle.standart14.copyWith(color: textColor),
              ),
            ),
            Visibility(
              visible: rightIcon && (icon != null || iconImage != null),
              child: icon != null
                  ? Icon(icon)
                  : Image.asset(
                      iconImage ?? "",
                      width: 24,
                      height: 24,
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buttonBigFill() {
    return ButtonTheme(
      height: 50,
      minWidth: minWidth,
      child: RaisedButton(
        onPressed: onPressed,
        child: Text(
          title,
          style: AppStyle.standart14.copyWith(color: _textColorFill()),
        ),
        textColor: _textColorFill(),
        color: color != null ? _borderCustomColor() : _borderColor(),
        // borderSide: BorderSide(color: _borderColor()),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(radius),
          ),
        ),
      ),
    );
  }

  Color _borderColor() =>
      onPressed == null ? Color(0xFFE9ECEF) : AppColors.primary;

  Color _borderCustomColor() => onPressed == null ? Color(0xFFE9ECEF) : color!;

  Color _textColor() =>
      onPressed == null ? Color(0xFF8D97AD) : AppColors.primary;

  Color _textColorFill() => onPressed == null
      ? Color.fromARGB(255, 27, 27, 27)
      : textColor ?? Colors.white;
}
