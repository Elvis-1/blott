class PhoneVerificationRequest {
  final String code;

  PhoneVerificationRequest({
    required this.code,
  });

  // Method to convert PhoneVerificationRequest to JSON
  Map<String, dynamic> toJson() {
    return {
      'code': code,
    };
  }
}
