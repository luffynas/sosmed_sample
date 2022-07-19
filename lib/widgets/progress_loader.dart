import 'package:flutter/material.dart';

import 'loading_indicator.dart';

enum Status { DEFAULT, SUCCESS, FAILED, WARNING, CANCELED }

showSnackBar(BuildContext context, String message, Status status) {
  Widget _icon;
  switch (status) {
    case Status.SUCCESS:
      _icon = Icon(
        Icons.check,
        color: Colors.green,
      );
      break;
    case Status.WARNING:
      _icon = Icon(
        Icons.warning,
        color: Colors.yellow,
      );
      break;
    case Status.FAILED:
      _icon = Icon(
        Icons.close,
        color: Colors.red,
      );
      break;
    default:
      _icon = SizedBox();
  }
  final snackBar = SnackBar(
      content: Row(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      _icon,
      Expanded(
        child: Container(
          padding: EdgeInsets.only(left: 8),
          child: Text(message),
        ),
      ),
    ],
  )
      // action: SnackBarAction(
      //   label: 'Undo',
      //   onPressed: () {
      //     // digunakan untuk menambahkan action seperti Undo, Redo dll!
      //   },
      // ),
      );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

bool _isShowing = false;
Future<bool> showLoading(BuildContext context, String message,
    {bool isDismissable = false}) async {
  _isShowing = true;
  return await showDialog<bool>(
        context: context,
        barrierDismissible: isDismissable,
        builder: (context) {
          return Dialog(
            child: Container(
                padding: EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(width: 40, height: 40, child: LoadingIndicator()),
                    SizedBox(
                      width: 16.0,
                    ),
                    Expanded(
                      child: Text("$message"),
                    )
                  ],
                )),
          );
        },
      ) ??
      !_isShowing;
}

dissmissLoading(BuildContext context) {
  print('context $context');
  if (_isShowing) {
    _isShowing = false;
    try {
      Navigator.pop(context);
      print('context dismiss');
    } catch (error) {
      print('context dismiss error $error');
      Navigator.of(context).dispose();
    }
  }
}
