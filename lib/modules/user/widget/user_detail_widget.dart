import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sosmed_sample/models/user.dart';
import 'package:sosmed_sample/theme/color.dart';
import 'package:sosmed_sample/theme/style.dart';
import 'package:sosmed_sample/utils/date_time_util.dart';
import 'package:sosmed_sample/widgets/avatar_widget.dart';

class UserDetailWidget extends StatelessWidget {
  final User user;
  const UserDetailWidget({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            SizedBox(
              child: Image.asset(
                'assets/images/background/ic_profile_background.png',
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              bottom: 0,
              right: 0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AvatarWidget(
                    heigh: 89,
                    width: 89,
                    thumbnailUrl: user.picture ?? '',
                    url: user.picture ?? '',
                  ),
                  const SizedBox(height: 16),
                  Text(
                    '${user.firstName} ${user.lastName} ',
                    style: AppStyle.bold.copyWith(fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  Text('${user.email}', style: AppStyle.standart),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Bio',
                style: AppStyle.bold.copyWith(color: AppColors.primary),
              ),
              const SizedBox(height: 8),
              const Text(
                'Freelancer',
                style: AppStyle.standart,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'No Ponsel',
                style: AppStyle.bold.copyWith(color: AppColors.primary),
              ),
              const SizedBox(height: 8),
              Text(
                '${user.phone}',
                style: AppStyle.standart,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Tanggal Lahir',
                style: AppStyle.bold.copyWith(color: AppColors.primary),
              ),
              const SizedBox(height: 8),
              Text(
                user.dateOfBirth == null
                    ? ''
                    : dateTimeUtils.formatedDMMMY(user.dateOfBirth ?? ''),
                style: AppStyle.standart,
              ),
            ],
          ),
        ),
        // const SizedBox(height: 24),
      ],
    );
  }
}
