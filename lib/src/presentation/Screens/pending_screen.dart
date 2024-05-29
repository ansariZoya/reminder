import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:reminder_app/src/presentation/bloc/taskbloc/task_bloc.dart';
import 'package:reminder_app/src/data/models/task.dart';
import 'package:reminder_app/src/presentation/widget/task_list.dart';

class PendingScreen extends StatelessWidget {
  static const id = 'task screen';
  const PendingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
        return 
           BlocBuilder<TaskBloc, TaskState>(
             builder: (context, state) {
              List<Task> taskList = state.pendingtasks;
               return Column(
                       children: [
                         Chip(label: Text('${state.pendingtasks.length} pending |${state.completedtasks.length}')),
                         TaskList(
                           taskList: taskList,
                         )
                       ],
                     );
             },
           );
        
}}