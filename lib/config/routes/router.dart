import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';

import '../../domain/entities/task.dart';
import '../../presentation/home/view/home_screen.dart';
import '../../presentation/login/view/login_screen.dart';
import '../../presentation/task/view/task_item_screen.dart';
import '../../presentation/task/view/task_screen.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: HomeRoute.page, initial: true, children: [
          AutoRoute(page: LoginRoute.page),
          AutoRoute(page: TaskRoute.page),
        ]),
        AutoRoute(page: TaskItemRoute.page),
      ];
}
