class RequestResetPasswordRequest {
  RequestResetPasswordRequest({required this.email});
  String email;

  Map<String, dynamic> toJson() {
    return {'email': email};
  }
}
