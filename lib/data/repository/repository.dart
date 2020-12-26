import 'package:dio/dio.dart';

abstract class Repository {
  Future<Response> fetchData({String path});
}
