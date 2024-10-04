import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:blott/src/config/network/error_response.dart';
import 'package:blott/src/core/utils/app_const/app_strings.dart';

class ApiException implements Exception {
  final String message;

  ApiException(this.message);

  static ApiException getException(dynamic err) {
    if (err is http.ClientException) {
      return InternetConnectException(err.message);
    }

    if (err is http.Response) {
      try {
        print('This is the error ${err.body}');
        return _handleResponseError(err);
      } catch (_) {
        print('This is another error ${err.body}');
        return OtherExceptions(AppStrings.kDefaultError);
      }
    }

    return OtherExceptions(AppStrings.kDefaultError);
  }

  static ApiException getOtherException(dynamic err) {
    if (err is http.ClientException) {
      return InternetConnectException(err.message);
    }

    if (err is http.Response) {
      try {
        print('This is the error ${err.body}');
        return _handleErrorResponse(err);
      } catch (_) {
        print('This is another error ${err.body}');
        return OtherExceptions(AppStrings.kDefaultError);
      }
    }

    // print('This is it $err');
    return OtherExceptions(err.message);
  }

  static ApiException _handleErrorResponse(http.Response response) {
    try {
      final Map<String, dynamic> responseData = jsonDecode(response.body);

      if (responseData.containsKey('message')) {
        final dynamic errorData =
            responseData["error"][0] ?? responseData["message"];

        return OtherExceptions(errorData);
        //   }
      }
    } catch (_) {
      debugPrint('ENTERED CATCH BLOCK');

      final errorResponse = ErrorResponse.fromJson(jsonDecode(response.body));
      return OtherExceptions(errorResponse.message!);
    }

    // Handle status code-based exceptions
    if (response.statusCode == 400) {
      return OtherExceptions(AppStrings.kBadRequestError);
    } else if (response.statusCode == 401 || response.statusCode == 403) {
      return UnAuthorizedException();
    } else if (response.statusCode == 404 || response.statusCode == 502) {
      return OtherExceptions(AppStrings.kNotFoundError);
    } else if (response.statusCode == 500) {
      return InternalServerException();
    }

    // If none of the above conditions match, return a default exception
    return OtherExceptions(AppStrings.kDefaultError);
  }

  static ApiException _handleResponseError(http.Response response) {
    try {
      //  final Map<String, dynamic> responseData = jsonDecode(response.body);
      //   final errorResponse = ErrorResponse.fromJson(jsonDecode(response.body));

      final Map<String, dynamic> responseData = jsonDecode(response.body);

      // Check for the specific error message
      if (responseData.containsKey('message')) {
        final String errorMessage =
            responseData['message'] ?? 'Unknown error occurred';
        print("It contains message ----------------");
        print(errorMessage);

        return OtherExceptions(errorMessage);
      }
      // Check if there's any error list and extract the first error message
      if (responseData.containsKey('error')) {
        final List<dynamic> errors = responseData['error'];

        if (errors.isNotEmpty && errors.first is String) {
          return OtherExceptions(errors.first);
        }
      }
      // if (responseData.containsKey('message')) {
      //   final dynamic errorData = responseData['error'];
      //   print('---- data ----');
      //   print('---- errror2 $errorData ----');
      //   if (errorData is Map<String, dynamic> &&
      //       errorData.containsKey('message')) {
      //     print('---- errror ----');
      //     return OtherExceptions(errorData['error']);
      //   }
      // }
    } catch (e) {
      debugPrint('ENTERED CATCH BLOCK');
      debugPrint('Error parsing response: ${e.toString()}');
      // If there's an error parsing the JSON or the structure is not as expected, return a default exception
      // return OtherExceptions(AppStrings.kDefaultError);
      // final errorResponse = ErrorResponse.fromJson(jsonDecode(response.body));

      return OtherExceptions(AppStrings.kDefaultError);
    }

    // Handle status code-based exceptions
    if (response.statusCode == 400) {
      return OtherExceptions(AppStrings.kBadRequestError);
    } else if (response.statusCode == 401 || response.statusCode == 403) {
      return UnAuthorizedException();
    } else if (response.statusCode == 404 || response.statusCode == 502) {
      return OtherExceptions(AppStrings.kNotFoundError);
    } else if (response.statusCode == 500) {
      return InternalServerException();
    }

    // If none of the above conditions match, return a default exception
    return OtherExceptions(AppStrings.kDefaultError);
  }
}

class OtherExceptions implements ApiException {
  OtherExceptions(this.newMessage);

  final String newMessage;

  @override
  String toString() => message;

  @override
  String get message => newMessage;
}

class InternetConnectException implements ApiException {
  InternetConnectException(this.newMessage);

  final String newMessage;

  @override
  String toString() => message;

  @override
  String get message => newMessage;
}

class InternalServerException implements ApiException {
  @override
  String toString() => message;

  @override
  String get message => AppStrings.kServerError;
}

class UnAuthorizedException implements ApiException {
  @override
  String toString() => message;

  @override
  String get message => AppStrings.kUnAuthorizedError;
}
