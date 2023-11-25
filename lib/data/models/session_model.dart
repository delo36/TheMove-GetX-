import 'dart:convert';

SessionModel sessionModelFromJson(String str) => SessionModel.fromJson(json.decode(str));

String sessionModelToJson(SessionModel data) => json.encode(data.toJson());

class SessionModel {
  bool success;
  String guestSessionId;
  String expiresAt;

  SessionModel({
    required this.success,
    required this.guestSessionId,
    required this.expiresAt,
  });

  factory SessionModel.fromJson(Map<String, dynamic> json) => SessionModel(
    success: json["success"],
    guestSessionId: json["guest_session_id"],
    expiresAt: json["expires_at"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "guest_session_id": guestSessionId,
    "expires_at": expiresAt,
  };
}
