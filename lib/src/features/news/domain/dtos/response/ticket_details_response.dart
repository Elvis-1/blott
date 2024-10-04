class IssueDetail {
  final String? id;
  final String? reference;
  final int? issueCategoryId;
  final String? description;
  final String? priority;
  final String? status;
  final String? createdAt;
  final String? userId;
  final List<Conversation>? conversations;

  IssueDetail({
    this.id,
    this.reference,
    this.issueCategoryId,
    this.description,
    this.priority,
    this.status,
    this.createdAt,
    this.userId,
    this.conversations,
  });

  factory IssueDetail.fromJson(Map<String, dynamic> json) {
    return IssueDetail(
      id: json['id'] as String?,
      reference: json['reference'] as String?,
      issueCategoryId: json['issue_category_id'] as int?,
      description: json['description'] as String?,
      priority: json['priority'] as String?,
      status: json['status'] as String?,
      createdAt: json['created_at'] as String?,
      userId: json['user_id'] as String?,
      conversations: (json['conversations'] as List<dynamic>?)
          ?.map((e) => Conversation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'reference': reference,
      'issue_category_id': issueCategoryId,
      'description': description,
      'priority': priority,
      'status': status,
      'created_at': createdAt,
      'user_id': userId,
      'conversations': conversations?.map((e) => e.toJson()).toList(),
    };
  }
}

class Conversation {
  final String? id;
  final String? issueId;
  final String? comment;
  final String? status;
  final String? userId;
  final String? displayTag;
  final String? createdAt;

  Conversation({
    this.id,
    this.issueId,
    this.comment,
    this.status,
    this.userId,
    this.displayTag,
    this.createdAt,
  });

  factory Conversation.fromJson(Map<String, dynamic> json) {
    return Conversation(
      id: json['id'] as String?,
      issueId: json['issue_id'] as String?,
      comment: json['comment'] as String?,
      status: json['status'] as String?,
      userId: json['user_id'] as String?,
      displayTag: json['display_tag'] as String?,
      createdAt: json['created_at'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'issue_id': issueId,
      'comment': comment,
      'status': status,
      'user_id': userId,
      'display_tag': displayTag,
      'created_at': createdAt,
    };
  }
}

class IssueResponse {
  final String? status;
  final String? message;
  final IssueDetail? data;
  final Map<String, dynamic>? error;
  final List<Map<String, dynamic>>? links;

  IssueResponse({
    this.status,
    this.message,
    this.data,
    this.error,
    this.links,
  });

  factory IssueResponse.fromJson(Map<String, dynamic> json) {
    return IssueResponse(
      status: json['status'] as String?,
      message: json['message'] as String?,
      data: json['data'] != null ? IssueDetail.fromJson(json['data']) : null,
      error: json['error'] as Map<String, dynamic>?,
      links: (json['links'] as List<dynamic>?)
          ?.map((e) => Map<String, dynamic>.from(e))
          .toList(),
    );
  }
}
