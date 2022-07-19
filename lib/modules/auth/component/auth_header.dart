import 'package:sosmed_sample/theme/style.dart';
import 'package:flutter/material.dart';

class AuthHeader extends StatelessWidget {
  final String title;
  final Function()? onPressed;
  const AuthHeader({
    Key? key,
    required this.title,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 150,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/shape-top-min.png'),
              fit: BoxFit.fill,
            ),
          ),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            margin: const EdgeInsets.only(bottom: 32),
            child: Row(
              children: [
                IconButton(
                  onPressed: onPressed,
                  icon: Icon(
                    Icons.home,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    title,
                    style: AppStyle.standart.copyWith(fontSize: 22),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
