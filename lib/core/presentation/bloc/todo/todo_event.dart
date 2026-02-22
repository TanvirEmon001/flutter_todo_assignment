
part of 'todo_bloc.dart';

@immutable
abstract class TodoEvent extends Equatable {
  const TodoEvent();

  @override
  List<Object?> get props => [];
}


class FetchTodaysTasksEvent extends TodoEvent {
  final DateTime date;

  const FetchTodaysTasksEvent({required this.date});

  @override
  List<Object> get props => [date];
}