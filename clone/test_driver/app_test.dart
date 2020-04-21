import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('LoginPage', () {
    final buttonEnter = find.text('Entrar');

    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('Login success', () async {
      var emailTextField = find.byValueKey("Email, CPF ou cód. do revendedor");
      await driver.tap(emailTextField);
      await driver.enterText("moises");
      var passwordTextField = find.byValueKey("Senha");
      await driver.tap(passwordTextField);
      await driver.enterText("123");
      await driver.tap(buttonEnter);
      await driver.waitFor(find.text("Incentivos"));
    });
  });
}
