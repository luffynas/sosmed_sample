import 'dart:developer';

import 'package:flutter/material.dart';

import 'preference.dart';

class AppLinkUtil {
  // final String? path;
  // const AppLinkUtil({this.path});

  static final AppLinkUtil instance = AppLinkUtil._internal();

  factory AppLinkUtil() {
    return instance;
  }

  AppLinkUtil._internal();

  void handleAppLink(BuildContext context, String? path) {
    final userId = spUtils.getInt('user_id');

    log('handleAppLink $path');
    if (path != null) {
      final uri = Uri.parse(path);
      final param = uri.queryParameters;
      final segment = uri.pathSegments;
      log('uri param ${uri.queryParameters}');
      log('uri segment ${uri.pathSegments}');
      // if (segment[0] == 'post') {
      //   AutoRouter.of(context).push(FeedDetail(
      //     post: Post.empty().copy(postIdHash: segment[1]),
      //   ));
      // } else if (segment[0] == 'profile') {
      //   AutoRouter.of(context).push(ProfileScreen(
      //     user: User.empty().copy(username: segment[1]),
      //   ));
      // } else if (segment[0] == 'group') {
      //   AutoRouter.of(context).push(
      //     GroupScreen(group: Group.empty().copy(groupIdHash: segment[1])),
      //   );
      // } else if (segment[0] == 'product') {
      //   // AutoRouter.of(context).push(
      //   //   GroupScreen(group: Group.empty().copy(groupIdHash: segment[1])),
      //   // );
      //   // @TODO(nasrul)
      // } else {
      //   AutoRouter.of(context).push(UnknownScreen());
      // }
    }
  }
}
