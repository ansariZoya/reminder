
import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class Task extends Equatable {
  final String title;
   final String discription;
  final String id;
  bool? isDone;
  bool? isDeleted;
  Task({
    required this.title,
       required this.discription,
     required this.id,
    this.isDone,
    this.isDeleted,
  }){
    isDone = isDone ?? false;
 isDeleted = isDeleted ?? false;
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'discription': discription,
      'isDone': isDone,
      'isDeleted': isDeleted,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'] as String,
      title: map['title'] as String,
      discription: map['discription'] as String,
      isDone: map['isDone'] != null ? map['isDone'] as bool : null,
      isDeleted: map['isDeleted'] != null ? map['isDeleted'] as bool : null,
    );
  }
  
  @override
  
  List<Object?> get props => [id,title,isDone,isDeleted];

  Task copyWith({
    String?id,
    String? title,
    String? discription,
    bool? isDone,
    bool? isDeleted,
  }) {
    return Task(
      id: id ?? this.id,
      title: title ?? this.title,
      discription: discription ?? this.discription,
      isDone: isDone ?? this.isDone,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }
}
