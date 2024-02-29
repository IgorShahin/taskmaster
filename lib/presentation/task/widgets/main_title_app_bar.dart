import 'package:flutter/material.dart';
import 'package:taskmaster/core/extensions.dart';

import '../../../config/resources/app_colors.dart';

class MainTitleAppBar extends StatelessWidget {
  const MainTitleAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 30),
          width: double.infinity,
          height: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Progress indicator
              const SizedBox(
                  width: 30,
                  height: 30,
                  child: CircularProgressIndicator(
                    value: 1 / 3,
                    backgroundColor: Colors.grey,
                    valueColor: AlwaysStoppedAnimation(AppColors.primary),
                  )),
              const SizedBox(width: 25),

              // Top lvl Task Info
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    context.l10n.titleTasks,
                    style: context.textTheme.displayLarge,
                  ),
                  const SizedBox(height: 3),
                  Text(
                    "1 of 3 task",
                    style: context.textTheme.titleMedium,
                  )
                ],
              ),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 10),
          child: Divider(
            thickness: 2,
            indent: 100,
          ),
        ),
      ],
    );
  }
}
