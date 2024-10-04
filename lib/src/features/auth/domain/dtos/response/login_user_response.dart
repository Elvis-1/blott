import 'dart:convert';

class UserLoginResponse {
  final String status;
  final String message;
  final Data? data;
  final List<String>? error;
  final List<dynamic> links;

  UserLoginResponse({
    required this.status,
    required this.message,
    this.data,
    this.error,
    required this.links,
  });

  factory UserLoginResponse.fromJson(Map<String, dynamic> json) {
    return UserLoginResponse(
      status: json['status'],
      message: json['message'],
      data: json['data'] != null ? Data.fromJson(json['data']) : null,
      error: json['error'] != null ? List<String>.from(json['error']) : null,
      links: List<dynamic>.from(json['links']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'data': data?.toJson(),
      'error': error,
      'links': links,
    };
  }
}

class Data {
  final String? accessToken;
  final String? refreshToken;
  final String? tokenType;

  Data({
    this.accessToken,
    this.refreshToken,
    this.tokenType,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      accessToken: json['access_token'] as String?,
      refreshToken: json['refresh_token'] as String?,
      tokenType: json['token_type'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'access_token': accessToken,
      'refresh_token': refreshToken,
      'token_type': tokenType,
    };
  }
}
