import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

import '../utils/log_utils.dart';
import 'api_response.dart';
import 'api_urls.dart';
import 'app_exceptions.dart';

@Injectable()
class ApiBaseHelper {
  Future<ApiResponse<T>> getData<T>(String url) async {
    var responseJson;
    try {
      final response = await http.get(Uri.parse(ApiPaths.BASE_URL+url)).timeout(
        const Duration(seconds: 15),
        onTimeout: () {
          Log.e("Time Out Exception");
          return http.Response('Error', 408); // Request Timeout response status code
        },
      );

      Log.w("path:  "+ApiPaths.BASE_URL+url.toString());
      responseJson = _returnResponse<T>(response);
    } on TimeoutException {
      Log.e("Time Out Exception");
    } on SocketException {
      return ApiResponse.error(FetchDataException('No Internet connection'));
    }
    return responseJson;
  }

  ApiResponse<T> _returnResponse<T>(http.Response response) {
    switch (response.statusCode) {
      case 200:
        final jsonData = json.decode(response.body);

        final apiResponse = ApiResponse<T>.completed(jsonData);
        Log.json(response.body);
        return apiResponse;
      case 400:
        // throw BadRequestException(response.body.toString());
        Log.e(response.body.toString());
        return ApiResponse<T>.error(
            BadRequestException(response.body.toString()));
      case 401:
      case 403:
        // throw UnauthorisedException(response.body.toString());
        return ApiResponse<T>.error(
            UnauthorisedException(response.body.toString()));
      case 500:
      default:
        // throw FetchDataException(
        //     'Error occurred while Communication with Server with StatusCode : ${response.statusCode}');
        return ApiResponse<T>.error(FetchDataException(
            'Error occurred while Communication with Server with StatusCode : ${response.statusCode}'));
    }
  }
}
