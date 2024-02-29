import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskmaster/config/routes/router.dart';
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
    return BlocProvider<TaskBloc>(
      create: (context) => sl()..add(const GetAllTasksEvent()),
      child: Scaffold(
        appBar: buildAppBar(context),
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              const MainTitleAppBar(),
              SizedBox(
                width: double.infinity,
                height: 545,
                child: BlocBuilder<TaskBloc, TaskState>(
                  builder: (context, state) {
                    if (state is TaskDoneState) {
                      return state.tasks!.isNotEmpty
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
                                const Text(
                                  "You Have Done All Tasks!",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            );
                    }
                    return Container();
                  },
                ),
              )
            ],
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
