import 'package:dartz/dartz.dart';
import 'package:blott/src/config/network/failures.dart';
import 'package:blott/src/core/utils/model/api_response.dart';
import 'package:blott/src/features/auth/data/auth_api.dart';
import 'package:blott/src/features/auth/domain/dtos/requests/refresh_session_req.dart';
import 'package:blott/src/features/auth/domain/dtos/requests/user_login.dart';
import 'package:blott/src/features/auth/domain/dtos/response/login_user_response.dart';

abstract class LoginUserService {
  Future<Either<Failure, UserLoginResponse>> loginUser(
      UserLoginRequest userLoginRequest);
  Future<Either<Failure, ApiResponse>> logoutUser();
  Future<Either<Failure, UserLoginResponse>> refreshSession(
      RefreshSessionRequest refreshSessionRequest);
}

class LoginUserServiceImpl implements LoginUserService {
  AuthApi authApi;
  LoginUserServiceImpl({required this.authApi});

  @override
  Future<Either<Failure, UserLoginResponse>> loginUser(
      UserLoginRequest userLoginRequest) {
    return authApi.loginUser(userLoginRequest);
  }

  @override
  Future<Either<Failure, ApiResponse>> logoutUser() {
    return authApi.logOutUser();
  }

  @override
  Future<Either<Failure, UserLoginResponse>> refreshSession(
      RefreshSessionRequest refreshSessionRequest) {
    return authApi.refreshSession(refreshSessionRequest);
  }
}
