import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../features/todo/data/models/todo_model.dart';
import '../../../../features/todo/data/repositories/todo_repository.dart';


part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final TodoRepository todoRepository;

  TodoBloc({required this.todoRepository}) : super(TodoInitial()) {
    on<FetchTodaysTasksEvent>(_onFetchTodaysTasks);
  }

  Future<void> _onFetchTodaysTasks(
      FetchTodaysTasksEvent event,
      Emitter<TodoState> emit,
      ) async {
    emit(TodoLoading());

    try {
      final todos = await todoRepository.fetchTodos();


      emit(TodosLoaded(todos: todos));
    } catch (e) {
      emit(TodoError(message: e.toString()));
    }
  }
}