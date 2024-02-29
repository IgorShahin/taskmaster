// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeScreen(),
      );
    },
    LoginRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LoginScreen(),
      );
    },
    TaskItemRoute.name: (routeData) {
      final args = routeData.argsAs<TaskItemRouteArgs>(
          orElse: () => const TaskItemRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: TaskItemScreen(
          key: args.key,
          task: args.task,
        ),
      );
    },
    TaskRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const TaskScreen(),
      );
    },
  };
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LoginScreen]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [TaskItemScreen]
class TaskItemRoute extends PageRouteInfo<TaskItemRouteArgs> {
  TaskItemRoute({
    Key? key,
    Task? task,
    List<PageRouteInfo>? children,
  }) : super(
          TaskItemRoute.name,
          args: TaskItemRouteArgs(
            key: key,
            task: task,
          ),
          initialChildren: children,
        );

  static const String name = 'TaskItemRoute';

  static const PageInfo<TaskItemRouteArgs> page =
      PageInfo<TaskItemRouteArgs>(name);
}

class TaskItemRouteArgs {
  const TaskItemRouteArgs({
    this.key,
    this.task,
  });

  final Key? key;

  final Task? task;

  @override
  String toString() {
    return 'TaskItemRouteArgs{key: $key, task: $task}';
  }
}

/// generated route for
/// [TaskScreen]
class TaskRoute extends PageRouteInfo<void> {
  const TaskRoute({List<PageRouteInfo>? children})
      : super(
          TaskRoute.name,
          initialChildren: children,
        );

  static const String name = 'TaskRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
