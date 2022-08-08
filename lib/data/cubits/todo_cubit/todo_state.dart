import 'package:equatable/equatable.dart';
import 'package:gnassignment/models/Todo.dart';

abstract class TodoState extends Equatable {}

class LoadingTodos extends TodoState {
  @override
  List<Object?> get props => [];
}

class ListTodosSuccess extends TodoState {
  final List<Todo> todos;

  ListTodosSuccess({required this.todos});

  @override
  List<Object?> get props => [todos];
}

class ListTodosFailure extends TodoState {
  final Exception exception;

  ListTodosFailure({required this.exception});

  @override
  // TODO: implement props
  List<Object?> get props => [exception];
}