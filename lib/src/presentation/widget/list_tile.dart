
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reminder_app/src/presentation/bloc/taskbloc/task_bloc.dart';
import 'package:reminder_app/src/data/models/task.dart';

class ListTilewidget extends StatelessWidget {
  const ListTilewidget({
    super.key,
    required this.task,
  });

  final Task task;
  void _removeorDeleteTask(BuildContext context,Task task){
    task.isDeleted! 
    ?context.read<TaskBloc>().add(DeleteTasks(task: task))
    :context.read<TaskBloc>().add(RemovedTask(task: task));
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        Expanded(
          child: Row(
            children: [
              Icon(Icons.star),
              SizedBox(width: 10,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(task.title,style:TextStyle(decoration: 
                              task.isDone! ? TextDecoration.lineThrough
                              : null,
                            )),
                            Text(DateTime.now().toString())
                  ],
                ),
              ),
            ],
          ),
        ),
         
        Checkbox(value: task.isDone,
        onChanged: task.isDeleted ==false ?(value){
          context.read<TaskBloc>().add(UpdateTasks(task: task));
        }:null),
       
      
      ],),
    );
  }
}