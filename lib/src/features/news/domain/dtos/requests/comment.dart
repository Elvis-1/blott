class Comment {
  String? issue_id;
  String? comment;

  Comment({this.comment, this.issue_id});

  Map<String, dynamic> toJson() {
    return {'issue_id': issue_id, 'comment': comment};
  }
}
