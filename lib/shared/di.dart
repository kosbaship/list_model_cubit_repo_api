import 'package:get_it/get_it.dart';
import 'package:list_model_cubit_repo_api/data/data_source/api_provider.dart';
import 'package:list_model_cubit_repo_api/layout/cubit/home_cubit.dart';

GetIt di = GetIt.I..allowReassignment = true;
Future init() async {
  di.registerFactory<HomeCubit>(
    () => HomeCubit(di<ApiProvider>()),
  );

  di.registerLazySingleton<ApiProvider>(
    () => ApiProvider(),
  );
}
