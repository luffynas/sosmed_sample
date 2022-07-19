import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sosmed_sample/theme/app_icons.dart';
import 'package:sosmed_sample/theme/style.dart';
import 'package:sosmed_sample/widgets/button_border.dart';
import 'package:sosmed_sample/widgets/checkbox_widget.dart';
import 'package:sosmed_sample/widgets/text_field_box.dart';

class ProfileInformationView extends StatefulWidget {
  const ProfileInformationView({Key? key}) : super(key: key);

  @override
  State<ProfileInformationView> createState() => _ProfileInformationViewState();
}

class _ProfileInformationViewState extends State<ProfileInformationView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Informasi Akun', style: AppStyle.appBarTitle),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(AppIcons.ic_more_vertical),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          const SizedBox(height: 24),
          TextFieldBox(
            labelText: 'Alamat Email',
            hintText: 'Masukan alamat email',
            textController:
                TextEditingController(text: 'zakydwinawan@mail.com'),
          ),
          const SizedBox(height: 16),
          CheckBoxWidget(
            title: 'Tampilkan di Profil',
            onChanged: (value) {},
          ),
          const SizedBox(height: 16),
          TextFieldBox(
            labelText: 'Nomor Ponsel',
            hintText: 'Masukan Nomor Ponsel*',
            textController: TextEditingController(text: '81280002000'),
          ),
          const SizedBox(height: 16),
          CheckBoxWidget(
            title: 'Tampilkan di Profil',
            value: true,
            onChanged: (value) {},
          ),
          const SizedBox(height: 16),
          TextFieldBox(
            labelText: 'Jenis Kelamin',
            hintText: 'Masukan Jenis Kelamin',
            textController: TextEditingController(text: 'Laki-laki'),
          ),
          const SizedBox(height: 16),
          TextFieldBox(
            labelText: 'Tanggal Lahir',
            hintText: 'Masukan Tanggal Lahir',
            textController: TextEditingController(text: ''),
          ),
          const SizedBox(height: 16),
          CheckBoxWidget(
            title: 'Tampilkan di Profil',
            value: true,
            onChanged: (value) {},
          ),
          const SizedBox(height: 16),
          CheckBoxWidget(
            title: 'Tampilkan Tahun Kelahiran',
            value: false,
            onChanged: (value) {},
          ),
          const SizedBox(height: 16),
          TextFieldBox(
            labelText: 'Alamat',
            hintText: 'Masukkan alamat tempat tinggal',
            textController: TextEditingController(text: ''),
          ),
          const SizedBox(height: 32),
          ButtonBorder(
            title: 'Simpan',
            isFill: true,
            buttonType: ButtonType.big,
            textColor: Colors.white,
            onPressed: () {},
          ),
          const SizedBox(height: 64),
        ],
      ),
    );
  }
}
