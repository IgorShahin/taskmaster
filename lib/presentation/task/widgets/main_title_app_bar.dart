import 'package:flutter/material.dart';
import 'package:taskmaster/core/extensions.dart';

import '../../../config/resources/app_colors.dart';
import '../../../domain/entities/task.dart';

class MainTitleAppBar extends StatelessWidget {
  const MainTitleAppBar({
    super.key,
    this.task,
  });

  final List<Task>? task;

  @override
  Widget build(BuildContext context) {
    final completed = task != null && task!.isNotEmpty
        ? task!.where((task) => task.isCompleted == true).toList().length
        : 0;
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 30),
          width: double.infinity,
          height: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  width: 30,
                  height: 30,
                  child: CircularProgressIndicator(
                    value: task!.isNotEmpty ? completed / task!.length : 0,
                    backgroundColor: Colors.grey,
                    valueColor: const AlwaysStoppedAnimation(AppColors.primary),
                  )),
              const SizedBox(width: 25),
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
                    context.l10n.infoCompleted(completed, task!.length),
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
