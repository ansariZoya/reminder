part of 'task_bloc.dart';

abstract class TaskEvent extends Equatable {
  const TaskEvent();

  @override
  List<Object> get props => [];
}

class AddTasks extends TaskEvent{
  final Task task;
 const AddTasks( {
    required this.task
  });
   @override
  List<Object> get props => [task];
}
class UpdateTasks extends TaskEvent{
  final Task task;
 const UpdateTasks({
    required this.task
  });
   @override
  List<Object> get props => [task];
}

class DeleteTasks extends TaskEvent{
  final Task task;
 const DeleteTasks({
    required this.task
  });
   @override
  List<Object> get props => [task];
}
class RemovedTask extends TaskEvent{
  final Task task;
 const RemovedTask({
    required this.task
  });
   @override
  List<Object> get props => [task];
}