import 'package:dio/dio.dart';
import 'package:list_model_cubit_repo_api/data/models/post_model.dart';

class ApiProvider {
  var posts = List<PostModel>();

  Future<List<PostModel>> fetchData() async {
    try {
      Dio dio = Dio();
      String url = "https://jsonplaceholder.typicode.com/";
      dio.options.baseUrl = url;
      await dio.get("posts").then((response) {
        posts = (response.data as List)
            .map((json) => PostModel.fromJson(json))
            .toList();
      });
    } catch (e) {
      print(e);
    }
    return posts;
  }
}
