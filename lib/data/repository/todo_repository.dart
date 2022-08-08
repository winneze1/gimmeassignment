import 'package:amplify_flutter/amplify_flutter.dart';

import '../../models/Todo.dart';

class TodoRepository {
  Future<List<Todo>> getTodos(String userId) async {
    try {
      final todos = await Amplify.DataStore.query(
        Todo.classType,
        where: Todo.USERID.eq(userId),
      );
      return todos;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> createTodo(String title, String userId) async {
    final newTodo = Todo(
      title: title,
      isDone: false,
      userId: userId,
    );
    try {
      await Amplify.DataStore.save(newTodo);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateTodoIsComplete(Todo todo, bool isDone) async {
    final updatedTodo = todo.copyWith(isDone: isDone);
    try {
      await Amplify.DataStore.save(updatedTodo);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deleteTodo(Todo todo, String userId) async {
    try {
      await Amplify.DataStore.delete(
        todo,
        where: Todo.USERID.eq(userId),
      );
    } catch (e) {
      rethrow;
    }
  }

  Stream observeTodos() {
    return Amplify.DataStore.observe(Todo.classType);
  }
}
