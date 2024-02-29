import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskmaster/presentation/login/bloc/login_bloc.dart';

import '../../../config/routes/router.dart';
import '../../../injection_container.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginBloc>(
      create: (context) => sl()..add(const GetTokenEvent()),
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return AutoTabsRouter(
            routes: [
              if (state.user == null) ...{
                const TaskRoute(),
                const LoginRoute(),
              } else ...{
                const LoginRoute(),
                const TaskRoute(),
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
