part of 'task_bloc.dart';

class TaskState extends Equatable {
  const TaskState({
    this.pendingtasks = const <Task>[],
    this.completedtasks = const <Task>[],
    this.favoritetasks = const <Task>[],
    this.removedtask = const <Task>[],
  });
  final List<Task> pendingtasks;
  final List<Task> completedtasks;
  final List<Task> favoritetasks;
  final List<Task> removedtask;

  @override
  // TODO: implement props
  List<Object?> get props => [pendingtasks, removedtask,favoritetasks,completedtasks];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'completedtasks': pendingtasks.map((x) => x.toMap()).toList(),
      'pendingtasks': pendingtasks.map((x) => x.toMap()).toList(),
      'favoritetasks': pendingtasks.map((x) => x.toMap()).toList(),
      'removedtask': removedtask.map((x) => x.toMap()).toList(),
    };
  }

  factory TaskState.fromMap(Map<String, dynamic> map) {
    return TaskState(
      completedtasks: List<Task>.from(
        (map['completedtasks'] as List<int>).map<Task>(
          (x) => Task.fromMap(x as Map<String, dynamic>),
        ),
      ),
       favoritetasks: List<Task>.from(
        (map['favoritetasks'] as List<int>).map<Task>(
          (x) => Task.fromMap(x as Map<String, dynamic>),
        ),
      ),
       pendingtasks: List<Task>.from(
        (map['pendingtasks'] as List<int>).map<Task>(
          (x) => Task.fromMap(x as Map<String, dynamic>),
        ),
      ),
      removedtask: List<Task>.from(
        (map['removedtask'] as List<int>).map<Task>(
          (x) => Task.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }
}
