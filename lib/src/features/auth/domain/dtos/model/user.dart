class User {
  String? firstName;
  String? lastName;

  User({this.firstName, this.lastName});

  Map<String, dynamic> toJson() {
    return {'firstName': firstName, 'lastName': lastName};
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        firstName: json['firstName'] as String?,
        lastName: json['lastName'] as String?);
  }
}
