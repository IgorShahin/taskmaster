import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:taskmaster/data/datasources/authenticationl_datasoursce.dart';
import 'package:taskmaster/domain/repositories/user_repository.dart';
import 'package:taskmaster/domain/usecase/uc_clear_token.dart';
import 'package:taskmaster/domain/usecase/uc_get_user.dart';
import 'package:taskmaster/domain/usecase/uc_update_task.dart';
import 'package:taskmaster/presentation/home/bloc/home_bloc.dart';
import 'package:taskmaster/presentation/login/bloc/login_bloc.dart';
import 'package:taskmaster/presentation/task/bloc/task_bloc.dart';

import 'data/datasources/task_datasource.dart';
import 'data/model/task_model.dart';
import 'data/model/user_model.dart';
import 'data/repositories/task_repository_impl.dart';
import 'data/repositories/user_repository_impl.dart';
import 'domain/repositories/task_repository.dart';
import 'domain/usecase/uc_add_task.dart';
import 'domain/usecase/uc_add_user.dart';
import 'domain/usecase/uc_delete_task.dart';
import 'domain/usecase/uc_get_all_tasks.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  final taskBox = await Hive.openBox<TaskModel>('tasks');

  final userBox = await Hive.openBox<UserModel>('user');
  if (userBox.isEmpty) {
    userBox.add(UserModel());
  }

  // Dependencies
  sl.registerSingleton<TaskDataSource>(TaskDataSource(taskBox));

  sl.registerSingleton<AuthenticationDataSource>(
      AuthenticationDataSource(userBox));

  sl.registerSingleton<TaskRepository>(TaskRepositoryImpl(sl()));

  sl.registerSingleton<UserRepository>(UserRepositoryImpl(sl()));

  // UseCases
  sl.registerSingleton<UcAddTask>(UcAddTask(sl()));

  sl.registerSingleton<UcAddToken>(UcAddToken(sl()));

  sl.registerSingleton<UcDeleteTask>(UcDeleteTask(sl()));

  sl.registerSingleton<UcClearToken>(UcClearToken(sl()));

  sl.registerSingleton<UcGetAllTask>(UcGetAllTask(sl()));

  sl.registerSingleton<UcGetUser>(UcGetUser(sl()));

  sl.registerSingleton<UcUpdateTask>(UcUpdateTask(sl()));

  // Blocks
  sl.registerFactory<TaskBloc>(() => TaskBloc(
        sl(),
        sl(),
        sl(),
        sl(),
        sl(),
        sl(),
      ));

  sl.registerFactory<LoginBloc>(() => LoginBloc(sl(), sl()));

  sl.registerFactory<HomeBloc>(() => HomeBloc(sl()));
}
