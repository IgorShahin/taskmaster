import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskmaster/presentation/home/bloc/home_bloc.dart';

import '../../../config/routes/router.dart';
import '../../../injection_container.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (context) => sl()..add(const GetTokenEvent()),
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return AutoTabsRouter(
            routes: [
              if (state is SuccessfulLoginState) ...{
                const TaskRoute(),
              } else ...{
                const LoginRoute(),
              }
            ],
            builder: (context, child) {
              return Scaffold(
                body: child,
              );
            },
          );
        },
      ),
    );
  }
}
