import 'package:dio/dio.dart';

import 'info_model.dart';

abstract class Repository {
  Future<List<InfoModel>> fetchData({int page = 0});
}

class DioRepository extends Repository {
  final Dio _dio = Dio();

  DioRepository();

  Future<List<InfoModel>> fetchData({int page = 0}) async {
    final response = await _dio.get(
        'https://www.intoxianime.com/?rest_route=/wp/v2/posts&page=$page&per_page=20');

    final result = (response.data as List)
        .map((info) => InfoModel.fromJson(info))
        .toList();

    return result;
  }
}
