import 'package:flutter/material.dart';
import 'package:sosmed_sample/theme/style.dart';
import 'package:sosmed_sample/widgets/button_border.dart';
import 'package:sosmed_sample/widgets/text_field_underline.dart';

class AuthPasswordResetPage extends StatefulWidget {
  AuthPasswordResetPage({Key? key}) : super(key: key);

  @override
  _AuthPasswordResetPageState createState() => _AuthPasswordResetPageState();
}

class _AuthPasswordResetPageState extends State<AuthPasswordResetPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: TextFieldUnderline(
              labelText: 'Nomor Ponsel atau Email',
              helperText: 'Contoh: 0813924723',
              onSubmited: (value) {
                print('TextFieldUnderline');
              },
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child: ButtonBorder(
              title: 'Selanjutnya',
              buttonType: ButtonType.standard,
              isFill: true,
              onPressed: () {
                // _onPressed(context);
              },
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(vertical: 24),
            child: Text(
              'Belum punya akun? Daftar',
              style: AppStyle.standart,
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Text(
                'Butuh bantuan? Hubungi v3capp Care',
                style: AppStyle.standart,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
