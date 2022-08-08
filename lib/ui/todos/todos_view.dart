import 'package:gnassignment/data/cubits/auth_cubit/auth_cubit.dart';
import 'package:gnassignment/data/cubits/todo_cubit/todo_state.dart';
import 'package:gnassignment/ui/common/exception_view.dart';
import 'package:gnassignment/ui/common/loading_view.dart';
import 'package:gnassignment/data/cubits/todo_cubit/todo_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gnassignment/ui/todos/widgets/todo_appbar.dart';
import 'package:gnassignment/ui/util/constants.dart';

import '../../models/Todo.dart';

class TodosView extends StatefulWidget {
  const TodosView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TodosViewState();
}

class _TodosViewState extends State<TodosView> {
  final _titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TodoAppbar(),
      floatingActionButton: _floatingActionButton(),
      body: BlocBuilder<TodoCubit, TodoState>(builder: (context, state) {
        if (state is ListTodosSuccess) {
          return state.todos.isEmpty
              ? _emptyTodosView()
              : _todosListView(state.todos);
        } else if (state is ListTodosFailure) {
          return ExceptionView(
            exception: state.exception,
          );
        } else {
          return const LoadingView();
        }
      }),
    );
  }

  Widget _newTodoView() {
    return Padding(
      padding: const EdgeInsets.all(Constants.p3),
      child: Column(
        children: [
          const Text('Enter todo', style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),),
          const SizedBox(
            height: Constants.p2,
          ),
          TextField(
            controller: _titleController,
            decoration: const InputDecoration(hintText: 'Do homework'),
          ),
          const SizedBox(
            height: Constants.p3,
          ),
          ElevatedButton(
            onPressed: () {
              BlocProvider.of<TodoCubit>(context)
                  .createTodo(_titleController.text);
              _titleController.text = '';
              Navigator.of(context).pop();
            },
            child: const Text('Save Todo'),
          )
        ],
      ),
    );
  }

  Widget _floatingActionButton() {
    return FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
              context: context, builder: (context) => _newTodoView());
        });
  }

  Widget _emptyTodosView() {
    return const Center(
      child: Text('No todos yet'),
    );
  }

  Widget _todosListView(List<Todo> todos) {
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, index) {
        final todo = todos[index];
        return Dismissible(
          key: Key('${todo.id}$index'),
          onDismissed: (direction) {
            BlocProvider.of<TodoCubit>(context).deleteTodo(todo);
          },
          child: Card(
            child: CheckboxListTile(
                title: Text(todo.title),
                value: todo.isDone,
                onChanged: (newValue) {
                  BlocProvider.of<TodoCubit>(context)
                      .updateTodoIsComplete(todo, newValue!);
                }),
          ),
        );
      },
    );
  }
}
