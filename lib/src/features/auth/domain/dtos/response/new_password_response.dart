class PasswordResetResponse {
  final String? status;
  final String? message;
  final Map<String, dynamic>? data;
  final dynamic error;
  final Link? links;

  PasswordResetResponse({
    this.status,
    this.message,
    this.data,
    this.error,
    this.links,
  });

  factory PasswordResetResponse.fromJson(Map<String, dynamic> json) {
    return PasswordResetResponse(
      status: json['status'] as String?,
      message: json['message'] as String?,
      data:
          json['data'] != null ? Map<String, dynamic>.from(json['data']) : null,
      error: json['error'],
      links: json['links'] != null ? Link.fromJson(json['links']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'data': data,
      'error': error,
      'links': links?.toJson(),
    };
  }
}

class Link {
  final String? method;
  final String? rel;
  final String? href;

  Link({
    this.method,
    this.rel,
    this.href,
  });

  factory Link.fromJson(Map<String, dynamic> json) {
    return Link(
      method: json['method'] as String?,
      rel: json['rel'] as String?,
      href: json['href'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'method': method,
      'rel': rel,
      'href': href,
    };
  }
}
