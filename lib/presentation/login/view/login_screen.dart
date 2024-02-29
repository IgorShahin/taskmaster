import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskmaster/config/resources/app_assets.dart';
import 'package:taskmaster/core/extensions.dart';
import 'package:taskmaster/presentation/login/bloc/login_bloc.dart';

import '../../../config/resources/app_colors.dart';
import '../../../core/widgets/app_button.dart';
import '../../../injection_container.dart';
import '../widgets/app_text_field.dart';

@RoutePage()
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => sl<LoginBloc>(),
        child: const _LoginScreenWidget(),
      ),
    );
  }
}

class _LoginScreenWidget extends StatefulWidget {
  const _LoginScreenWidget();

  @override
  State<_LoginScreenWidget> createState() => _LoginScreenWidgetState();
}

class _LoginScreenWidgetState extends State<_LoginScreenWidget> {
  late final FocusNode _emailFocusNode;
  late final FocusNode _passwordFocusNode;

  @override
  void initState() {
    super.initState();
    _emailFocusNode = FocusNode();
    _passwordFocusNode = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primary.withOpacity(.7),
      child: SafeArea(
        child: Column(
          children: [
            const Spacer(flex: 213),
            Center(
              child: Text(
                context.l10n.titleAuthentication,
                style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 30,
                    color: AppColors.lightWhite100),
              ),
            ),
            const SizedBox(height: 81),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 98),
              child: Column(
                children: [
                  AppTextField(
                    hint: context.l10n.hintLogin,
                    icon: AppAssets.iconPerson,
                    focusNode: _emailFocusNode,
                    onChanged: (text) =>
                        context.read<LoginBloc>().add(LoginEmailChanged(text)),
                    onSubmitted: (_) => _passwordFocusNode.requestFocus(),
                  ),
                  const SizedBox(height: 16),
                  AppTextField(
                    hint: context.l10n.textPassword,
                    icon: AppAssets.iconPassword,
                    focusNode: _passwordFocusNode,
                    onChanged: (text) => context
                        .read<LoginBloc>()
                        .add(LoginPasswordChanged(text)),
                    onSubmitted: (_) => context
                        .read<LoginBloc>()
                        .add(const LoginLoginButtonClicked()),
                  ),
                  const SizedBox(height: 40),
                  AppButton(
                      title: context.l10n.loginButtonText, onPressed: () {})
                ],
              ),
            ),
            const Spacer(flex: 265),
            const SizedBox(height: 26),
          ],
        ),
      ),
    );
  }
}
