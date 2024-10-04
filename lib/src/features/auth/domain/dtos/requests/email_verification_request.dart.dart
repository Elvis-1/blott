class EmailVerificationRequest {
  final String code;
  final String email;

  EmailVerificationRequest({required this.code, required this.email});

  // Factory constructor to create a PhoneVerificationRequest from JSON
  factory EmailVerificationRequest.fromJson(Map<String, dynamic> json) {
    return EmailVerificationRequest(code: json['code'], email: json['email']);
  }

  // Method to convert PhoneVerificationRequest to JSON
  Map<String, dynamic> toJson() {
    return {'code': code, 'email': email};
  }
}
