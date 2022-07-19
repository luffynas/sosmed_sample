import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sosmed_sample/theme/color.dart';
import 'package:sosmed_sample/theme/style.dart';
import 'package:sosmed_sample/widgets/image_widget.dart';

class NewsCardView extends StatelessWidget {
  final Function(int userId) onDetailPost;
  const NewsCardView({
    Key? key,
    required this.onDetailPost,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onDetailPost.call(1);
      },
      child: Container(
        decoration: AppStyle.cardBorder,
        child: Column(
          children: [
            FittedBox(
              fit: BoxFit.contain,
              alignment: Alignment.center,
              child: ImageWidget(
                placeholder: 'assets/images/placeholder/placeholder.png',
                thumbnail: '',
                image: '',
                width: 120,
                height: 150,
                fit: BoxFit.cover,
                radius: BorderRadius.all(Radius.circular(8)),
              ),
            ),
            Text(
              'Nama',
              style: AppStyle.medium12.copyWith(
                color: AppColors.textPrimary,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 4),
            Text(
              'email',
              style: AppStyle.caption.copyWith(
                color: AppColors.textPrimary,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
