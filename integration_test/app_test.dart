import 'package:edtrack/keys.dart';
import 'package:edtrack/main.dart' as app;
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  const username = String.fromEnvironment('EDTRACK_USERNAME');
  const password = String.fromEnvironment('EDTRACK_PASSWORD');

  group('Login Test', () {
    testWidgets(
      'login using credentials defined in env',
      (tester) async {
        // Start the main application
        app.main();
        await tester.pumpAndSettle();

        final Finder loginField = find.byKey(WidgetKeys.loginField);
        await tester.tap(loginField);

        await tester.enterText(loginField, username);
        await tester.testTextInput.receiveAction(TextInputAction.done);

        final Finder passwordField = find.byKey(WidgetKeys.passwordField);
        await tester.tap(passwordField);

        await tester.enterText(loginField, password);
        await tester.testTextInput.receiveAction(TextInputAction.done);
      },
    );
  });
}
