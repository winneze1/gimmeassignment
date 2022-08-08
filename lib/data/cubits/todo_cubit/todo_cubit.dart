import 'package:gnassignment/data/cubits/todo_cubit/todo_state.dart';
import 'package:gnassignment/data/repository/todo_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/Todo.dart';

class TodoCubit extends Cubit<TodoState> {
  final _todoRepo = TodoRepository();
  final String userId;

  TodoCubit({required this.userId}) : super(LoadingTodos());

  void getTodos() async {
    if (state is ListTodosSuccess == false) {
      emit(LoadingTodos());
    }

    try {
      print('test cai nhẹ' + userId);
      final todos = await _todoRepo.getTodos(userId);
      emit(ListTodosSuccess(todos: todos));
    } catch (e) {
      emit(ListTodosFailure(exception: Exception(e)));
    }
  }

  void observeTodo() {
    final todosStream = _todoRepo.observeTodos();
    todosStream.listen((_) => getTodos());
  }

  void createTodo(String title) async {
    await _todoRepo.createTodo(title, userId);
  }

  void deleteTodo(Todo todo) async {
    await _todoRepo.deleteTodo(todo, userId);
  }

  void updateTodoIsComplete(Todo todo, bool isComplete) async {
    await _todoRepo.updateTodoIsComplete(todo, isComplete);
  }
}
