import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reminder_app/src/presentation/Screens/tab-screens.dart';
import 'package:reminder_app/src/presentation/bloc/switchblock/switch_bloc.dart';


import 'package:reminder_app/src/presentation/bloc/taskbloc/task_bloc.dart';

class DrawerClass extends StatelessWidget {
  DrawerClass({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 14, horizontal: 20),
              color: Colors.grey,
              child: const Text(
                'TO Do Drawer',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.black),
              ),
            ),
            BlocBuilder<TaskBloc, TaskState>(
              builder: (context, state) {
                return GestureDetector(
                  onTap: () =>
                      Navigator.of(context).pushReplacementNamed(Tabscreen.id),
                  child: ListTile(
                    leading: Icon(Icons.folder_special),
                    title: Text("My Tasks"),
                    trailing: Text('${state.pendingtasks.length} |${state.completedtasks.length}' ),
                  ),
                );
              },
            ),
            const Divider(),
            BlocBuilder<TaskBloc, TaskState>(
              builder: (context, state) {
                return GestureDetector(
                  onTap: () =>
                      Navigator.of(context).pushReplacementNamed(Tabscreen.id),
                  child: ListTile(
                    leading: Icon(Icons.folder_special),
                    title: Text("Bin"),
                    trailing: Text('${state.pendingtasks.length} |${state.completedtasks.length}'),
                  ),
                );
              },
            ),
            BlocBuilder<SwitchBloc, SwitchState>(
              builder: (context, state) {
                return Switch(
                    value: state.switchValue,
                    onChanged: (newvalue) {
                      newvalue? context.read<SwitchBloc>().add(SwitchOnEvent())
                      :context.read<SwitchBloc>().add(SwitchOffEvent());
                    });
              },
            )
          ],
        ),
      ),
    );
  }
}
