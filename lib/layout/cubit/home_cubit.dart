import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:list_model_cubit_repo_api/data/data_source/api_provider.dart';
import 'package:list_model_cubit_repo_api/data/models/post_model.dart';
import 'package:list_model_cubit_repo_api/data/repository/repository.dart';
import 'package:list_model_cubit_repo_api/layout/cubit/home_states.dart';

class HomeCubit extends Cubit<HomeStates> {
  Repository repository;
  HomeCubit(this.repository) : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);

  var cubitPosts = List<PostModel>();
  ApiProvider dataSource = ApiProvider();

  fetchData() async {
    if (cubitPosts.length == 0) {
      // change to loading
      print("=================  emit Loading State");
      emit(HomeLoadingState());

      // fetch the data from the API Direct
      await repository.fetchData().then((value) {
        cubitPosts.addAll(value);
        print("=================   emit Success state");
        emit(HomeSuccessState(cubitPosts));
        // cubitPosts = value;
      }).catchError((onError) {
        // handel error
        emit(HomeErrorState(onError));
      });
    }
  }
}
