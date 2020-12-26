import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:list_model_cubit_repo_api/data/models/post_model.dart';
import 'package:list_model_cubit_repo_api/data/repository/repository.dart';
import 'package:list_model_cubit_repo_api/layout/cubit/home_states.dart';

class HomeCubit extends Cubit<HomeStates> {
  Repository repository;
  HomeCubit(this.repository) : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);

  List cubitPosts = [];

  getPosts() {
    emit(HomeLoadingState());

    repository.fetchData(path: "posts").then((value) {
      cubitPosts =
          (value.data as List).map((json) => PostModel.fromJson(json)).toList();
      emit(HomeSuccessState());
    }).catchError((e) {
      print(e.toString());
      emit(HomeErrorState(e.toString()));
    });
  }
}
