import 'package:flutter/material.dart';

class ExceptionView extends StatelessWidget {
  const ExceptionView({
    Key? key,
    required this.exception,
  }) : super(key: key);

  final Exception exception;

  @override
  Widget build(BuildContext context) {
    return Container(
      key: const Key('exception_view_container'),
      color: Colors.white,
      child: Center(
        child: Text(
          exception.toString(),
          textDirection: TextDirection.ltr,
        ),
      ),
    );
  }
}
