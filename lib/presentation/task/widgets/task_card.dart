import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:taskmaster/core/extensions.dart';

import '../../../config/resources/app_colors.dart';
import '../../../domain/entities/task.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({
    super.key,
    required this.task,
    required this.onTapCard,
    required this.onTapStatus,
    required this.onDismissed,
  });

  final VoidCallback? onTapCard;
  final VoidCallback? onTapStatus;
  final DismissDirectionCallback? onDismissed;
  final Task? task;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      direction: DismissDirection.horizontal,
      key: UniqueKey(),
      onDismissed: onDismissed,
      background: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.delete_outline,
            color: Colors.grey,
          ),
          const SizedBox(width: 8),
          Text(
            context.l10n.taskDeleted,
            style: const TextStyle(color: Colors.grey),
          )
        ],
      ),
      child: GestureDetector(
        onTap: onTapCard,
        child: AnimatedContainer(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
              color: task!.isCompleted!
                  ? AppColors.primary.withOpacity(0.3)
                  : Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(.1),
                  offset: const Offset(0, 4),
                  blurRadius: 10,
                )
              ]),
          duration: const Duration(microseconds: 600),
          child: ListTile(
            // Check Icon
            leading: GestureDetector(
              onTap: onTapStatus,
              child: AnimatedContainer(
                duration: const Duration(microseconds: 600),
                decoration: BoxDecoration(
                  color: task!.isCompleted! ? AppColors.primary : Colors.white,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.grey, width: .8),
                ),
                child: const Icon(
                  Icons.check,
                  color: Colors.white,
                ),
              ),
            ),
            title: Padding(
              padding: const EdgeInsets.only(bottom: 5, top: 3),
              child: Text(
                task!.title!,
                style: TextStyle(
                  color: task!.isCompleted! ? AppColors.primary : Colors.black,
                  fontWeight: FontWeight.w500,
                  decoration:
                      task!.isCompleted! ? TextDecoration.lineThrough : null,
                ),
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  task!.subtitle!,
                  style: TextStyle(
                    color:
                        task!.isCompleted! ? AppColors.primary : Colors.black,
                    fontWeight: FontWeight.w300,
                    decoration:
                        task!.isCompleted! ? TextDecoration.lineThrough : null,
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10, top: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          DateFormat.yMMMEd().format(task!.createdAtDate!),
                          style: TextStyle(
                            fontSize: 14,
                            color:
                                task!.isCompleted! ? Colors.white : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
