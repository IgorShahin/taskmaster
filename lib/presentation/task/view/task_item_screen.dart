import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskmaster/config/routes/router.dart';
import 'package:taskmaster/core/extensions.dart';
import 'package:taskmaster/core/widgets/app_button.dart';
import 'package:taskmaster/presentation/task/bloc/task_bloc.dart';
import 'package:uuid/uuid.dart';

import '../../../core/widgets/enum/button_type_enum.dart';
import '../../../domain/entities/task.dart';
import '../../../injection_container.dart';
import '../widgets/title_app_bar.dart';

@RoutePage()
class TaskItemScreen extends StatefulWidget {
  final Task? task;

  const TaskItemScreen({super.key, this.task});

  @override
  State<TaskItemScreen> createState() => _TaskItemScreenState();
}

class _TaskItemScreenState extends State<TaskItemScreen> {
  late String title;
  late String subtitle;

  @override
  void initState() {
    super.initState();
    title = widget.task?.title ?? "";
    subtitle = widget.task?.subtitle ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TaskBloc>(
      create: (context) => sl()..add(const GetAllTasksEvent()),
      child: Scaffold(
        appBar: AppBar(),
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TitleAppBar(
                    title: widget.task == null
                        ? context.l10n.addNewTask
                        : context.l10n.updateTask),
                _buildMiddleTextFieldsANDTimeAndDateSelection(
                    context, context.textTheme),
              ],
            ),
          ),
        ),
      ),
    );
  }

  SizedBox _buildMiddleTextFieldsANDTimeAndDateSelection(
      BuildContext context, TextTheme textTheme) {
    return SizedBox(
      width: double.infinity,
      height: 535,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Text(context.l10n.description, style: textTheme.headline6),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: ListTile(
              title: TextFormField(
                initialValue: title,
                maxLines: 6,
                cursorHeight: 20,
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                ),
                onFieldSubmitted: (value) {
                  title = value;
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                onChanged: (value) {
                  title = value;
                },
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: ListTile(
              title: TextFormField(
                initialValue: subtitle,
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  prefixIcon:
                      const Icon(Icons.bookmark_border, color: Colors.grey),
                  border: InputBorder.none,
                  counter: Container(),
                  hintText: context.l10n.addTitle,
                ),
                onFieldSubmitted: (value) {
                  setState(() {
                    subtitle = value;
                  });
                },
                onChanged: (value) {
                  subtitle = value;
                },
              ),
            ),
          ),
          const Spacer(flex: 265),
          widget.task == null
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 98),
                  child: Builder(builder: (context) {
                    return AppButton(
                        title: context.l10n.addTask,
                        onPressed: () {
                          BlocProvider.of<TaskBloc>(context).add(
                            AddTasksEvent(
                              Task(
                                  title: title,
                                  subtitle: subtitle,
                                  createdAtDate: DateTime.now(),
                                  isCompleted: false,
                                  id: const Uuid().v1()),
                            ),
                          );
                          context.router.replace(const TaskRoute());
                        });
                  }),
                )
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Builder(builder: (context) {
                          return AppButton(
                              title: context.l10n.deleteTask,
                              buttonType: ButtonType.border,
                              icon: Icons.close,
                              onPressed: () {
                                BlocProvider.of<TaskBloc>(context).add(
                                  RemoveTasksEvent(
                                    widget.task!.id!,
                                  ),
                                );
                                context.router.replace(const TaskRoute());
                              });
                        }),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: Builder(builder: (context) {
                          return AppButton(
                              title: context.l10n.updateTask,
                              onPressed: () {
                                BlocProvider.of<TaskBloc>(context).add(
                                  UpdateTasksEvent(
                                    widget.task!.copyWith(
                                      title: title,
                                      subtitle: subtitle,
                                    ),
                                  ),
                                );
                                context.router.replace(const TaskRoute());
                              });
                        }),
                      ),
                    ],
                  ),
                ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
