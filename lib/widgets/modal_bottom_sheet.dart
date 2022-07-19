import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sosmed_sample/theme/app_icons.dart';
import 'package:sosmed_sample/theme/color.dart';
import 'package:sosmed_sample/theme/style.dart';
import 'package:sosmed_sample/utils/photo_helper.dart';
import 'package:sosmed_sample/widgets/button_border.dart';
import 'package:sosmed_sample/widgets/divider_widget.dart';

Future showModalChangePhoto(
  BuildContext context, {
  String title = 'Change Photo',
  Function(String?)? onSelectGallery,
  required Function(String?) onSelectCamera,
  Function? onSelectVideo,
  Function? onSelectMultiplePhoto,
  Function? onRemovePhoto,
}) {
  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (BuildContext context) {
      return Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
          color: Colors.white,
        ),
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  margin: EdgeInsets.only(bottom: 16, top: 4),
                  height: 4.0,
                  width: 40.0,
                  decoration: BoxDecoration(
                    color: AppColors.dividerBottomSheet,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 8,
                ),
                child: Text(
                  title,
                  style: AppStyle.medium.copyWith(
                    fontSize: 16,
                    color: AppColors.textPrimary,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 8,
                ),
                child: DividerWidget(),
              ),
              TextButton(
                key: Key('from_camera'),
                child: const Text(
                  'Take Photo From Camera',
                  style: AppStyle.medium,
                ),
                onPressed: () async {
                  Navigator.pop(context);
                  final file =
                      await chooseImage(ImageSource.camera, isCompress: true);
                  if (file != null) onSelectCamera(file.path);
                },
              ),
              Visibility(
                child: TextButton(
                  key: Key('from_gallery'),
                  child: const Text(
                    'Select Photos From Gallery',
                    style: AppStyle.medium,
                  ),
                  onPressed: () async {
                    Navigator.pop(context);
                    if (onSelectGallery != null) {
                      final file = await chooseImage(ImageSource.gallery,
                          isCompress: true);
                      if (file != null) onSelectGallery(file.path);
                    }
                  },
                ),
                visible: onSelectGallery != null,
              ),
              Visibility(
                child: TextButton(
                  child: Text(
                    'Select Photos From Gallery',
                    style: AppStyle.medium,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                    onSelectMultiplePhoto!();
                  },
                ),
                visible: onSelectMultiplePhoto != null,
              ),
              Visibility(
                child: TextButton(
                  child: Text(
                    'Select Video From Gallery',
                    style: AppStyle.medium,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                    onSelectVideo!();
                  },
                ),
                visible: onSelectVideo != null,
              ),
              // Visibility(
              //   child: TextButton(
              //     child: Text(
              //       'Remove Photo Profile',
              //       style: AppStyle.medium.copyWith(
              //         color: Color(0xFFAA3535),
              //       ),
              //     ),
              //     onPressed: () {
              //       Navigator.pop(context);
              //       onRemovePhoto!();
              //     },
              //   ),
              //   visible: onRemovePhoto != null,
              // ),
            ],
          ),
        ),
      );
    },
  );
}

//For Remove Member
Future showModalRemoveMember(
  BuildContext context, {
  Function? onSelectGallery,
  Function? onSelectCamera,
  Function? onRemovePhoto,
  RichText? textBody,
  Widget? center,
  Widget? bottom,
}) {
  return showModalBottomSheet<void>(
    context: context,
    backgroundColor: Colors.transparent,
    builder: (BuildContext context) {
      return Container(
        height: 250,
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
          color: Colors.white,
        ),
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  margin: EdgeInsets.only(bottom: 16, top: 4),
                  height: 4.0,
                  width: 40.0,
                  decoration: BoxDecoration(
                    color: AppColors.dividerBottomSheet,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 8,
                ),
                child: Center(
                  child: Text(
                    'Remove Member',
                    style: AppStyle.medium.copyWith(
                      fontSize: 16,
                      color: AppColors.textPrimary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 8,
                ),
                child: DividerWidget(),
              ),
              // TextButton(
              //   child: const Text(
              //     'Select From Gallery',
              //     style: AppStyle.medium,
              //   ),
              //   onPressed: () {
              //     Navigator.pop(context);
              //     onSelectGallery!();
              //   },
              // ),
              // TextButton(
              //   child: const Text(
              //     'Take From Camera',
              //     style: AppStyle.medium,
              //   ),
              //   onPressed: () {
              //     Navigator.pop(context);
              //     onSelectCamera!();
              //   },
              // ),
              // TextButton(
              //   child: Text(
              //     'Remove Photo Profile',
              //     style: AppStyle.medium.copyWith(
              //       color: Color(0xFFAA3535),
              //     ),
              //   ),
              //   onPressed: () {
              //     Navigator.pop(context);
              //     onRemovePhoto!();
              //   },
              // ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                child: textBody ?? SizedBox(),
              ),
              center ?? SizedBox(),
              bottom ?? SizedBox(),
            ],
          ),
        ),
      );
    },
  );
}

Future showModalBottomSheetDefault(
  BuildContext context, {
  VoidCallback? onClose,
  String? title,
  Widget? textBody,
  Widget? center,
  Widget? bottom,
  double height = 250,
}) {
  return showModalBottomSheet<void>(
    context: context,
    backgroundColor: Colors.transparent,
    builder: (BuildContext context) {
      return Container(
        height: height,
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
          color: Colors.white,
        ),
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 12),
                  height: 4.0,
                  width: 40.0,
                  decoration: BoxDecoration(
                    color: AppColors.dividerBottomSheet,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              Stack(
                children: [
                  Visibility(
                    visible: title != null,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 8,
                      ),
                      child: Center(
                        child: Text(
                          title ?? "",
                          style: AppStyle.medium.copyWith(
                            fontSize: 16,
                            color: Color(0xFF0F162C),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: IconButton(
                      onPressed: onClose,
                      icon: Icon(
                        AppIcons.ic_bell,
                        size: 16,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                child: textBody ?? SizedBox(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                child: center ?? SizedBox(),
              ),
              Expanded(
                child: bottom ?? SizedBox(),
              )
            ],
          ),
        ),
      );
    },
  );
}

Future showModalBottomSheetReasons(
  BuildContext context, {
  VoidCallback? onSubmit,
  String? title,
  String? titleButton,
  TextEditingController? textController,
}) {
  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (BuildContext context) {
      return Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
          color: Colors.white,
        ),
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  margin: EdgeInsets.only(bottom: 16, top: 4),
                  height: 4.0,
                  width: 40.0,
                  decoration: BoxDecoration(
                    color: AppColors.dividerBottomSheet,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              Stack(
                children: [
                  Visibility(
                    visible: title != null,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 8,
                      ),
                      child: Center(
                        child: Text(
                          title!,
                          style: AppStyle.medium.copyWith(
                            fontSize: 16,
                            color: Color(0xFF0F162C),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(AppIcons.ic_bell),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 8,
                ),
                child: DividerWidget(),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                // padding: EdgeInsets.only(
                // bottom: MediaQuery.of(context).viewInsets.bottom),
                child: Text(
                  'Reason',
                  style: AppStyle.medium.copyWith(
                    color: AppColors.textPrimary,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 8,
                ),
                // padding: EdgeInsets.only(
                //     bottom: MediaQuery.of(context).viewInsets.bottom),
                child: TextField(
                  controller: textController,
                  // maxLines: 5,
                  // minLines: 3,
                  // keyboardType: TextInputType.multiline,
                  autofocus: true,
                  cursorColor: Colors.grey,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1.0),
                    ),
                    // filled: true,
                    hintText: "Reason...",
                    // isDense: true,
                    contentPadding: EdgeInsets.all(8),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    OutlinedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('Discard')),
                    SizedBox(width: 16.0),
                    OutlinedButton(
                        onPressed: onSubmit,
                        style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          backgroundColor:
                              MaterialStateProperty.resolveWith<Color>(
                                  (states) {
                            if (states.contains(MaterialState.disabled)) {
                              return Colors.grey.shade100;
                            }
                            return AppColors.primary;
                          }),
                          textStyle:
                              MaterialStateProperty.resolveWith<TextStyle>(
                                  (states) {
                            if (states.contains(MaterialState.disabled)) {
                              return AppStyle.button
                                  .copyWith(color: Colors.white);
                            }
                            return AppStyle.button
                                .copyWith(color: Colors.white);
                          }),
                        ),
                        child: Text(titleButton!)),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

// Future showModalBottomSheetComment(
//   BuildContext context, {
//   Comment? comment,
//   Function(String, List<String>)? onSubmit,
// }) {
//   return showModalBottomSheet<void>(
//     context: context,
//     isScrollControlled: true,
//     backgroundColor: Colors.transparent,
//     builder: (BuildContext context) {
//       return CommentModalSheet(
//         onSubmit: onSubmit,
//         comment: comment,
//       );
//     },
//   );
// }

// Future showModalBottomSheetComment1(
//   BuildContext context, {
//   Function(String)? onSubmit,
//   String? avatar,
//   TextEditingController? textController,
// }) {
//   return showModalBottomSheet<void>(
//     context: context,
//     isScrollControlled: true,
//     backgroundColor: Colors.transparent,
//     builder: (BuildContext context) {
//       return Container(
//         padding: const EdgeInsets.symmetric(
//           horizontal: 16,
//         ),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(16),
//             topRight: Radius.circular(16),
//           ),
//           color: Colors.white,
//         ),
//         child: Container(
//           padding: const EdgeInsets.all(8),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisSize: MainAxisSize.min,
//             children: <Widget>[
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   AvatarWidget(
//                     url: avatar,
//                   ),
//                   Expanded(
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(
//                         vertical: 8,
//                         horizontal: 8,
//                       ),
//                       // padding: EdgeInsets.only(
//                       //     bottom: MediaQuery.of(context).viewInsets.bottom),
//                       child: TextField(
//                         controller: textController,
//                         // maxLines: 5,
//                         // minLines: 3,
//                         // keyboardType: TextInputType.multiline,
//                         autofocus: true,
//                         cursorColor: Colors.grey,
//                         decoration: InputDecoration(
//                           border: OutlineInputBorder(
//                             borderSide: BorderSide.none,
//                           ),
//                           // filled: true,
//                           hintText: "Tulis komentar...",
//                           // isDense: true,
//                           contentPadding: EdgeInsets.all(8),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               Padding(
//                 padding: EdgeInsets.only(
//                     bottom: MediaQuery.of(context).viewInsets.bottom),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     // IconButton(
//                     //   onPressed: () {},
//                     //   icon: Icon(
//                     //     Icons.emoji_emotions_outlined,
//                     //     size: 18,
//                     //     color: Colors.yellow,
//                     //   ),
//                     // ),
//                     IconButton(
//                       onPressed: () {
//                         // Navigator.pop(context);
//                       },
//                       icon: Icon(
//                         AppIcons.ic_attachment,
//                         size: 18,
//                         color: AppColors.textSecondary,
//                       ),
//                     ),
//                     Expanded(
//                       child: Align(
//                         alignment: Alignment.centerRight,
//                         child: IconButton(
//                           onPressed: onSubmit?.call(textController!.text),
//                           icon: Icon(
//                             AppIcons.ic_send,
//                             size: 18,
//                             color: Colors.blue,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       );
//     },
//   );
// }

typedef ListViewWidgetBuilder = Widget Function(
    BuildContext context, ScrollController scrollController);

Future showModalListView(
  BuildContext context, {
  required String title,
  required Widget Function(BuildContext, ScrollController) builder,
  double initialChildSize = 0.5,
  String? desc,
  bool expand = true,
}) {
  return showModalBottomSheet<void>(
    context: context,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return DraggableScrollableSheet(
        expand: expand,
        initialChildSize: initialChildSize,
        // minChildSize: 0.3,
        maxChildSize: 0.9,
        builder: (context, scrollController) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
              color: Colors.white,
            ),
            child: Column(children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 12),
                      height: 4.0,
                      width: 40.0,
                      decoration: BoxDecoration(
                        color: AppColors.dividerBottomSheet,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      child: Text(
                        title,
                        style: AppStyle.medium.copyWith(
                          fontSize: 16,
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ),
                  ),
                  desc != null
                      ? Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 8),
                          child: Text(
                            desc,
                            style: AppStyle.caption.copyWith(
                              // fontSize: 16,
                              color: AppColors.textPrimary,
                            ),
                          ),
                        )
                      : Container(),
                ],
              ),
              Expanded(
                child: builder(context, scrollController),
              ),
            ]),
          );
          /*return Container(
            // height: 250,
            padding: const EdgeInsets.symmetric(
              horizontal: 0,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
              color: Colors.white,
            ),
            child: Container(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    alignment: Alignment.topCenter,
                    padding: const EdgeInsets.only(
                      bottom: 8,
                    ),
                    child: Container(
                      width: 64,
                      height: 2,
                      color: AppColors.divider,
                      alignment: Alignment.topCenter,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 8,
                    ),
                    child: Text(
                      title,
                      style: AppStyle.medium.copyWith(
                        fontSize: 16,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ),
                  desc != null
                      ? Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal: 8,
                          ),
                          child: Text(
                            desc,
                            style: AppStyle.caption.copyWith(),
                          ),
                        )
                      : Container(),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 8,
                    ),
                    child: DividerWidget(),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 0,
                      horizontal: 0,
                    ),
                    child: Expanded(
                      child: builder(context, scrollController),
                    ),
                  ),
                ],
              ),
            ),
          );*/
        },
      );
    },
  );
}

Future showModalBottomSheetShare(
  BuildContext context, {
  VoidCallback? onSubmit,
  VoidCallback? onCopyClipboard,
  VoidCallback? onShareToWhatsapp,
  VoidCallback? onShareToFacebook,
  String title = "Silahkan bagikan konten ini melalui",
}) {
  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (BuildContext context) {
      return Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
          color: Colors.white,
        ),
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  margin: EdgeInsets.only(bottom: 16, top: 4),
                  height: 4.0,
                  width: 40.0,
                  decoration: BoxDecoration(
                    color: AppColors.dividerBottomSheet,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 8,
                ),
                child: Center(
                  child: Text(
                    title,
                    style: AppStyle.medium.copyWith(
                      fontSize: 16,
                      color: Color(0xFF0F162C),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: Icon(Icons.link_rounded),
                    ),
                    Text(
                      "Dapatkan tautan link",
                      style: AppStyle.standart14,
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: ButtonBorder(
                          title: "Salin",
                          radius: 100,
                          isFill: true,
                          value: true,
                          buttonType: ButtonType.small,
                          onPressed: () {
                            onCopyClipboard?.call();
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: ButtonBorder(
                        title: "Share ke",
                        buttonType: ButtonType.big,
                        radius: 100,
                        rightIcon: true,
                        textColor: AppColors.textSecondary,
                        iconImage: 'assets/images/menu/ic_whatsapp.png',
                        onPressed: () {
                          onShareToWhatsapp?.call();
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: ButtonBorder(
                        title: "Share ke",
                        buttonType: ButtonType.big,
                        radius: 100,
                        rightIcon: true,
                        textColor: AppColors.textSecondary,
                        iconImage: 'assets/images/menu/ic_facebook.png',
                        onPressed: () {
                          onShareToFacebook?.call();
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 24,
              )
            ],
          ),
        ),
      );
    },
  );
}

Future showModalBottomSheetDynamic(
  BuildContext context, {
  bool topDevider = true,
  String? title,
  Widget? target,
  double? height,
  Color? barrierColor,
  double radius = 16,
  EdgeInsetsGeometry? padding = const EdgeInsets.symmetric(
    horizontal: 16,
    vertical: 16,
  ),
}) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    barrierColor: barrierColor,
    builder: (BuildContext context) {
      return Container(
          height: height,
          padding: padding,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(radius),
              topRight: Radius.circular(radius),
            ),
            color: Colors.white,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Visibility(
                visible: topDevider,
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    margin: EdgeInsets.only(bottom: 16, top: 4),
                    height: 4.0,
                    width: 40.0,
                    decoration: BoxDecoration(
                      color: AppColors.dividerBottomSheet,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: title != null,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 16,
                    right: 16,
                    top: 16,
                    bottom: 8,
                  ),
                  child: Text(title ?? ""),
                ),
              ),
              // ConstrainedBox(
              //   constraints: new BoxConstraints(
              //     maxHeight: MediaQuery.of(context).size.height /
              //         4.0 *
              //         3.0, //this height is not contain `Text("Just a title")`'s height.
              //   ),
              //   child: target,
              // ),
              target ?? SizedBox()
            ],
          ));
    },
  );
}

Future showModalBottomSheetDetailComment(
  BuildContext context, {
  bool topDevider = true,
  String? title,
  Widget? target,
  double? height,
  Color? barrierColor,
  double radius = 16,
  EdgeInsetsGeometry? padding = const EdgeInsets.symmetric(
    horizontal: 16,
    vertical: 16,
  ),
}) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    barrierColor: barrierColor,
    builder: (BuildContext context) {
      return Container(
          height: height,
          padding: padding,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(radius),
              topRight: Radius.circular(radius),
            ),
            color: Colors.white,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Visibility(
                visible: topDevider,
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    margin: EdgeInsets.only(bottom: 16, top: 4),
                    height: 4.0,
                    width: 40.0,
                    decoration: BoxDecoration(
                      color: AppColors.dividerBottomSheet,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: title != null,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 16,
                    right: 16,
                    top: 16,
                    bottom: 8,
                  ),
                  child: Text(title ?? ""),
                ),
              ),
              Expanded(
                child: ConstrainedBox(
                  constraints: new BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height /
                        4.0 *
                        3.0, //this height is not contain `Text("Just a title")`'s height.
                  ),
                  child: target,
                ),
              ),
            ],
          ));
    },
  );
}

Future showModalBottomSheetChooseThumbnail(
  BuildContext context, {
  VoidCallback? onSubmit,
  String? title,
  String? titleButton,
  TextEditingController? textController,
}) {
  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (BuildContext context) {
      return Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
          color: Colors.white,
        ),
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  margin: EdgeInsets.only(bottom: 16, top: 4),
                  height: 4.0,
                  width: 40.0,
                  decoration: BoxDecoration(
                    color: AppColors.dividerBottomSheet,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              Stack(
                children: [
                  Visibility(
                    visible: title != null,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 8,
                      ),
                      child: Center(
                        child: Text(
                          title!,
                          style: AppStyle.medium.copyWith(
                            fontSize: 16,
                            color: Color(0xFF0F162C),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(AppIcons.ic_bell),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 8,
                ),
                child: DividerWidget(),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                // padding: EdgeInsets.only(
                // bottom: MediaQuery.of(context).viewInsets.bottom),
                child: Text(
                  'Reason',
                  style: AppStyle.medium.copyWith(
                    color: AppColors.textPrimary,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 8,
                ),
                // padding: EdgeInsets.only(
                //     bottom: MediaQuery.of(context).viewInsets.bottom),
                child: TextField(
                  controller: textController,
                  // maxLines: 5,
                  // minLines: 3,
                  // keyboardType: TextInputType.multiline,
                  autofocus: true,
                  cursorColor: Colors.grey,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1.0),
                    ),
                    // filled: true,
                    hintText: "Reason...",
                    // isDense: true,
                    contentPadding: EdgeInsets.all(8),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    OutlinedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('Discard')),
                    SizedBox(width: 16.0),
                    OutlinedButton(
                        onPressed: onSubmit,
                        style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          backgroundColor:
                              MaterialStateProperty.resolveWith<Color>(
                                  (states) {
                            if (states.contains(MaterialState.disabled)) {
                              return Colors.grey.shade100;
                            }
                            return AppColors.primary;
                          }),
                          textStyle:
                              MaterialStateProperty.resolveWith<TextStyle>(
                                  (states) {
                            if (states.contains(MaterialState.disabled)) {
                              return AppStyle.button
                                  .copyWith(color: Colors.white);
                            }
                            return AppStyle.button
                                .copyWith(color: Colors.white);
                          }),
                        ),
                        child: Text(titleButton!)),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
