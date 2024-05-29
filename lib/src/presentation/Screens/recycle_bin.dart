import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reminder_app/src/presentation/bloc/taskbloc/task_bloc.dart';
import 'package:reminder_app/src/presentation/widget/task_list.dart';

class RecycleBin extends StatefulWidget {
  static const id = 'recycle bin';
  const RecycleBin({super.key});

  @override
  State<RecycleBin> createState() => _RecycleBinState();
}

class _RecycleBinState extends State<RecycleBin> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            actions: [IconButton(onPressed: () {}, icon: (Icon(Icons.add)))],
          ),
          drawer: const Drawer(),
          body:  Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Chip(label: Text('${state.removedtask.length}Tasks')),
              TaskList(
                taskList: state.removedtask,
              )
            ],
          ),
        );
      },
    );
  }
}
