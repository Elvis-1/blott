class ErrorResponse {
  String? status;
  String? message;
  dynamic data;
  List<String?> error;
  List<dynamic> links;

  ErrorResponse({
    required this.status,
    required this.message,
    this.data,
    required this.error,
    required this.links,
  });

  // Factory constructor to create an ErrorResponse from JSON
  factory ErrorResponse.fromJson(Map<String?, dynamic> json) {
    return ErrorResponse(
      status: json['status'],
      message: json['message'],
      data: json['data'],
      error: List<String>.from(json['error']),
      links: List<dynamic>.from(json['links']),
    );
  }

  // Method to convert ErrorResponse to JSON
  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'data': data,
      'error': error,
      'links': links,
    };
  }
}
