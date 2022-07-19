import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sosmed_sample/models/user.dart';
import 'package:sosmed_sample/modules/user/bloc/users/users_bloc.dart';
import 'package:sosmed_sample/theme/app_icons.dart';
import 'package:sosmed_sample/theme/color.dart';
import 'package:sosmed_sample/theme/style.dart';
import 'package:sosmed_sample/utils/date_time_util.dart';
import 'package:sosmed_sample/widgets/avatar_widget.dart';
import 'package:sosmed_sample/widgets/divider_widget.dart';

class ProfileDetailView extends StatefulWidget {
  final User user;
  const ProfileDetailView({Key? key, required this.user}) : super(key: key);

  @override
  State<ProfileDetailView> createState() => _ProfileDetailViewState();
}

class _ProfileDetailViewState extends State<ProfileDetailView> {
  User? user;

  @override
  void initState() {
    user = widget.user;
    super.initState();

    context.read<UsersBloc>().add(LoadUserDetail(userId: user!.id!));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Profile Detail', style: AppStyle.appBarTitle),
      ),
      body: BlocListener<UsersBloc, UsersState>(
        listener: (context, state) {
          switch (state.status) {
            case UsersStatus.success:
              user = state.user;
              setState(() {});
              break;
            default:
          }
        },
        child: Container(
          child: ListView(
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
                          thumbnailUrl: user?.picture ?? '',
                          url: user?.picture ?? '',
                        ),
                        const SizedBox(height: 16),
                        Text(
                          '${user?.firstName} ${user?.lastName} ',
                          style: AppStyle.bold.copyWith(fontSize: 16),
                        ),
                        const SizedBox(height: 8),
                        Text('${user?.email}', style: AppStyle.standart),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'No Ponsel',
                      style: AppStyle.bold.copyWith(color: AppColors.primary),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '${user?.phone}',
                      style: AppStyle.standart,
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Tanggal Lahir',
                      style: AppStyle.bold.copyWith(color: AppColors.primary),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      user?.dateOfBirth == null
                          ? ''
                          : dateTimeUtils
                              .formatedDMMMY(user?.dateOfBirth ?? ''),
                      style: AppStyle.standart,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Social Media',
                  style: AppStyle.medium.copyWith(fontSize: 20),
                ),
              ),
              const SizedBox(height: 16),
              const DividerWidget(),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  children: [
                    const Icon(
                      AppIcons.ic_facebook,
                      size: 24,
                      color: AppColors.primary,
                    ),
                    const SizedBox(width: 16),
                    const Text(
                      'facebook.com/zaky.dwinawan',
                      style: AppStyle.standart,
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  children: [
                    const Icon(
                      AppIcons.ic_instagram,
                      size: 24,
                      color: AppColors.primary,
                    ),
                    const SizedBox(width: 16),
                    const Text(
                      'instagram.com/zaky12/',
                      style: AppStyle.standart,
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  children: [
                    const Icon(
                      AppIcons.ic_twitter,
                      size: 24,
                      color: AppColors.primary,
                    ),
                    const SizedBox(width: 16),
                    const Text(
                      'twitter.com/zaky12/',
                      style: AppStyle.standart,
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  children: [
                    const Icon(
                      AppIcons.ic_linkedin,
                      size: 24,
                      color: AppColors.primary,
                    ),
                    const SizedBox(width: 16),
                    const Text(
                      'linkedin.com/in/zakydwinawan/',
                      style: AppStyle.standart,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
