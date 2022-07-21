// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i14;
import 'package:flutter/material.dart' as _i15;
import 'package:flutter/src/widgets/framework.dart' as _i16;

import '../main_app_init.dart' as _i1;
import '../models/user.dart' as _i17;
import '../modules/auth/pages/auth_screen.dart' as _i13;
import '../modules/home/view/home_view.dart' as _i3;
import '../modules/misc/view/about_us_view.dart' as _i12;
import '../modules/misc/view/help_view.dart' as _i11;
import '../modules/misc/view/privacy_policy_view.dart' as _i10;
import '../modules/misc/view/term_condition_view.dart' as _i9;
import '../modules/news/view/post_detail_page.dart' as _i8;
import '../modules/user/view/profile_detail_view.dart' as _i4;
import '../modules/user/view/profile_form_view.dart' as _i5;
import '../modules/user/view/profile_information_view.dart' as _i6;
import '../modules/user/view/profile_setting_view.dart' as _i7;
import '../modules/walkthrough/walkthrough_screen.dart' as _i2;

class AppRouter extends _i14.RootStackRouter {
  AppRouter([_i15.GlobalKey<_i15.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i14.PageFactory> pagesMap = {
    Splash.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.InitializeScreen());
    },
    Walkthrough.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.WalkthroughScreen());
    },
    HomeScreen.name: (routeData) {
      final args = routeData.argsAs<HomeScreenArgs>(
          orElse: () => const HomeScreenArgs());
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i3.HomeView(key: args.key, skip: args.skip));
    },
    ProfileDetailView.name: (routeData) {
      final args = routeData.argsAs<ProfileDetailViewArgs>();
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i4.ProfileDetailView(key: args.key, user: args.user));
    },
    ProfileUpdateView.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.ProfileFormView());
    },
    ProfileInformationView.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.ProfileInformationView());
    },
    ProfileSettingView.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.ProfileSettingView());
    },
    PostDetail.name: (routeData) {
      final args = routeData.argsAs<PostDetailArgs>();
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i8.PostDetailPage(key: args.key, postId: args.postId));
    },
    TermConditionView.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i9.TermConditionView());
    },
    PrivacyPolicyView.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i10.PrivacyPolicyView());
    },
    HelpView.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i11.HelpView());
    },
    AboutUsView.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i12.AboutUsView());
    },
    AuthScreen.name: (routeData) {
      final args = routeData.argsAs<AuthScreenArgs>(
          orElse: () => const AuthScreenArgs());
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i13.AuthScreen(key: args.key, onSuccess: args.onSuccess));
    }
  };

  @override
  List<_i14.RouteConfig> get routes => [
        _i14.RouteConfig('/#redirect',
            path: '/', redirectTo: '/splash', fullMatch: true),
        _i14.RouteConfig(Splash.name, path: '/splash'),
        _i14.RouteConfig(Walkthrough.name, path: '/walkthrough'),
        _i14.RouteConfig(HomeScreen.name, path: '/home'),
        _i14.RouteConfig(ProfileDetailView.name, path: '/profileDetail'),
        _i14.RouteConfig(ProfileUpdateView.name, path: '/profileUpdate'),
        _i14.RouteConfig(ProfileInformationView.name,
            path: '/profileInformation'),
        _i14.RouteConfig(ProfileSettingView.name, path: '/profileSettingView'),
        _i14.RouteConfig(PostDetail.name, path: '/postDetail'),
        _i14.RouteConfig(TermConditionView.name, path: '/misc/termCondition'),
        _i14.RouteConfig(PrivacyPolicyView.name, path: '/misc/privacyPolicy'),
        _i14.RouteConfig(HelpView.name, path: '/misc/help'),
        _i14.RouteConfig(AboutUsView.name, path: '/misc/aboutUs'),
        _i14.RouteConfig(AuthScreen.name, path: 'auth')
      ];
}

/// generated route for
/// [_i1.InitializeScreen]
class Splash extends _i14.PageRouteInfo<void> {
  const Splash() : super(Splash.name, path: '/splash');

  static const String name = 'Splash';
}

/// generated route for
/// [_i2.WalkthroughScreen]
class Walkthrough extends _i14.PageRouteInfo<void> {
  const Walkthrough() : super(Walkthrough.name, path: '/walkthrough');

  static const String name = 'Walkthrough';
}

/// generated route for
/// [_i3.HomeView]
class HomeScreen extends _i14.PageRouteInfo<HomeScreenArgs> {
  HomeScreen({_i16.Key? key, bool skip = false})
      : super(HomeScreen.name,
            path: '/home', args: HomeScreenArgs(key: key, skip: skip));

  static const String name = 'HomeScreen';
}

class HomeScreenArgs {
  const HomeScreenArgs({this.key, this.skip = false});

  final _i16.Key? key;

  final bool skip;

  @override
  String toString() {
    return 'HomeScreenArgs{key: $key, skip: $skip}';
  }
}

/// generated route for
/// [_i4.ProfileDetailView]
class ProfileDetailView extends _i14.PageRouteInfo<ProfileDetailViewArgs> {
  ProfileDetailView({_i16.Key? key, required _i17.User user})
      : super(ProfileDetailView.name,
            path: '/profileDetail',
            args: ProfileDetailViewArgs(key: key, user: user));

  static const String name = 'ProfileDetailView';
}

class ProfileDetailViewArgs {
  const ProfileDetailViewArgs({this.key, required this.user});

  final _i16.Key? key;

  final _i17.User user;

  @override
  String toString() {
    return 'ProfileDetailViewArgs{key: $key, user: $user}';
  }
}

/// generated route for
/// [_i5.ProfileFormView]
class ProfileUpdateView extends _i14.PageRouteInfo<void> {
  const ProfileUpdateView()
      : super(ProfileUpdateView.name, path: '/profileUpdate');

  static const String name = 'ProfileUpdateView';
}

/// generated route for
/// [_i6.ProfileInformationView]
class ProfileInformationView extends _i14.PageRouteInfo<void> {
  const ProfileInformationView()
      : super(ProfileInformationView.name, path: '/profileInformation');

  static const String name = 'ProfileInformationView';
}

/// generated route for
/// [_i7.ProfileSettingView]
class ProfileSettingView extends _i14.PageRouteInfo<void> {
  const ProfileSettingView()
      : super(ProfileSettingView.name, path: '/profileSettingView');

  static const String name = 'ProfileSettingView';
}

/// generated route for
/// [_i8.PostDetailPage]
class PostDetail extends _i14.PageRouteInfo<PostDetailArgs> {
  PostDetail({_i16.Key? key, required int postId})
      : super(PostDetail.name,
            path: '/postDetail',
            args: PostDetailArgs(key: key, postId: postId));

  static const String name = 'PostDetail';
}

class PostDetailArgs {
  const PostDetailArgs({this.key, required this.postId});

  final _i16.Key? key;

  final int postId;

  @override
  String toString() {
    return 'PostDetailArgs{key: $key, postId: $postId}';
  }
}

/// generated route for
/// [_i9.TermConditionView]
class TermConditionView extends _i14.PageRouteInfo<void> {
  const TermConditionView()
      : super(TermConditionView.name, path: '/misc/termCondition');

  static const String name = 'TermConditionView';
}

/// generated route for
/// [_i10.PrivacyPolicyView]
class PrivacyPolicyView extends _i14.PageRouteInfo<void> {
  const PrivacyPolicyView()
      : super(PrivacyPolicyView.name, path: '/misc/privacyPolicy');

  static const String name = 'PrivacyPolicyView';
}

/// generated route for
/// [_i11.HelpView]
class HelpView extends _i14.PageRouteInfo<void> {
  const HelpView() : super(HelpView.name, path: '/misc/help');

  static const String name = 'HelpView';
}

/// generated route for
/// [_i12.AboutUsView]
class AboutUsView extends _i14.PageRouteInfo<void> {
  const AboutUsView() : super(AboutUsView.name, path: '/misc/aboutUs');

  static const String name = 'AboutUsView';
}

/// generated route for
/// [_i13.AuthScreen]
class AuthScreen extends _i14.PageRouteInfo<AuthScreenArgs> {
  AuthScreen(
      {_i16.Key? key, dynamic Function(_i16.BuildContext, bool)? onSuccess})
      : super(AuthScreen.name,
            path: 'auth', args: AuthScreenArgs(key: key, onSuccess: onSuccess));

  static const String name = 'AuthScreen';
}

class AuthScreenArgs {
  const AuthScreenArgs({this.key, this.onSuccess});

  final _i16.Key? key;

  final dynamic Function(_i16.BuildContext, bool)? onSuccess;

  @override
  String toString() {
    return 'AuthScreenArgs{key: $key, onSuccess: $onSuccess}';
  }
}
