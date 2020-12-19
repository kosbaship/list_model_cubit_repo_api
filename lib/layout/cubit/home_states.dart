import 'package:list_model_cubit_repo_api/data/models/post_model.dart';

abstract class HomeStates {}

class HomeInitialState extends HomeStates {}

class HomeLoadingState extends HomeStates {}

class HomeSuccessState extends HomeStates {
  List<PostModel> listOfDate;
  HomeSuccessState(this.listOfDate);
}

class HomeErrorState extends HomeStates {
  final error;
  HomeErrorState(this.error);
}
