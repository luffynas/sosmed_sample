import 'package:flutter/widgets.dart';

class MenuItemApp {
  MenuItemApp({
    required this.title,
    required this.slug,
    this.menuIcon,
    this.righIcon,
    this.isActive = false,
    this.valueRadio,
  });
  final String title;
  final String slug;
  final Widget? menuIcon;
  final Widget? righIcon;
  bool isActive;
  final int? valueRadio;
}
