import 'dart:developer';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:sosmed_sample/core/bloc/fcm/fcm_bloc.dart';
import 'package:sosmed_sample/theme/style.dart';
import 'package:sosmed_sample/utils/preference.dart';
import 'package:sosmed_sample/utils/text_util.dart';

class NotificationUtil {
  // FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  // BuildContext context;
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  void firebaseCloudMessagingListeners(BuildContext context) {
    context = context;
    //print("NotificationUtil :::: ");

    if (Platform.isIOS) {
      iOSPermission(context);
    } else {
      _sendFCMToken(context);
    }

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification notification = message.notification!;
      log("receive fcm message: ${message.data}");

      //print('Got a message whilst in the foreground!');
      //print('Message data: ${message.data}');

      if (message.notification != null) {
        //print('Message also contained a notification: ${message.notification}');
      }
      _showLocalNotification(context, message.data);

      if (message.data["kind"] == "18" || message.data["kind"] == "20") {
        log("receive kind 18 || 20");
        // UserRepository().getUserInfo(force: true);
        // BlocProvider.of<ProfileBloc>(context).add(UpdateUserRoles());
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      //print('A new onMessageOpenedApp event was published!');
      _navigateToItemDetail(context, message.data);
    });
  }

  void _sendFCMToken(BuildContext context) {
    var accountBloc = BlocProvider.of<FcmBloc>(context);
    accountBloc.add(const CreateFcm());
  }

  void iOSPermission(BuildContext context) async {
    // _firebaseMessaging.requestNotificationPermissions(
    //     IosNotificationSettings(sound: true, badge: true, alert: true));
    // _firebaseMessaging.onIosSettingsRegistered
    //     .listen((IosNotificationSettings settings) {
    //   //print("Settings registered: $settings");
    //   _sendFCMToken(context);
    // });
    // String? token = await FirebaseMessaging.instance.getAPNSToken();
    // _sendFCMToken(context);

    //print("=> checking IOS permission");
    NotificationSettings settings = await messaging.requestPermission();
    //print("settings.authorizationStatus ${settings.authorizationStatus}");

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      _sendFCMToken(context);
    } else {
      NotificationSettings settings = await messaging.requestPermission();

      if (settings.authorizationStatus == AuthorizationStatus.authorized) {
        _sendFCMToken(context);
      }
    }
  }

  void _navigateToItemDetail(
      BuildContext context, Map<String, dynamic> message) {
    log("message :: test :: $message");
    // dynamic targetId = message['target_id'];
    // int notifKind = int.parse(message['kind']);
    // log("KIND :: $notifKind");
    // log("Target ID ::: $targetId");
    // final kind = NotifKind.values[notifKind - 1];
    // switch (kind) {
    //   case NotifKind.LikeContent:
    //   case NotifKind.LikeComment:
    //   case NotifKind.LikeReplyComment:
    //     Navigator.of(context).push(
    //       MaterialPageRoute(
    //         builder: (context) => TimelineStreamDetail(
    //           id: targetId,
    //         ),
    //       ),
    //     );
    //     break;
    //   case NotifKind.Follow:
    //     final user = User(id: targetId, fullName: "", profilePicture: "");
    //     AutoRouter.of(context).push(ProfileScreen(
    //       user: user,
    //     ));
    //     break;
    //   case NotifKind.JoinChannel:
    //   case NotifKind.InviteToChannel:
    //   case NotifKind.JoinChannelRequest:
    //   case NotifKind.JoinChannelApproved:
    //   case NotifKind.ChannelRemoveMember:
    //   case NotifKind.NewChannelAdministrator:
    //     AutoRouter.of(context).push(
    //       ChannelProfileScreen(
    //         channelId: targetId,
    //       ),
    //     );
    //     break;
    //   case NotifKind.MentionOnContent:
    //   case NotifKind.MentionOnComment:
    //   case NotifKind.MentionOnReplyComment:
    //   case NotifKind.Comment:
    //   case NotifKind.ReplyComment:
    //     Navigator.of(context).push(
    //       MaterialPageRoute(
    //         builder: (context) => TimelineStreamDetail(
    //           id: targetId,
    //         ),
    //       ),
    //     );
    //     break;
    //   case NotifKind.InvitedtoEvent:
    //     Navigator.of(context).push(
    //       MaterialPageRoute(
    //           builder: (context) =>
    //               EventDetailPage(event: Event.fromId(targetId.toString()))),
    //     );
    //     break;
    //   case NotifKind.GotNewChatMessage:
    //     final _data = tryDecode(message["item"] as String);
    //     final chat = ChatSimple.fromNotif(_data);
    //     Navigator.of(context).push(
    //       MaterialPageRoute(
    //           builder: (context) => ChatRoom(chat: chat, isAdmin: false)),
    //     );
    //     break;

    //   default:
    //     break;
    // }
  }

  void _showLocalNotification(
    BuildContext context,
    Map<String, dynamic> message,
  ) {
    SystemSound.play(SystemSoundType.click);
    final activeChatId = spUtils.getInt('active_chat_id');
    if (activeChatId != null &&
        activeChatId.toString() == message['target_id'] as String) {
      return;
    }

    String msgTitle = "";
    String msgBody = "";
    //print("message ::::: $message");
    //print("message ::::: receiver_id ${message['receiver_id']}");
    //print("message ::::: kind ${message['kind']}");
    //print("message ::::: created ${message['created']}");
    //print("message ::::: target_id ${message['target_id']}");
    //print("message ::::: title ${message['title']}");
    //print("message ::::: message ${message['message']}");
    if (Platform.isIOS) {
      msgTitle = message['title'] as String;
      msgBody = message['message'] as String;
    } else {
      // msgTitle = message['notification']['title'] as String;
      // msgBody = message['notification']['body'] as String;
      msgTitle = message['title'] as String;
      msgBody = message['message'] as String;
    }

    // BlocProvider.of<NotifCountBloc>(context).add(UnreadNotificationCount());
    showOverlayNotification(
      (context) {
        return MessageNotification(
          context: context,
          title: msgTitle,
          message: textUtils.removeAllHtmlTags(msgBody),
          onReplay: () {
            OverlaySupportEntry.of(context)!.dismiss();
            _navigateToItemDetail(context, message);
          },
        );
      },
      duration: const Duration(seconds: 5),
    );
  }
}

class MessageNotification extends StatelessWidget {
  final VoidCallback onReplay;
  final String title;
  final String message;
  final BuildContext context;

  const MessageNotification(
      {Key? key,
      required this.onReplay,
      required this.title,
      required this.message,
      required this.context})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Card(
        color: Color(0xff333333),
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
        child: GestureDetector(
          onTap: () {
            if (onReplay != null) onReplay();
          },
          child: ListTile(
            title: Text(title,
                style: AppStyle.button.copyWith(
                  color: Colors.white,
                )),
            subtitle: Text(
              message,
              style: AppStyle.standart.copyWith(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
