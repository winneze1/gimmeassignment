import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gnassignment/data/cubits/auth_cubit/auth_cubit.dart';

class TodoAppbar extends StatelessWidget implements PreferredSizeWidget {
  const TodoAppbar({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => BlocProvider.of<AuthCubit>(context).signOut(),
          ),
        )
      ],
      title: const Text('MY TODOS'),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
