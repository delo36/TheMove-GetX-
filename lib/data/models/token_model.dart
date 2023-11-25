import 'dart:convert';

TokenModel tokenModelFromJson(String str) => TokenModel.fromJson(json.decode(str));

String tokenModelToJson(TokenModel data) => json.encode(data.toJson());

class TokenModel {
  bool success;
  String expiresAt;
  String requestToken;

  TokenModel({
    required this.success,
    required this.expiresAt,
    required this.requestToken,
  });

  factory TokenModel.fromJson(Map<String, dynamic> json) => TokenModel(
    success: json["success"],
    expiresAt: json["expires_at"],
    requestToken: json["request_token"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "expires_at": expiresAt,
    "request_token": requestToken,
  };
}
