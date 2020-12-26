import 'package:dio/dio.dart';
import 'package:list_model_cubit_repo_api/data/repository/repository.dart';

class ApiProvider implements Repository {
  @override
  Future<Response> fetchData({String path}) async {
    Dio dio = Dio();
    String url = "https://jsonplaceholder.typicode.com/";
    dio.options.baseUrl = url;
    return await dio.get(path);
  }
}
