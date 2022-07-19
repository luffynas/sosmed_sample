import 'dart:async';
import 'dart:developer';

import 'package:app_links/app_links.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:sosmed_sample/models/user.dart';
import 'package:sosmed_sample/modules/home/bloc/bottom_navigation/bottom_navigation_bloc.dart';
import 'package:sosmed_sample/modules/home/component/bottom_navigation_selection.dart';
import 'package:sosmed_sample/modules/news/bloc/news/news_bloc.dart';
import 'package:sosmed_sample/modules/news/view/bookmark_page.dart';
import 'package:sosmed_sample/modules/news/view/news_page.dart';
import 'package:sosmed_sample/modules/user/bloc/users/users_bloc.dart';
import 'package:sosmed_sample/modules/user/datasource/local/user_local.dart';
import 'package:sosmed_sample/modules/user/repositories/user_repository2.dart';
import 'package:sosmed_sample/modules/user/view/users_page.dart';
import 'package:sosmed_sample/theme/app_icons.dart';
import 'package:sosmed_sample/theme/color.dart';
import 'package:sosmed_sample/theme/style.dart';
import 'package:sosmed_sample/utils/app_link_util.dart';
import 'package:sosmed_sample/utils/notification_util.dart';
import 'package:sosmed_sample/utils/preference.dart';

bool _initialURILinkHandled = false;

class HomeView extends StatefulWidget {
  HomeView({Key? key, this.skip = false}) : super(key: key);
  final bool skip;

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with AutomaticKeepAliveClientMixin {
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  var isDialOpen = ValueNotifier<bool>(false);
  var buttonSize = const Size(56.0, 56.0);
  var childrenButtonSize = const Size(56.0, 56.0);
  var renderOverlay = true;
  var visible = true;
  var switchLabelPosition = false;
  var closeManually = false;
  var useRAnimation = true;
  var rmicons = false;
  var customDialRoot = false;
  var speedDialDirection = SpeedDialDirection.up;

  late BottomNavigationBloc _bottomNavigationBloc;

  final PageStorageBucket bucket = PageStorageBucket();

  late AppLinks _appLinks;
  StreamSubscription<Uri>? _linkSubscription;

  String username() => spUtils.getString('username') ?? '';
  int userId() => spUtils.getInt('user_id') ?? 0;

  final repo = UserRepository2(UserLocal());

  @override
  void initState() {
    initDeepLinks();
    super.initState();

    _bottomNavigationBloc = BlocProvider.of<BottomNavigationBloc>(context);
    _bottomNavigationBloc.add(SelectTab(index: 0));

    if (username().isNotEmpty) {
      NotificationUtil().firebaseCloudMessagingListeners(context);
      FirebaseCrashlytics.instance.setUserIdentifier('${userId()}');
    }

    context.read<UsersBloc>().add(const LoadUsers());
    context.read<NewsBloc>().add(const LoadNews());
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> initDeepLinks() async {
    _appLinks = AppLinks();

    // Check initial link if app was in cold state (terminated)
    final appLink = await _appLinks.getInitialAppLink();
    if (appLink != null) {
      log('getInitialAppLink: $appLink');
      openAppLink(appLink);
    }

    // Handle link when app is in warm state (front or background)
    _linkSubscription = _appLinks.uriLinkStream.listen((uri) {
      log('onAppLink: $uri');
      openAppLink(uri);
    });
  }

  void openAppLink(Uri uri) {
    // _navigatorKey.currentState?.pushNamed(uri.fragment);
    // AppLinkUtil.instance.handleAppLink(context, appLink.toString());
    AppLinkUtil.instance.handleAppLink(context, uri.toString());
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return WillPopScope(
      onWillPop: () async {
        if (isDialOpen.value) {
          isDialOpen.value = false;
          return false;
        }
        return true;
      },
      child: BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
        builder: (context, state) {
          return Scaffold(
            key: _key,
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              title: const Text('Sosmed', style: AppStyle.appBarTitle),
              // actions: _buildAction(),
              leading: IconButton(
                onPressed: () {
                  _key.currentState!.openDrawer();
                },
                icon: const Icon(
                  AppIcons.ic_hamburger_menu,
                  color: AppColors.primary,
                  size: 32,
                ),
              ),
            ),
            // drawer: _buildDrawer(),
            body: PageStorage(bucket: bucket, child: _buildBody(state)),
            // floatingActionButton: _buildFAB(),
            bottomNavigationBar: const BottomNavigationSelection(),
          );
        },
      ),
    );
  }

  Widget _buildBody(BottomNavigationState state) {
    if (state is NewsSelected) {
      return const NewsPage(
        key: PageStorageKey('news_page'),
      );
    } else if (state is BookmarkSelected) {
      return const BookmarkPage(
        key: PageStorageKey('bookmark_page'),
      );
    } else {
      return const UsersPage(
        key: PageStorageKey('users_page'),
      );
    }
  }

  // Widget _buildDrawer() {
  //   return Drawer(
  //     child: ListView(
  //       padding: EdgeInsets.zero,
  //       children: [
  //         DrawerHeader(
  //           decoration: const BoxDecoration(
  //             color: Colors.white,
  //           ),
  //           // ignore: use_named_constants
  //           margin: const EdgeInsets.all(0),
  //           child: GestureDetector(
  //             onTap: () {
  //               Navigator.pop(context);
  //               context.read<HomeBloc>().add(const GotoProfile());
  //             },
  //             child: Row(
  //               children: [
  //                 const AvatarWidget(
  //                   heigh: 57,
  //                   width: 57,
  //                   thumbnailUrl: '',
  //                   url: '',
  //                 ),
  //                 const SizedBox(width: 16),
  //                 Column(
  //                   mainAxisAlignment: MainAxisAlignment.center,
  //                   children: [
  //                     const Text(
  //                       'Budi Santoso',
  //                       style: AppStyle.medium,
  //                     ),
  //                     const SizedBox(height: 8),
  //                     const Text(
  //                       'Budi Santoso',
  //                       style: AppStyle.standart,
  //                     )
  //                   ],
  //                 ),
  //                 Expanded(
  //                   child: Align(
  //                     alignment: Alignment.centerRight,
  //                     child: Icon(
  //                       AppIcons.ic_chevron_right,
  //                       color: AppColors.icon,
  //                     ),
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ),
  //         const DividerWidget(height: 2),
  //         ListTile(
  //           leading: const Icon(
  //             AppIcons.ic_dashboard,
  //             color: AppColors.icon,
  //           ),
  //           title: const Text('Beranda', style: AppStyle.standart),
  //           onTap: () {
  //             Navigator.pop(context);
  //             context.read<HomeBloc>().add(const GotoDashboard());
  //           },
  //         ),
  //         const Padding(
  //           padding: EdgeInsets.symmetric(vertical: 8),
  //           child: DividerWidget(height: 2),
  //         ),
  //         ListTile(
  //           leading: const Icon(
  //             AppIcons.ic_calendar,
  //             color: AppColors.icon,
  //           ),
  //           title: const Text('Jadwal Pelajaran', style: AppStyle.standart),
  //           onTap: () {
  //             Navigator.pop(context);
  //             context.read<HomeBloc>().add(const GotoLessonSchedule());
  //           },
  //         ),
  //         ListTile(
  //           leading: const Icon(
  //             AppIcons.ic_book,
  //             color: AppColors.icon,
  //           ),
  //           title: const Text('Mata Pelajaran', style: AppStyle.standart),
  //           onTap: () {
  //             Navigator.pop(context);
  //             context.read<HomeBloc>().add(const GotoLessonSubject());
  //           },
  //         ),
  //         ListTile(
  //           leading: const Icon(
  //             AppIcons.ic_pencil_case,
  //             color: AppColors.icon,
  //           ),
  //           title: const Text('Daftar Tugas', style: AppStyle.standart),
  //           onTap: () {
  //             Navigator.pop(context);
  //             context.read<HomeBloc>().add(const GotoTaskList());
  //           },
  //         ),
  //         ListTile(
  //           leading: const Icon(
  //             AppIcons.ic_scorecard,
  //             color: AppColors.icon,
  //           ),
  //           title: const Text('Laporan Nilai', style: AppStyle.standart),
  //           onTap: () {
  //             Navigator.pop(context);
  //             context.read<HomeBloc>().add(const GotoValueReport());
  //           },
  //         ),
  //         ListTile(
  //           leading: const Icon(
  //             AppIcons.ic_book_reader,
  //             color: AppColors.icon,
  //           ),
  //           title: const Text('Bimbingan Belajar', style: AppStyle.standart),
  //           onTap: () {
  //             Navigator.pop(context);
  //             context.read<HomeBloc>().add(const GotoToutoring());
  //           },
  //         ),
  //         const Padding(
  //           padding: EdgeInsets.symmetric(vertical: 8),
  //           child: DividerWidget(height: 2),
  //         ),
  //         ListTile(
  //           leading: const Icon(
  //             AppIcons.ic_tabler_school,
  //             color: AppColors.icon,
  //           ),
  //           title: const Text('Tentang Sekolah', style: AppStyle.standart),
  //           onTap: () {
  //             Navigator.pop(context);
  //             context.read<HomeBloc>().add(const GotoAboutSchool());
  //           },
  //         ),
  //         ListTile(
  //           leading: const Icon(
  //             AppIcons.ic_file_text,
  //             color: AppColors.icon,
  //           ),
  //           title: const Text('Agenda Sekolah', style: AppStyle.standart),
  //           onTap: () {
  //             Navigator.pop(context);
  //             context.read<HomeBloc>().add(const GotoAgendaSchool());
  //           },
  //         ),
  //         ListTile(
  //           leading: const Icon(
  //             AppIcons.ic_user_group,
  //             color: AppColors.icon,
  //           ),
  //           title: const Text('Daftar Siswa', style: AppStyle.standart),
  //           onTap: () {
  //             Navigator.pop(context);
  //             context.read<HomeBloc>().add(const GotoStudentList());
  //           },
  //         ),
  //         ListTile(
  //           leading: const Icon(
  //             AppIcons.ic_university_lecture,
  //             color: AppColors.icon,
  //           ),
  //           title: const Text('Daftar Guru', style: AppStyle.standart),
  //           onTap: () {
  //             Navigator.pop(context);
  //             context.read<HomeBloc>().add(const GotoTeacherList());
  //           },
  //         ),
  //         const Padding(
  //           padding: EdgeInsets.symmetric(vertical: 8),
  //           child: DividerWidget(height: 2),
  //         ),
  //         ListTile(
  //           leading: const Icon(
  //             AppIcons.ic_feather,
  //             color: AppColors.icon,
  //           ),
  //           title: const Text('Tentang Edtrons', style: AppStyle.standart),
  //           onTap: () {
  //             AutoRouter.of(context).push(const AboutUsView());
  //           },
  //         ),
  //         ListTile(
  //           leading: const Icon(
  //             AppIcons.ic_help_circle,
  //             color: AppColors.icon,
  //           ),
  //           title: const Text('Bantuan', style: AppStyle.standart),
  //           onTap: () {
  //             AutoRouter.of(context).push(const HelpView());
  //           },
  //         ),
  //         ListTile(
  //           leading: const Icon(
  //             AppIcons.ic_logout,
  //             color: AppColors.error,
  //           ),
  //           title: const Text('Keluar', style: AppStyle.standart),
  //           onTap: () {
  //             // Update the state of the app.
  //             // ...
  //           },
  //         ),
  //       ],
  //     ),
  //   );
  // }

  Widget? _buildFAB() {
    var isUserVerified = spUtils.getString('user_type') == '1';
    var listFAB = <SpeedDialChild>[];

    listFAB = [
      SpeedDialChild(
        child: !rmicons ? const Icon(Icons.refresh) : null,
        backgroundColor: Colors.white,
        foregroundColor: Colors.blue,
        onTap: () {
          // AutoRouter.of(context).push(
          //   CreatePostScreen(
          //     kind: CreatePostKind.text,
          //   ),
          // );

          context.read<UsersBloc>().add(RemoveUsers());
        },
      ),
      SpeedDialChild(
        child: !rmicons ? const Icon(Icons.home) : null,
        backgroundColor: Colors.white,
        foregroundColor: Colors.blue,
        onTap: () {
          // AutoRouter.of(context).push(
          //   CreatePostScreen(
          //     kind: CreatePostKind.image,
          //   ),
          // );

          // repo.getUsers();
          // repo.addUser(User.empty()
          //     .copy(id: 1, username: 'hello', email: 'good@gmail.com'));

          context.read<UsersBloc>().add(AddUsers(user: User.empty()));
        },
      ),
    ];

    return SpeedDial(
      icon: Icons.add,
      activeIcon: Icons.close,
      spacing: 3,
      openCloseDial: isDialOpen,
      childPadding: const EdgeInsets.all(5),
      spaceBetweenChildren: 4,
      dialRoot: customDialRoot
          ? (ctx, open, toggleChildren) {
              return ElevatedButton(
                onPressed: toggleChildren,
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue[900],
                  padding:
                      const EdgeInsets.symmetric(horizontal: 22, vertical: 18),
                ),
                child: const Text(
                  "Dial",
                  style: TextStyle(fontSize: 17),
                ),
              );
            }
          : null,
      buttonSize: buttonSize,
      childrenButtonSize: childrenButtonSize,
      visible: visible,
      direction: speedDialDirection,
      switchLabelPosition: switchLabelPosition,
      closeManually: closeManually,
      renderOverlay: renderOverlay,
      overlayColor: Colors.black,
      overlayOpacity: 0.5,
      // onOpen: () => debugPrint('OPENING DIAL'),
      // onClose: () => debugPrint('DIAL CLOSED'),
      useRotationAnimation: useRAnimation,
      tooltip: 'Open Menu',
      heroTag: 'speed-dial-hero-tag',
      // foregroundColor: Colors.black,
      // backgroundColor: Colors.white,
      // activeForegroundColor: Colors.red,
      // activeBackgroundColor: Colors.blue,
      elevation: 8.0,
      isOpenOnStart: false,
      animationDuration: Duration(milliseconds: 200),
      shape: customDialRoot
          ? const RoundedRectangleBorder()
          : const StadiumBorder(),
      // childMargin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      children: listFAB,
    );
  }

  // List<Widget> _buildAction() {
  //   var isLogged = spUtils.getInt('user_id') != null ? true : false;
  //   final avatar = spUtils.getString('avatar');
  //   var _menu = <Widget>[];
  //   _menu.add(IconButton(
  //     // iconSize: 22,
  //     icon: Icon(
  //       AppIcons.ic_bell,
  //       size: 28,
  //       color: AppColors.icon,
  //     ),
  //     onPressed: () {
  //       // AutoRouter.of(context).push(NotifScreen());
  //     },
  //   ));
  //   _menu.add(
  //     IconButton(
  //       iconSize: 22,
  //       icon: Icon(
  //         AppIcons.ic_chat_dots,
  //         size: 28,
  //         color: AppColors.icon,
  //       ),
  //       onPressed: () {
  //         // AutoRouter.of(context).push(ProfileScreen());
  //       },
  //     ),
  //   );
  //   return _menu;
  // }

  @override
  bool get wantKeepAlive => true;
}
