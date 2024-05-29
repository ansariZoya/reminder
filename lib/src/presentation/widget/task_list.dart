

import 'package:flutter/material.dart';


import 'package:reminder_app/src/data/models/task.dart';
import 'package:reminder_app/src/presentation/widget/list_tile.dart';

class TaskList extends StatelessWidget {
  const TaskList({
    super.key,
    required this.taskList,
    
  });

  final List<Task> taskList;

  
  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList.radio(
      children: 
      taskList.map((task)=> ExpansionPanelRadio(
        value: task.id, 
        headerBuilder: (context,idOpen)=> ListTilewidget(task: task),
         body: Text("description"))).toList(),
    );
  }
}
// Expanded(
//       child: ListView.builder(
//         itemCount: taskList.length,
//         itemBuilder: (context,index){
//           var task = taskList[index];
//           return ListTilewidget(task: task);
//         }),
//     );
