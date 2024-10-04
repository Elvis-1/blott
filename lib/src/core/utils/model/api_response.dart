class ApiResponse {
  final String status;
  final String message;
  final dynamic data;
  final dynamic error;
  final List<dynamic> links;

  ApiResponse({
    required this.status,
    required this.message,
    this.data,
    this.error,
    required this.links,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      status: json['status'] as String,
      message: json['message'] as String,
      data: json['data'],
      error: json['error'],
      links: json['links'] as List<dynamic>,
    );
  }

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
