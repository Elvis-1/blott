import 'dart:io';

class IssuesRequest {
  String? description;
  String? issue_category_id;
  String? transaction_id;
  File? attachment;

  IssuesRequest(
      {this.attachment,
      this.description,
      this.issue_category_id,
      this.transaction_id});

  Map<String, dynamic> toJson() {
    return {
      'issue_category_id': issue_category_id,
      'transaction_id': transaction_id,
      'description': description,
      'attachment': attachment
    };
  }
}
