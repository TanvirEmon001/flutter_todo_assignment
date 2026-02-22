import '../../../../core/network/network_caller.dart';
import '../../../../core/network/network_response.dart';
import '../models/todo_model.dart';

class TodoRepository {
  final NetworkCaller networkCaller;

  TodoRepository({required this.networkCaller});

  Future<List<TodoModel>> fetchTodos() async {
    const String url = 'https://dummyjson.com/todos';

    final NetworkResponse response = await networkCaller.getRequest(url: url);

    if (response.isSuccess) {

      if (response.responseData is Map && response.responseData['todos'] != null) {
        List<dynamic> todoList = response.responseData['todos'];
        return todoList.map((json) => TodoModel.fromJson(json)).toList();
      } else if (response.responseData is List) {
        List<dynamic> todoList = response.responseData;
        return todoList.map((json) => TodoModel.fromJson(json)).toList();
      } else {
        throw Exception('Unexpected response format');
      }
    } else {
      throw Exception(response.errorMessage ?? 'Failed to fetch todos');
    }
  }


  Future<TodoModel> createTodo(Map<String, dynamic> todoData) async {
    const String url = 'https://dummyjson.com/todos/add';

    final NetworkResponse response = await networkCaller.postRequest(
      url: url,
      body: todoData,
    );

    if (response.isSuccess) {
      return TodoModel.fromJson(response.responseData);
    } else {
      throw Exception(response.errorMessage ?? 'Failed to create todo');
    }
  }
}