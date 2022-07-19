import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sosmed_sample/theme/app_icons.dart';
import 'package:sosmed_sample/theme/color.dart';
import 'package:sosmed_sample/theme/style.dart';
import 'package:sosmed_sample/widgets/divider_widget.dart';
import 'package:sosmed_sample/widgets/modal_bottom_sheet.dart';
import 'package:sosmed_sample/widgets/text_field_box.dart';

class ProfileSettingView extends StatefulWidget {
  const ProfileSettingView({Key? key}) : super(key: key);

  @override
  State<ProfileSettingView> createState() => _ProfileSettingViewState();
}

class _ProfileSettingViewState extends State<ProfileSettingView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Informasi Akun', style: AppStyle.appBarTitle),
        actions: [],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Kata Sandi',
                style: AppStyle.bold,
              ),
              TextButton(
                onPressed: () {
                  _popupChangePassword(context);
                },
                child: Text(
                  'Ubah',
                  style: AppStyle.bold.copyWith(color: AppColors.primary),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Bahasa',
                style: AppStyle.bold,
              ),
              TextButton(
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image.asset('assets/images/flag/ic_indonesia.png'),
                    const SizedBox(width: 4),
                    Text(
                      'Ubah',
                      style: AppStyle.bold.copyWith(
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(width: 4),
                    const Icon(
                      AppIcons.ic_chevron_down,
                      color: AppColors.icon,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Text(
            'Notifikasi',
            style: AppStyle.medium.copyWith(fontSize: 20),
          ),
          const SizedBox(height: 16),
          const DividerWidget(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Aplikasi', style: AppStyle.bold),
              Switch(
                value: true,
                onChanged: (value) {},
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Pesan', style: AppStyle.bold),
              Switch(
                value: true,
                onChanged: (value) {},
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Email', style: AppStyle.bold),
              Switch(
                value: true,
                onChanged: (value) {},
              ),
            ],
          ),
          const SizedBox(height: 24),
          Text(
            'Informasi Umum',
            style: AppStyle.medium.copyWith(fontSize: 20),
          ),
          const SizedBox(height: 16),
          const DividerWidget(),
          GestureDetector(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: const Text('Tentang Edtrons', style: AppStyle.bold),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: const Text('Syarat & Ketentuan', style: AppStyle.bold),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: const Text('Kebijakan Privasi', style: AppStyle.bold),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: const Text('Bantuan', style: AppStyle.bold),
            ),
          ),
        ],
      ),
    );
  }

  Future<dynamic> _popupChangePassword(BuildContext context) {
    return showModalBottomSheetDynamic(
      context,
      title: 'Ubah Kata Sandi',
      target: ListView(
        children: [
          TextFieldBox(
            labelText: 'Kata Sandi Lama',
            hintText: 'Masukkan kata sandi saat ini',
            textController: TextEditingController(text: ''),
            suffixIcon: const Icon(AppIcons.ic_eye_close),
          ),
        ],
      ),
      // onClose: () {
      //   Navigator.of(context).pop();
      // },
    );
  }
}
