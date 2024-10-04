import 'dart:convert';
import 'dart:io';
import 'package:blott/src/config/network/api_client.dart';
import 'package:blott/src/config/network/api_endpoints.dart';
import 'package:blott/src/config/network/error_response.dart';
import 'package:blott/src/config/network/failures.dart';
import 'package:blott/src/config/utils/exceptions.dart';
import 'package:blott/src/core/utils/model/api_response.dart';
import 'package:blott/src/features/auth/domain/dtos/requests/new_password_request.dart';
import 'package:blott/src/features/auth/domain/dtos/requests/email_verification_request.dart.dart';
import 'package:blott/src/features/auth/domain/dtos/requests/phone_verifcation_request.dart';
import 'package:blott/src/features/auth/domain/dtos/requests/refresh_session_req.dart';
import 'package:blott/src/features/auth/domain/dtos/requests/user_login.dart';
import 'package:blott/src/features/auth/domain/dtos/response/login_user_response.dart';
import 'package:blott/src/features/auth/domain/dtos/response/new_password_response.dart';
import 'package:blott/src/features/auth/domain/dtos/response/phone_verification.dart';
import 'package:dartz/dartz.dart';

abstract class AuthApi {
  Future<Either<Failure, UserLoginResponse>> refreshSession(
      RefreshSessionRequest refreshSessionRequest);
  // register user

  //logout user
  Future<Either<Failure, ApiResponse>> logOutUser();
// login user
  Future<Either<Failure, UserLoginResponse>> loginUser(
      UserLoginRequest userLoginRequest);

// verify email
  Future<Either<Failure, PhoneVerificationResponse>> verifyEmailCode(
      EmailVerificationRequest phoneVerificationRequest);
// verify phone
  Future<Either<Failure, PhoneVerificationResponse>> verifyPhoneCode(
    PhoneVerificationRequest phoneVerificationRequest,
  );

  // get otp

// comfirm otp

  // reset password
  Future<Either<Failure, PasswordResetResponse>> createNewPassword(
      NewPasswordRequest newPasswordRequest);
}

class AuthApiImpl implements AuthApi {
  AuthApiImpl(this.apiClient);
  ApiClient apiClient;

  @override
  @override
  Future<Either<Failure, UserLoginResponse>> loginUser(
      UserLoginRequest userLoginRequest) async {
    try {
      final response = await apiClient.postData(authEndpoints.loginUser,
          data: userLoginRequest.toJson(),
          extraHeaders: {
            'Content-Type': 'application/json',
            'Accept': 'application/json'
          });

      return Right(UserLoginResponse.fromJson(json.decode(response.body)));
    } on HttpException catch (err) {
      final errorResponse = ErrorResponse.fromJson(json.decode(err.message));
      // print('this is the response oooooo $errorResponse');
      return Left(ApiFailure(message: errorResponse.message ?? ""));
    } on ApiException catch (er) {
      // final errorResponse = ErrorResponse.fromJson(er);
      print('this is the response oooooo $er');
      return Left(ApiFailure(message: er.message));
    }
  }

  @override
  Future<Either<Failure, ApiResponse>> logOutUser() async {
    try {
      final response = await apiClient.postDataWithoutContentType(
        authEndpoints.logout,
        data: null,
      );

      return Right(ApiResponse.fromJson(json.decode(response.body)));
    } on HttpException catch (err) {
      final errorResponse = ErrorResponse.fromJson(json.decode(err.message));
      // print('this is the response oooooo $errorResponse');
      return Left(ApiFailure(message: errorResponse.message ?? ""));
    } on ApiException catch (er) {
      // final errorResponse = ErrorResponse.fromJson(er);
      print('this is the response oooooo $er');
      return Left(ApiFailure(message: er.message));
    }
  }

  @override
  Future<Either<Failure, PhoneVerificationResponse>> verifyEmailCode(
      EmailVerificationRequest phoneVerificationRequest) async {
    try {
      final response = await apiClient.postData(
        authEndpoints.verifyCode,
        data: phoneVerificationRequest.toJson(),
      );

      if (response.statusCode == 200) {
        return Right(
            PhoneVerificationResponse.fromJson(json.decode(response.body)));
      } else {
        return Left(ApiFailure(message: jsonDecode(response.body)));
      }
    } on ApiException catch (err) {
      return Left(ApiFailure(message: err.toString()));
    }
  }

  @override
  Future<Either<Failure, PhoneVerificationResponse>> verifyPhoneCode(
      PhoneVerificationRequest phoneVerificationRequest) async {
    try {
      final response = await apiClient.postData(
        authEndpoints.verifyCode,
        data: phoneVerificationRequest.toJson(),
      );

      if (response.statusCode == 200) {
        return Right(
            PhoneVerificationResponse.fromJson(json.decode(response.body)));
      } else {
        return Left(ApiFailure(message: jsonDecode(response.body)));
      }
    } on ApiException catch (err) {
      return Left(ApiFailure(message: err.toString()));
    }
  }

  @override
  Future<Either<Failure, UserLoginResponse>> refreshSession(
      RefreshSessionRequest refreshSessionRequest) async {
    try {
      final response = await apiClient.postData(
        authEndpoints.refreshSession,
        data: refreshSessionRequest.toJson(),
      );

      if (response.statusCode == 200) {
        return Right(UserLoginResponse.fromJson(json.decode(response.body)));
      } else {
        return Left(ApiFailure(message: jsonDecode(response.body)));
      }
    } on ApiException catch (err) {
      return Left(ApiFailure(message: err.toString()));
    }
  }

  @override
  Future<Either<Failure, PasswordResetResponse>> createNewPassword(
      NewPasswordRequest newPasswordRequest) async {
    try {
      final response = await apiClient.postData(
        authEndpoints.createNewPassword,
        data: newPasswordRequest.toJson(),
      );

      return Right(PasswordResetResponse.fromJson(json.decode(response.body)));
    } on ApiException catch (err) {
      return Left(ApiFailure(message: err.toString()));
    }
  }
}
