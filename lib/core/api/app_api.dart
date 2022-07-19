import 'dart:developer';

import 'package:sosmed_sample/core/exception/app_exception.dart';
import 'package:sosmed_sample/utils/json_helper.dart';

import 'api_client.dart';

export './api_client.dart';
export './auth.dart';
export './session.dart';

class PublicApi {
  static Future<Map<String, dynamic>> get(String path) async {
    return ApiClient().public().get(path).then((resp) async {
      // ignore: avoid_dynamic_calls
      if (resp == null || resp.body == null) {
        throw AppException('Cannot connect to server (code: 5832)');
      }
      // ignore: avoid_dynamic_calls
      final respData = tryDecode(resp.body as String);
      // checkValidResp(respData);
      // checkValidResultResp(respData);
      return respData;
    }).catchError(handleError);
  }

  static Future<Map<String, dynamic>> post(String path,
      {Map<String, dynamic>? data}) async {
    // //print("POST $path (public)");
    final rv =
        await ApiClient().public().post(path, body: data).then((resp) async {
      // if (resp == null || resp.body == null) {
      //   throw AppException("Cannot connect to server (code: 5832)");
      // }
      final respData = tryDecode(resp.body as String);
      checkValidResp(respData);
      checkValidResultResp(respData);
      return respData;
    }).catchError(handleError);
    return rv;
  }

  static Future<Map<String, dynamic>> delete(String path,
      {Map<String, dynamic>? data}) async {
    // //print("POST $path (public)");
    final rv =
        await ApiClient().public().delete(path, body: data).then((resp) async {
      // if (resp == null || resp.body == null) {
      //   throw AppException("Cannot connect to server (code: 5832)");
      // }
      final respData = tryDecode(resp.body as String);
      // checkValidResp(respData);
      checkValidResultResp(respData);
      return respData;
    }).catchError(handleError);
    return rv;
  }
}

class PrivateApi {
  static Future<Map<String, dynamic>> get(String path) async {
    // //print("GET $path (private)");
    final data = await ApiClient().private().get(path).then((resp) async {
      if (resp == null || resp.body == null) {
        throw AppException('Cannot connect to server (code: 5832)');
      }
      final respData = tryDecode(resp.body as String);
      checkValidResp(respData);
      checkValidResultResp(respData);
      return respData;
    }).catchError(handleError);
    return data;
  }

  static Future<Map<String, dynamic>> post(
      String path, Map<String, dynamic> data) async {
    // //print("POST $path (private)");
    final rv =
        await ApiClient().private().post(path, body: data).then((resp) async {
      if (resp == null || resp.body == null) {
        throw AppException('Cannot connect to server (code: 5832)');
      }
      final respData = await tryDecode(resp.body as String);
      checkValidResp(respData);
      checkValidResultResp(respData);
      return respData;
    }).catchError(handleError);
    return rv;
  }
}

class FilesystemApi {
  static Future<Map<String, dynamic>> upload(
      String path, Map<String, dynamic> data,
      {OnUploadProgressCallback? onUploadProgress}) async {
    final rv = await ApiClient()
        .public()
        .upload(path, body: data, onUploadProgress: onUploadProgress);
    //     .then((resp) {
    //   // log("message :: resp ::: $resp");
    //   if (resp == null) {
    //     throw AppException("Cannot connect to server (code: 5832)");
    //   }
    //   // final respData = tryDecode(resp);
    //   // if (respData == null) {
    //   //   throw AppException("Cannot connect to server (code: 5832)");
    //   // }
    //   checkValidResp(resp);
    //   checkValidResultResp(resp);
    //   return resp;
    // }).catchError(handleError);
    log("message :: $rv");
    return rv;
  }
}

class GcsApi {
  static Future<Map<String, dynamic>> upload(
      String path, Map<String, dynamic> data,
      {OnUploadProgressCallback? onUploadProgress}) async {
    final rv = await ApiClient()
        .gcs()
        .upload(path, body: data, onUploadProgress: onUploadProgress);
    // .then((resp) {
    //   // log("message :: resp ::: $resp");
    //   if (resp == null) {
    //     throw AppException("Cannot connect to server (code: 5832)");
    //   }
    // final respData = tryDecode(resp);
    // if (respData == null) {
    //   throw AppException("Cannot connect to server (code: 5832)");
    // }
    // checkValidResp(resp);
    // checkValidResultResp(resp);
    //   return resp;
    // }).catchError(handleError);
    return rv;
  }
}

class OSSApi {
  static Future<Map<String, dynamic>> upload(
      String path, Map<String, dynamic> data,
      {OnUploadProgressCallback? onUploadProgress}) async {
    // //print("POST $path data: $data");
    final rv = await ApiClient()
        .oss()
        .upload(path, body: data, onUploadProgress: onUploadProgress);
    //     .then((resp) {
    //   //print("=== resp $resp");
    //   if (resp == null) {
    //     throw AppException("Cannot connect to server (code: 5832)");
    //   }

    //   if (resp == null || resp.body == null) {
    //     throw AppException("Cannot connect to server (code: 5832)");
    //   }

    //   final respData = tryDecode(resp.body);
    //   if (respData == null) {
    //     throw AppException("Cannot connect to server (code: 5832)");
    //   }
    //   return respData;
    // }).catchError(handleError);
    //print("=== resp rv $rv");
    return rv;
  }
}

/// Automatically throw exception with server error information wrapped
/// into [AppException]
void checkValidResp(Map<String, dynamic> respData) {
  int code = respData['status_code'] as int;
  if (code != 0) {
    throw AppException.fromResp(respData);
  }
}

void checkValidResultResp(Map<String, dynamic> respData) {
  if (!respData.containsKey("data")) {
    //print('Invalid server response: $respData');
    throw AppException("Invalid server response, please report to developer");
  }
}
