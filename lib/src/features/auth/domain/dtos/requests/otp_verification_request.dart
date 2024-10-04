class OTPVerificationRequest {
  final String code;

  OTPVerificationRequest({required this.code});

  // Factory constructor to create a OTPVerificationRequest from JSON
  factory OTPVerificationRequest.fromJson(Map<String, dynamic> json) {
    return OTPVerificationRequest(
      code: json['code'],
    );
  }

  // Method to convert OTPVerificationRequest to JSON
  Map<String, dynamic> toJson() {
    return {
      'code': code,
    };
  }
}
