import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sosmed_sample/models/menu_item_app.dart';
import 'package:sosmed_sample/modules/user/component/menu_item_view.dart';
import 'package:sosmed_sample/route/router.gr.dart';
import 'package:sosmed_sample/theme/app_icons.dart';
import 'package:sosmed_sample/theme/style.dart';
import 'package:sosmed_sample/widgets/avatar_widget.dart';
import 'package:sosmed_sample/widgets/custom_popup_menu.dart';
import 'package:sosmed_sample/widgets/divider_widget.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  List<CustomPopupMenu> choices = <CustomPopupMenu>[
    CustomPopupMenu(id: 0, icon: Icons.details, title: 'Profile Detail'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Profile', style: AppStyle.appBarTitle),
        actions: _buildAction(),
      ),
      body: Container(
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
                      const AvatarWidget(
                        heigh: 89,
                        width: 89,
                        thumbnailUrl: '',
                        url: '',
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Nadira Maya Hartanto',
                        style: AppStyle.bold.copyWith(fontSize: 16),
                      ),
                      const SizedBox(height: 8),
                      const Text('Angkatan 2015', style: AppStyle.standart),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            MenuListItemView(
              title: 'Profile',
              onPressed: () {
                AutoRouter.of(context).push(const ProfileUpdateView());
              },
            ),
            const DividerWidget(),
            MenuListItemView(
              title: 'Informasi Akun',
              onPressed: () {
                AutoRouter.of(context).push(const ProfileInformationView());
              },
            ),
            const DividerWidget(),
            MenuListItemView(
              title: 'Riwayat Absensi',
              onPressed: () {},
            ),
            const DividerWidget(),
            MenuListItemView(
              title: 'Pengaturan',
              onPressed: () {
                AutoRouter.of(context).push(const ProfileSettingView());
              },
            ),
            const DividerWidget(),
            MenuListItemView(
              title: 'Keluar',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildAction() {
    var _menuBar = <MenuItemApp>[
      MenuItemApp(
        title: 'Profile Detail',
        menuIcon: const Icon(AppIcons.ic_book),
        slug: 'profile-detail',
      ),
    ];

    return <Widget>[
      PopupMenuButton<MenuItemApp>(
        icon: const Icon(
          AppIcons.ic_more_vertical,
        ),
        onSelected: (MenuItemApp menuAppBar) {
          switch (menuAppBar.slug) {
            case 'profile-detail':
              // AutoRouter.of(context).push(ProfileDetailView());
              break;
            default:
              break;
          }
        },
        offset: const Offset(0, 40),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        itemBuilder: (context) => _menuBar
            .map(
              (menu) => PopupMenuItem<MenuItemApp>(
                child: Row(
                  children: [
                    Padding(
                        padding: EdgeInsets.only(right: 8),
                        child: menu.menuIcon),
                    Text(
                      menu.title,
                    ),
                  ],
                ),
                value: menu,
              ),
            )
            .toList(),
      ),
    ];
  }
}
