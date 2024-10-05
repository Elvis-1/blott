import 'dart:async';

import 'dart:io';

import 'package:flutter/foundation.dart';

import 'package:http/http.dart' as http;
import 'package:blott/src/config/network/config.dart';

import '../utils/exceptions.dart';
import '../utils/local/auth_local_source.dart';

class ApiClient {
  ApiClient({
    required this.authLocalSource,
  });

  final AuthLocalSource authLocalSource;

  static String baseUrl = AppConfig.baseUrl;

  Future<void> setAuthCookieAndToken(Map<String, String> headers) async {
    var token = ''; //await sl<AuthLocalSource>().retrieveAccessToken();
    if (token != null) {
      headers['Authorization'] = 'Bearer $token';
    }
  }

  Future<Map<String, String>> initializeHeaders() async {
    final token = '';
    // sl<AuthLocalSource>().retrieveAccessToken();
    print("Access token printed $token");
    final presetHeaders = {
      'Accept': '*/*',
      if (token != null) 'Authorization': 'Bearer $token',
    };
    return presetHeaders;
  }

  Future<http.Response> getData(
    String url, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? extraHeaders,
  }) async {
    print('got to api client');

    // Check for an internet connection before proceeding with the network request
    // bool hasConnection =
    //     await ConnectionStatusSingleton.getInstance().checkConnection();

    // if (!hasConnection) {
    //   // Handle the situation when there is no internet connection
    //   print('No internet connection. Cannot make the request.');
    //   navigatorKey.currentState!
    //       .push(MaterialPageRoute(builder: (context) => const NoInternet()));
    //   throw Exception('No Internet Connection');
    // }
    try {
      final headers = await initializeHeaders();
      await setAuthCookieAndToken(headers);

      if (kDebugMode) {
        print('URL: $url');
        print('HEADERS: $headers');
        print('DATA: $data');
      }

      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json'
        },
      );

      if (kDebugMode) {
        print('URI: ${url} STATUS CODE: ${response.statusCode}');
        print('RESPONSE: ${response.body}');
        print('Whats happening?');
      }

      // Check if the status code is valid
      if (!_validateStatus(response.statusCode)) {
        print('printing response ${response.body}');
        throw ApiException.getOtherException(response);
      }
      return response;
    } catch (e) {
      print(' ---- ${e}');
      //  return http.Response(e.toString(), 500);
      throw ApiException.getOtherException(e);
    }
  }

  // validate the status of a request
  bool _validateStatus(int status) {
    // return status == 200 || status == 201;

    return status > 199 && status < 299;
  }
}

extension ResponseExtension on http.Response {
  bool get isSuccess {
    final is200 = statusCode == HttpStatus.ok;
    final is201 = statusCode == HttpStatus.created;
    return is200 || is201;
  }
}
