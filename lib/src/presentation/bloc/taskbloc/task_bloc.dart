

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:reminder_app/src/data/models/task.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends HydratedBloc<TaskEvent, TaskState> {
  TaskBloc() : super(TaskState()) {
    on<AddTasks>(_onAddTask);
    on<UpdateTasks>(_onUpdateTask);
    on<DeleteTasks>(_onDeleteTask);
    on<RemovedTask>(_onRemovedTask);
  }

  void _onAddTask (AddTasks event, Emitter<TaskState>emit){
    final state = this.state;
    emit(TaskState(
      pendingtasks: List.from(state.pendingtasks)..add(event.task),
      completedtasks: List.from(state.pendingtasks)..add(event.task),
      favoritetasks: List.from(state.pendingtasks)..add(event.task),
      removedtask: state.removedtask
    ));
  }
  void _onUpdateTask (UpdateTasks event, Emitter<TaskState>emit){
   final state = this.state;
   final task = event.task;
   
   List<Task> pendingtasks = state.pendingtasks;
   List<Task> completedtasks = state.completedtasks;
   task.isDone== false
   ? {pendingtasks = List.from(pendingtasks)..remove(task),
     completedtasks = List.from(completedtasks)..insert(0,task.copyWith(isDone: true))
    }
   : {completedtasks = List.from(pendingtasks)..remove(task),
     pendingtasks = List.from(completedtasks)..insert(0,task.copyWith(isDone: false))};

   emit(TaskState
   (pendingtasks: pendingtasks,
   removedtask: state.removedtask,
   completedtasks: state.completedtasks,
   favoritetasks: state.favoritetasks));

  }
  void _onDeleteTask (DeleteTasks event, Emitter<TaskState>emit){
    final state = this.state;
    emit(TaskState(
      pendingtasks: state.pendingtasks,
      completedtasks: state.completedtasks,
   favoritetasks: state.favoritetasks,
   removedtask: List.from(state.removedtask)..remove(event.task)
));
  }
  
  @override
  TaskState? fromJson(Map<String, dynamic> json) {
   return TaskState.fromMap(json);
  }
  
  @override
  Map<String, dynamic>? toJson(TaskState state) {
    return state.toMap();
  }

  void _onRemovedTask(RemovedTask event, Emitter<TaskState> emit) {
    final state = this.state;
    emit(TaskState(
    pendingtasks: List.from(state.pendingtasks)..remove(event.task),
    completedtasks: List.from(state.completedtasks)..remove(event.task),
    favoritetasks: List.from(state.favoritetasks)..remove(event.task),
    removedtask: List.from(state.removedtask)..add(event.task.copyWith(isDeleted: true))));
  }
}
