import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reminder_app/src/presentation/bloc/taskbloc/task_bloc.dart';
import 'package:reminder_app/src/data/models/task.dart';
import 'package:reminder_app/core/services/guid_gen.dart';



class AddScreen extends StatelessWidget {
   AddScreen({
    super.key,
    required this.titleController,
     required this.discriptionController,
  });

  final TextEditingController titleController;
   final TextEditingController discriptionController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(children: [
          Text('Add task',style: TextStyle(fontSize: 24)),
          SizedBox(height: 10,),
          TextField(
            scrollPadding: EdgeInsets.only(bottom: 50),
            autofocus: true,
            controller: titleController,
            decoration: const InputDecoration(
              label: Text('title'),
              border: OutlineInputBorder()
        
        
            ),
          ),
           Padding(
             padding: const EdgeInsets.only(top: 10,bottom: 10),
             child: TextField(
              scrollPadding: EdgeInsets.only(bottom: 50),
              autofocus: true,
              minLines: 3,
              maxLines: 6,
              controller: discriptionController,
              decoration: const InputDecoration(
                label: Text('discription'),
                border: OutlineInputBorder()
                     
                     
              ),
                       ),
           ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(onPressed:()=> Navigator.pop(context), child: Text("cancel") ,),
              ElevatedButton(onPressed: (){
            var task = Task(title: titleController.text, id: GUIDGen.generate(), 
            discription: discriptionController.text);
            context.read<TaskBloc>().add(AddTasks(task: task));
            Navigator.pop(context);
          },
           child: Text("Add"))
            ],
          ),
          
        
            
            
        ],),
      ),
    );
  }
}
