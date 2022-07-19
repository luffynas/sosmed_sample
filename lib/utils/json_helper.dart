import 'dart:convert';

import 'package:sosmed_sample/core/exception/app_exception.dart';

/// Try to decode json text into [Map<String, dynamic>]
/// Will raise [AppException] when something went wrong.
Map<String, dynamic> tryDecode(String txtData) {
  // //print("txtData :: $txtData");
  try {
    if (txtData.contains(r'{\')) {
      var data = json.decode(txtData);
      return data as Map<String, dynamic>;
    } else {
      var data = json.decode(txtData);
      return data as Map<String, dynamic>;
    }
  } catch (e) {
    print('Cannot decode json message: $txtData');
    throw AppException('Cannot decode json', status: 'error');
  }
}
