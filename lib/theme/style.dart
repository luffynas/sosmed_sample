import 'package:flutter/material.dart';

import 'color.dart';

class AppStyle {
  static const appBarTitle = TextStyle(
    fontSize: 16,
    color: AppColors.textTitle,
    fontWeight: FontWeight.w600,
    fontFamily: 'Roboto',
    package: 'tehcnosantra_font',
  );

  static const price = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w700,
    color: AppColors.price,
    fontFamily: 'Roboto',
    package: 'tehcnosantra_font',
  );

  static const priceDiscount = TextStyle(
    color: Color(0xff969696),
    decoration: TextDecoration.lineThrough,
    decorationThickness: 1.1,
    decorationStyle: TextDecorationStyle.wavy,
    fontSize: 12,
    fontFamily: 'Roboto',
    package: 'tehcnosantra_font',
  );

  static const percentageDiscount = TextStyle(
    color: Color(0xffEC2D62),
    fontSize: 12,
    decorationThickness: 1.1,
    decorationStyle: TextDecorationStyle.wavy,
    letterSpacing: 1.5,
    fontWeight: FontWeight.w600,
    fontFamily: 'Roboto',
    package: 'tehcnosantra_font',
  );

  static const percentageDiscount10 = TextStyle(
    color: Color(0xffEC2D62),
    fontSize: 10,
    fontWeight: FontWeight.w600,
    fontFamily: 'Roboto',
    package: 'tehcnosantra_font',
  );

  static const standart = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimary,
    fontFamily: 'Roboto',
    package: 'tehcnosantra_font',
  );

  static const standart14 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimary,
    fontFamily: 'Roboto',
    package: 'tehcnosantra_font',
  );

  static const standart10 = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimary,
    fontFamily: 'Roboto',
    package: 'tehcnosantra_font',
  );

  static const standart12 = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimary,
    fontFamily: 'Roboto',
    package: 'tehcnosantra_font',
  );

  static const medium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
    fontFamily: 'Roboto',
    package: 'tehcnosantra_font',
  );

  static const medium12 = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
    fontFamily: 'Roboto',
    package: 'tehcnosantra_font',
  );

  static const medium14 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
    fontFamily: 'Roboto',
    package: 'tehcnosantra_font',
  );

  static const username = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
    fontFamily: 'Roboto',
    package: 'tehcnosantra_font',
  );

  static const titlePost = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
    fontFamily: 'Roboto',
    package: 'tehcnosantra_font',
  );

  static const textLink = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w500,
    color: AppColors.link,
    fontFamily: 'Roboto',
    package: 'tehcnosantra_font',
  );

  static const bold = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
    fontFamily: 'Roboto',
    package: 'tehcnosantra_font',
  );

  static const caption = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w300,
    color: AppColors.textCaption,
    fontFamily: 'Roboto',
    package: 'tehcnosantra_font',
  );

  static const productTitle = TextStyle(
    fontSize: 14,
    color: AppColors.textTitle,
    fontFamily: 'Roboto',
    package: 'tehcnosantra_font',
  );

  static const btnAllReview = TextStyle(
    fontSize: 10,
    color: AppColors.primary,
    fontWeight: FontWeight.w400,
    fontFamily: 'Roboto',
    package: 'tehcnosantra_font',
  );

  static const readmore = TextStyle(
    fontSize: 12,
    color: AppColors.primary,
    fontWeight: FontWeight.w400,
    fontFamily: 'Roboto',
    package: 'tehcnosantra_font',
  );

  static const errorStyle = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w300,
    color: AppColors.error,
    fontFamily: 'Roboto',
    package: 'tehcnosantra_font',
  );

  static const labelStyle = TextStyle(
    height: 1,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimary,
    fontFamily: 'Roboto',
    package: 'tehcnosantra_font',
  );

  static const button = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    fontFamily: 'Roboto',
    package: 'tehcnosantra_font',
  );
  static const buttonSmall = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    fontFamily: 'Roboto',
    package: 'tehcnosantra_font',
  );

  static Decoration cardBorder = BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(8.0)),
    border: Border.all(color: AppColors.shimmer, width: 1.0),
    color: AppColors.backgroundWhite,
    boxShadow: [
      BoxShadow(
        color: AppColors.cardShadow,
        spreadRadius: 0.2,
        blurRadius: 8,
        offset: Offset(0, 0.2),
      )
    ],
  );
}

InputDecoration inputOutlineDecorationStyle({
  String? helper,
  String? hintText,
  Widget? prefixIcon,
  Widget? sufficIcon,
  EdgeInsetsGeometry? contentPadding,
  double? radius,
}) =>
    InputDecoration(
      floatingLabelBehavior: FloatingLabelBehavior.always,
      filled: false,
      helperText: helper,
      helperStyle: AppStyle.caption.copyWith(
        fontWeight: FontWeight.w400,
      ),
      hintStyle: AppStyle.medium.copyWith(color: Color(0xFFc0c3cb)),
      hintText: hintText,
      contentPadding: contentPadding ??
          const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      prefixIcon: prefixIcon,
      suffixIcon: sufficIcon,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius ?? 10.0),
        gapPadding: 0,
        borderSide: BorderSide(
          color: AppColors.divider,
          width: 1,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius ?? 10.0),
        borderSide: BorderSide(
          color: AppColors.divider,
        ),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius ?? 10.0),
        borderSide: BorderSide(
          color: AppColors.divider,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius ?? 10.0),
        borderSide: BorderSide(
          color: Colors.red,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius ?? 10.0),
        borderSide: BorderSide(
          color: AppColors.divider,
        ),
      ),
    );
