import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:reminder_app/src/presentation/bloc/taskbloc/task_bloc.dart';
import 'package:reminder_app/src/data/models/task.dart';
import 'package:reminder_app/src/presentation/widget/task_list.dart';

class CompScreen extends StatelessWidget {
  static const id = 'task screen';
  const CompScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
        return 
           BlocBuilder<TaskBloc, TaskState>(
             builder: (context, state) {
              List<Task> taskList = state.completedtasks;
               return Column(
                       children: [
                         Chip(label: Text('${state.completedtasks.length} Tasks')),
                         TaskList(
                           taskList: taskList,
                         )
                       ],
                     );
             },
           );
        
}}