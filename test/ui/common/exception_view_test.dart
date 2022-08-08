import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gnassignment/data/cubits/todo_cubit/todo_cubit.dart';
import 'package:gnassignment/data/cubits/todo_cubit/todo_state.dart';
import 'package:gnassignment/ui/common/exception_view.dart';
class MockTodoCubit extends MockCubit<TodoState> implements TodoCubit {}

class TodoStateFake extends Fake implements TodoState {}

void main() {
  testWidgets('Exception view test', (tester) async {
    ///Exception View
    final exceptionView = ExceptionView(
      exception: Exception('Something wrong'),
    );
    await tester.pumpWidget(
      Builder(
        builder: (context) {
          return MaterialApp(
            home: Material(
              child: exceptionView,
            ),
          );
        },
      ),
    );
    expect(find.byWidget(exceptionView), findsOneWidget);

  //   late MockTodoCubit dummyTodoCubit;
  //
  //   ///Exception Container
  //   const exceptionContainerKey = Key('exception_view_container');
  //   final exceptionContainerFinder = find.byKey(exceptionContainerKey);
  //   final exceptionContainer =
  //       tester.firstWidget<Container>(exceptionContainerFinder);
  //
  //   expect(
  //     exceptionContainer.decoration,
  //     const BoxDecoration(
  //       color: Colors.white,
  //     ),
  //   );
  });
}
