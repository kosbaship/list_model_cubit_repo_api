import 'package:list_model_cubit_repo_api/data/models/post_model.dart';

abstract class Repository {
  Future<List<PostModel>> fetchData();
}
