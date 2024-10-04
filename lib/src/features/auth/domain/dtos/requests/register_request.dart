class RegisterUserRequest {
  String birthday;
  String email;
  String firstName;
  String lastName;
  String password;
  String telephone;

  RegisterUserRequest({
    required this.birthday,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.password,
    required this.telephone,
  });

  factory RegisterUserRequest.fromJson(Map<String, dynamic> json) {
    return RegisterUserRequest(
      birthday: json['birthday'],
      email: json['email'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      password: json['password'],
      telephone: json['telephone'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'birthday': birthday,
      'email': email,
      'first_name': firstName,
      'last_name': lastName,
      'password': password,
      'telephone': telephone,
    };
  }
}
