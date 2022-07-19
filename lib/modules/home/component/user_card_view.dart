import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sosmed_sample/models/user.dart';
import 'package:sosmed_sample/theme/color.dart';
import 'package:sosmed_sample/theme/style.dart';
import 'package:sosmed_sample/widgets/image_widget.dart';

class UserCardView extends StatelessWidget {
  final User user;
  final Function(int userId) onDetailProfile;
  const UserCardView({
    Key? key,
    required this.user,
    required this.onDetailProfile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onDetailProfile.call(1);
      },
      child: Container(
        decoration: AppStyle.cardBorder,
        child: Column(
          children: [
            FittedBox(
              fit: BoxFit.cover,
              child: ImageWidget(
                placeholder: 'assets/images/placeholder/placeholder.png',
                thumbnail: user.picture ?? '',
                image: user.picture ?? '',
                width: 300,
                height: 300,
                fit: BoxFit.cover,
                radius: const BorderRadius.all(Radius.circular(8)),
              ),
            ),
            Text(
              '${user.firstName} ${user.lastName}',
              style: AppStyle.medium12.copyWith(
                color: AppColors.textPrimary,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 4),
            Text(
              user.email ?? '',
              style: AppStyle.caption.copyWith(
                color: AppColors.textPrimary,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 4),
            // Text(
            //   'email',
            //   style: AppStyle.caption.copyWith(
            //     color: AppColors.textPrimary,
            //   ),
            //   maxLines: 1,
            //   overflow: TextOverflow.ellipsis,
            // ),
          ],
        ),
      ),
    );
  }
}
