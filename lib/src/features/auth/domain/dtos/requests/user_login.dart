class UserLoginRequest {
  String userName;
  String password;

  UserLoginRequest({required this.userName, required this.password});

  // to json
  Map<String, dynamic> toJson() {
    return {'username': userName, 'password': password};
  }

  // from json
  factory UserLoginRequest.fromJoson(Map<String, dynamic> json) {
    return UserLoginRequest(
        userName: json['username'], password: json['password']);
  }
}
