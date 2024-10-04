class PhoneVerificationResponse {
  final String message;

  PhoneVerificationResponse({required this.message});

  // Factory constructor to create a PhoneVerificationResponse from JSON
  factory PhoneVerificationResponse.fromJson(Map<String, dynamic> json) {
    return PhoneVerificationResponse(
      message: json['message'],
    );
  }

  // Method to convert PhoneVerificationResponse to JSON
  Map<String, dynamic> toJson() {
    return {
      'message': message,
    };
  }
}
