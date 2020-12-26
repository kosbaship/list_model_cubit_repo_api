import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:list_model_cubit_repo_api/data/repository/repository.dart';
import 'package:list_model_cubit_repo_api/layout/cubit/home_states.dart';

class HomeCubit extends Cubit<HomeStates> {
  Repository repository;
  HomeCubit(this.repository) : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);

  List cubitPosts = [];

  getPosts() {
    print("=================  State now is loading");
    emit(HomeLoadingState());

    repository.fetchData(path: "posts").then((value) {
      print("=================  State now is Success");
      emit(HomeSuccessState());
      cubitPosts = value.data;
    }).catchError((e) {
      print(e.toString());
      emit(HomeErrorState(e.toString()));
    });
  }
}
