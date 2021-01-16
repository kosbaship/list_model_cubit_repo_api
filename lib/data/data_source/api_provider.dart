import 'package:dio/dio.dart';
import 'package:list_model_cubit_repo_api/data/repository/repository.dart';

class ApiProvider implements Repository {
  Dio dio = Dio(
    BaseOptions(
      baseUrl: "https://jsonplaceholder.typicode.com/",
    ),
  );

  @override
  Future<Response> fetchData({String path}) async {
    return await dio.get(path);
  }
}
