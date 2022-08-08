import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gnassignment/ui/todos/widgets/todo_appbar.dart';

void main() {
  testWidgets('Loading view test', (tester) async {
    const toDoAppBar = TodoAppbar();
    await tester.pumpWidget(
        const MediaQuery(
            data: MediaQueryData(),
            child: MaterialApp(home: toDoAppBar)
        )
    );
    expect(find.byWidget(toDoAppBar), findsOneWidget);
  });
}
