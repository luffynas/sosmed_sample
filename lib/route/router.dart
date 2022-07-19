import 'package:auto_route/auto_route.dart';
import 'package:sosmed_sample/main_app_init.dart';
import 'package:sosmed_sample/modules/auth/pages/auth_screen.dart';
import 'package:sosmed_sample/modules/home/view/home_view.dart';
import 'package:sosmed_sample/modules/misc/view/about_us_view.dart';
import 'package:sosmed_sample/modules/misc/view/help_view.dart';
import 'package:sosmed_sample/modules/misc/view/privacy_policy_view.dart';
import 'package:sosmed_sample/modules/misc/view/term_condition_view.dart';
import 'package:sosmed_sample/modules/news/view/post_detail_page.dart';
import 'package:sosmed_sample/modules/user/view/profile_detail_view.dart';
import 'package:sosmed_sample/modules/user/view/profile_form_view.dart';
import 'package:sosmed_sample/modules/user/view/profile_information_view.dart';
import 'package:sosmed_sample/modules/user/view/profile_setting_view.dart';
import 'package:sosmed_sample/modules/walkthrough/walkthrough_screen.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    AutoRoute(
      page: InitializeScreen,
      path: '/splash',
      name: 'splash',
      initial: true,
    ),
    AutoRoute(
      page: WalkthroughScreen, path: '/walkthrough', name: 'walkthrough',
      // initial: true,
    ),
    AutoRoute(
      page: HomeView,
      path: '/home',
      name: 'homeScreen',
    ),
    // MaterialRoute(
    //   page: ProfileView,
    //   path: '/profile',
    //   name: 'profileView',
    // ),
    AutoRoute(
      page: ProfileDetailView,
      path: '/profileDetail',
      name: 'profileDetailView',
    ),
    AutoRoute(
      page: ProfileFormView,
      path: '/profileUpdate',
      name: 'profileUpdateView',
    ),
    AutoRoute(
      page: ProfileInformationView,
      path: '/profileInformation',
      name: 'profileInformationView',
    ),
    AutoRoute(
      page: ProfileSettingView,
      path: '/profileSettingView',
      name: 'profileSettingView',
    ),
    AutoRoute(
      page: PostDetailPage,
      path: '/postDetail',
      name: 'postDetail',
    ),
    AutoRoute(
      page: TermConditionView,
      path: '/misc/termCondition',
      name: 'termConditionView',
    ),
    AutoRoute(
      page: PrivacyPolicyView,
      path: '/misc/privacyPolicy',
      name: 'privacyPolicyView',
    ),
    AutoRoute(
      page: HelpView,
      path: '/misc/help',
      name: 'helpView',
    ),
    AutoRoute(
      page: AboutUsView,
      path: '/misc/aboutUs',
      name: 'aboutUsView',
    ),
    AutoRoute(
      page: AuthScreen,
      path: 'auth',
      name: 'authScreen',
    ),
    // MaterialRoute(path: "*", page: UnknownRouteScreen)
  ],
)
class $AppRouter {}
