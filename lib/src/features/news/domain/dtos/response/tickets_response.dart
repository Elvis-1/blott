class Complaint {
  final String? reference;
  final String? issueCategoryId;
  final String? description;
  final String? status;
  final String? createdAt;
  final String? userId;
  final String? id;
  final String? transactionId;
  final String? priority;
  final bool? enabled;
  final String? updatedAt;
  final String? profileId;
  final Map<String, dynamic>? transaction;

  Complaint({
    this.reference,
    this.issueCategoryId,
    this.description,
    this.status,
    this.createdAt,
    this.userId,
    this.id,
    this.transactionId,
    this.priority,
    this.enabled,
    this.updatedAt,
    this.profileId,
    this.transaction,
  });

  factory Complaint.fromJson(Map<String, dynamic> json) {
    return Complaint(
      reference: json['reference'] as String?,
      issueCategoryId: json['issue_category_id'] as String?,
      description: json['description'] as String?,
      status: json['status'] as String?,
      createdAt: json['created_at'] as String?,
      userId: json['user_id'] as String?,
      id: json['id'] as String?,
      transactionId: json['transaction_id'] as String?,
      priority: json['priority'] as String?,
      enabled: json['enabled'] as bool?,
      updatedAt: json['updated_at'] as String?,
      profileId: json['profile_id'] as String?,
      transaction: json['transaction'] as Map<String, dynamic>?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'reference': reference,
      'issue_category_id': issueCategoryId,
      'description': description,
      'status': status,
      'created_at': createdAt,
      'user_id': userId,
      'id': id,
      'transaction_id': transactionId,
      'priority': priority,
      'enabled': enabled,
      'updated_at': updatedAt,
      'profile_id': profileId,
      'transaction': transaction,
    };
  }
}

class ComplaintsResponse {
  final String? status;
  final String? message;
  final List<Complaint>? data;
  final Map<String, dynamic>? error;
  final List<Map<String, dynamic>>? links;

  ComplaintsResponse({
    this.status,
    this.message,
    this.data,
    this.error,
    this.links,
  });

  factory ComplaintsResponse.fromJson(Map<String, dynamic> json) {
    return ComplaintsResponse(
      status: json['status'] as String?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Complaint.fromJson(e as Map<String, dynamic>))
          .toList(),
      error: json['error'] as Map<String, dynamic>?,
      links: (json['links'] as List<dynamic>?)
          ?.map((e) => Map<String, dynamic>.from(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'data': data?.map((e) => e.toJson()).toList(),
      'error': error,
      'links': links?.map((e) => e).toList(),
    };
  }
}
