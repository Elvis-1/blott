class RefreshSessionRequest {
  String? refreshToken;
  int? code;

  RefreshSessionRequest({required this.refreshToken, this.code});

  // Method to convert PhoneVerificationRequest to JSON
  Map<String, dynamic> toJson() {
    return {"refresh_token": refreshToken, "pin": code};
  }
}
