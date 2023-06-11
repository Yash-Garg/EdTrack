import 'package:edtrack/utils/keys.dart';
import 'package:edtrack/main.dart' as app;
import 'package:edtrack/ui/common/wide_fab.dart';
import 'package:edtrack/ui/home/widgets/header.dart';
import 'package:edtrack/ui/login/login_page.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  binding.framePolicy = LiveTestWidgetsFlutterBindingFramePolicy.fullyLive;

  group('Login Test', () {
    const username = String.fromEnvironment('EDTRACK_USERNAME');
    const password = String.fromEnvironment('EDTRACK_PASSWORD');

    testWidgets(
      'login using credentials defined in env',
      (WidgetTester tester) async {
        // Start the main application
        await app.main();
        await tester.pumpAndSettle(Duration(seconds: 3));

        if (find.byType(LoginPage).evaluate().isNotEmpty) {
          final Finder loginField = find.byKey(WidgetKeys.loginField);
          await tester.tap(loginField);
          await tester.pumpAndSettle();

          await tester.enterText(loginField, username);
          await tester.testTextInput.receiveAction(TextInputAction.done);

          final Finder passwordField = find.byKey(WidgetKeys.passwordField);
          await tester.tap(passwordField);
          await tester.pumpAndSettle();

          await tester.enterText(loginField, password);
          await tester.testTextInput.receiveAction(TextInputAction.done);

          final Finder loginBtn = find.byType(WideFab);
          await tester.tap(loginBtn);
          await tester.pumpAndSettle(Duration(seconds: 3));
          expect(find.byType(Header), findsOneWidget);
        }
      },
    );
  });
}
