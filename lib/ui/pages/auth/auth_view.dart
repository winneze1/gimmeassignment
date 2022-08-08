import 'package:gnassignment/data/cubits/auth_cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'WELCOME TO GIMME NOW ASSIGNMENT',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.redAccent,
                fontSize: 20,
              ),
            ),
            ElevatedButton(
              child: const Text('SIGN IN'),
              onPressed: () => BlocProvider.of<AuthCubit>(context).signIn(),
            ),
          ],
        ),
      ),
    );
  }
}
