import 'package:flutter_test/flutter_test.dart';
import 'package:gnassignment/ui/common/loading_view.dart';

void main() {
  testWidgets('Loading view test', (tester) async {
    const loading = LoadingView();
    await tester.pumpWidget(loading);
    expect(find.byWidget(loading), findsOneWidget);
  });
}
