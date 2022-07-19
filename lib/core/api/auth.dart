import 'package:sosmed_sample/utils/json_helper.dart';

import 'app_api.dart';

enum AuthProvider { standart, google, facebook }

class Auth {
  static Future<Map<String, dynamic>?> doLogin(String email, String password) {
    return ApiClient().public().post("/auth/login", body: {
      'identifier': email,
      'password': password,
    }).then((resp) {
      //print("resp: $resp");
      final data = tryDecode(resp.body as String);
      print('login data: $data');
      // if (data['status'] != "success") {
      //   throw AppException.fromResp(data).withMsg(data["message"]);
      // }
      return data; //new Session(data['access_token']);
    }).catchError(handleError);
  }

  static Future<Map<String, dynamic>> doLoginWithProvider(
      String email, AuthProvider provider) {
    return ApiClient().public().post("/user/create", body: {
      'email': email,
      'provider': provider.name,
    }).then((resp) {
      //print("resp: $resp");
      final data = tryDecode(resp.body as String);
      print("login data: $data");
      // if (data['status'] != "success") {
      //   throw AppException.fromResp(data).withMsg(data["message"]);
      // }
      return data; //new Session(data['access_token']);
    }).catchError(handleError);
  }

  static Future<Map<String, dynamic>> doRegister(
      String fullname, String email, String password) {
    return ApiClient().public().post("/auth/register", body: {
      'fullname': fullname,
      'identifier': email,
      'password': password,
    }).then((resp) {
      //print("resp: $resp");
      final data = tryDecode(resp.body as String);
      print("login data: $data");
      // if (data['status'] != "success") {
      //   throw AppException.fromResp(data).withMsg(data["message"]);
      // }
      return data; //new Session(data['access_token']);
    }).catchError(handleError);
  }

  static Future<Map<String, dynamic>> resetPassword(Map<String, dynamic> data) {
    return ApiClient()
        .public()
        .post("/reset-password", body: data)
        .then((resp) {
      //print("resp: $resp");
      final data = tryDecode(resp.body as String);
      //print("login data: $data");
      // if (data['status'] != "success") {
      //   throw AppException.fromResp(data).withMsg(data["message"]);
      // }
      return data; //new Session(data['access_token']);
    }).catchError(handleError);
  }

  static Future<void> doLogout() {
    return ApiClient().public().post("/logout").then((resp) {
      print("resp: ${resp.body}");
      // final data = tryDecode(resp.body);
      // checkValidResp(data);
    }).catchError(handleError, test: (_) => true);
  }
}
