import 'package:equatable/equatable.dart';

class UploadResult extends Equatable {
  const UploadResult({
    required this.status,
    this.url,
    this.message,
  });

  final int status;
  final String? url;
  final String? message;

  factory UploadResult.fromMap(Map<String, dynamic> json) => UploadResult(
        status: json["status_code"] as int,
        url: json["data"][0] as String?,
        message: json["message"] as String?,
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "url": url,
        "message": message,
      };

  @override
  List<Object?> get props => [status, url, message];
}
