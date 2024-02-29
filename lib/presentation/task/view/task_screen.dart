import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskmaster/config/resources/app_colors.dart';
import 'package:taskmaster/config/routes/router.dart';
import 'package:taskmaster/core/extensions.dart';
import 'package:taskmaster/presentation/task/bloc/task_bloc.dart';
import 'package:taskmaster/presentation/task/widgets/task_card.dart';

import '../../../config/resources/app_assets.dart';
import '../../../injection_container.dart';
import '../widgets/main_title_app_bar.dart';

@RoutePage()
class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var filterValue = context.l10n.all;
    return BlocProvider<TaskBloc>(
      create: (context) => sl()..add(const GetAllTasksEvent()),
      child: Scaffold(
        appBar: buildAppBar(context),
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: BlocBuilder<TaskBloc, TaskState>(
            builder: (context, state) {
              if (state is TaskDoneState) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    MainTitleAppBar(task: state.tasks),
                    Container(
                      width: 150,
                      height: 50,
                      margin: const EdgeInsets.only(right: 16),
                      decoration: BoxDecoration(
                        color: filterValue == context.l10n.all
                            ? Colors.white
                            : AppColors.primary.withOpacity(.2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: DropdownButton<String>(
                          value: filterValue,
                          items: <String>[
                            context.l10n.all,
                            context.l10n.completed
                          ].map((String item) {
                            return DropdownMenuItem<String>(
                              value: item,
                              child: Text(item),
                            );
                          }).toList(),
                          onChanged: (value) {
                            filterValue = value!;
                            if (value == context.l10n.completed) {
                              context
                                  .read<TaskBloc>()
                                  .add(const FilterTaskEvent());
                            } else {
                              context
                                  .read<TaskBloc>()
                                  .add(const GetAllTasksEvent());
                            }
                          },
                          borderRadius: BorderRadius.circular(10),
                          icon: const Icon(Icons.keyboard_arrow_down),
                          underline: const SizedBox(),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 500,
                      child: state.tasks != null && state.tasks!.isNotEmpty
                          ? ListView.builder(
                              itemCount: state.tasks?.length,
                              scrollDirection: Axis.vertical,
                              itemBuilder: (context, index) {
                                final task = state.tasks![index];
                                return TaskCard(
                                  onDismissed: (direction) =>
                                      BlocProvider.of<TaskBloc>(context)
                                          .add(RemoveTasksEvent(task.id!)),
                                  onTapStatus: () =>
                                      BlocProvider.of<TaskBloc>(context).add(
                                          UpdateTasksEvent(task.copyWith(
                                              isCompleted:
                                                  !task.isCompleted!))),
                                  onTapCard: () => context.router
                                      .push(TaskItemRoute(task: task)),
                                  task: task,
                                );
                              },
                            )
                          : Column(
                              children: [
                                Image.asset(
                                  AppAssets.iconTaskEmpty,
                                  width: 300,
                                  height: 300,
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  context.l10n.allTasksCompletedMessage,
                                  style: const TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                    ),
                  ],
                );
              }
              return Container();
            },
          ),
        ),
        floatingActionButton: Builder(
            builder: (context) => FloatingActionButton(
                  onPressed: () => context.router.push(TaskItemRoute()),
                  child: const Icon(Icons.add),
                )),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: IconButton(
            onPressed: () {
              context.router.push(const LoginRoute());
            },
            icon: const Icon(
              Icons.exit_to_app,
              size: 32,
            ),
          ),
        )
      ],
    );
  }
}
