import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sosmed_sample/theme/app_icons.dart';
import 'package:sosmed_sample/theme/color.dart';
import 'package:sosmed_sample/theme/style.dart';
import 'package:sosmed_sample/utils/photo_helper.dart';
import 'package:sosmed_sample/widgets/avatar_widget.dart';
import 'package:sosmed_sample/widgets/button_border.dart';
import 'package:sosmed_sample/widgets/modal_bottom_sheet.dart';
import 'package:sosmed_sample/widgets/text_field_box.dart';

class ProfileFormView extends StatefulWidget {
  const ProfileFormView({Key? key}) : super(key: key);

  @override
  State<ProfileFormView> createState() => _ProfileFormViewState();
}

class _ProfileFormViewState extends State<ProfileFormView> {
  String path = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Profile', style: AppStyle.appBarTitle),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(AppIcons.ic_more_vertical),
          ),
        ],
      ),
      body: ListView(
        children: [
          Stack(
            children: [
              SizedBox(
                child: Image.asset(
                  'assets/images/background/ic_profile_edit_background.png',
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
                    FittedBox(
                      child: ButtonBorder(
                        title: 'Unggah Foto Profil',
                        color: const Color(0xFF092C4C),
                        textColor: Colors.white,
                        isFill: true,
                        buttonType: ButtonType.big,
                        onPressed: () {
                          _uploadImage(context);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: TextFieldBox(
              labelText: 'Nama Lengkap',
              hintText: 'Enter Nama Lengkap',
              readOnly: true,
              textController: TextEditingController(text: 'Zaky Dwinawan'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: TextFieldBox(
              labelText: 'Nama Panggilan',
              hintText: 'Enter Nama Panggilan',
              textController: TextEditingController(text: 'Zaky'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: TextFieldBox(
              labelText: 'Tahun Lulus',
              hintText: 'Enter Tahun Lulus',
              readOnly: true,
              textController: TextEditingController(text: '2015'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: TextFieldBox(
              labelText: 'Bio / Pekerjaan',
              hintText: 'Masukkan bio / posisi / pekerjaan saat ini',
              readOnly: false,
              textController: TextEditingController(text: ''),
            ),
          ),
          const SizedBox(height: 32),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              'Social Media',
              style: AppStyle.bold.copyWith(fontSize: 22),
            ),
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                const Icon(
                  AppIcons.ic_facebook,
                  size: 32,
                  color: AppColors.primary,
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: TextFieldBox(
                    hintText: 'Masukkan url facebook',
                    textController: TextEditingController(text: ''),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                const Icon(
                  AppIcons.ic_instagram,
                  size: 32,
                  color: AppColors.primary,
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: TextFieldBox(
                    hintText: 'Masukkan url instagram',
                    textController: TextEditingController(text: ''),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                const Icon(
                  AppIcons.ic_twitter,
                  size: 32,
                  color: AppColors.primary,
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: TextFieldBox(
                    hintText: 'Masukkan url twitter',
                    textController: TextEditingController(text: ''),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                const Icon(
                  AppIcons.ic_linkedin,
                  size: 32,
                  color: AppColors.primary,
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: TextFieldBox(
                    hintText: 'Masukkan url linkedin',
                    textController: TextEditingController(text: ''),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }

  void _uploadImage(BuildContext context) {
    // final _uploadBloc = context.read<UploadBloc>();
    showModalChangePhoto(
      context,
      onSelectGallery: (file) async {
        if (file != null) {
          await cropImage(context, path: file, aspectRatio: 1.0,
              onSave: (croppedFile) {
            path = croppedFile.path;
            // _uploadBloc.add(
            //   UploadMediaPhoto(
            //     mediaKind: UploadMediaKind.Image,
            //     pathFile: croppedFile.path,
            //   ),
            // );
          });
        }
      },
      onSelectCamera: (file) async {
        if (file != null) {
          await cropImage(context, path: file, aspectRatio: 1.0,
              onSave: (croppedFile) {
            path = croppedFile.path;
            // _uploadBloc.add(
            //   UploadMediaPhoto(
            //     mediaKind: UploadMediaKind.Image,
            //     pathFile: croppedFile.path,
            //   ),
            // );
          });
        }
      },
      onRemovePhoto: () {},
    );
  }
}
