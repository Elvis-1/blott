class NewPasswordRequest {
  String password;
  String confirmPassword;

  NewPasswordRequest({required this.password, required this.confirmPassword});

  Map<String, dynamic> toJson() {
    return {'new_password': password, 'confirm_password': confirmPassword};
  }
}
