import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:list_api/api/api_response.dart';

import 'package:list_api/repository/repository_interface.dart';

import '../api/api_base_helper.dart';

import '../api/api_urls.dart';

import '../dependencies/dependency_init.dart';

@Singleton()
class RepositoryImpl implements RepositoryInterface {
  final ApiBaseHelper _apiBaseHelper = getIt<ApiBaseHelper>();

  @override
  Future<ApiResponse> getUsers() async {

    return await _apiBaseHelper.getData(ApiPaths.USERS_URL);


  }
}
