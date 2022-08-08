import 'package:gnassignment/data/cubits/auth_cubit/auth_cubit.dart';
import 'package:gnassignment/data/cubits/auth_cubit/auth_state.dart';
import 'package:gnassignment/ui/auth/auth_view.dart';
import 'package:gnassignment/ui/common/loading_view.dart';
import 'package:gnassignment/data/cubits/todo_cubit/todo_cubit.dart';
import 'package:gnassignment/ui/todos/todos_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppNavigator extends StatelessWidget {
  const AppNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(builder: (context, state) {
      return Navigator(
        pages: [
          if (state is Unauthenticated) MaterialPage(child: AuthView()),
          if (state is Authenticated)
            MaterialPage(
              child: BlocProvider(
                create: (context) => TodoCubit(userId: state.userId)
                  ..getTodos()
                  ..observeTodo(),
                child: const TodosView(),
              ),
            ),
          if (state is UnknownAuthState) const MaterialPage(child: LoadingView())
        ],
        onPopPage: (route, result) => route.didPop(result),
      );
    });
  }
}
