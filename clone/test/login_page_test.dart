import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rebot/home/home_page.dart';
import 'package:rebot/login/page/login_page.dart';
import 'package:rebot/login/state/login.dart';

import 'helper/wrapper_app.dart';

class MockLoginBloc extends MockBloc<LoginEvent, LoginState>
    implements LoginBloc {}

void main() {
  LoginBloc loginBloc;

  setUp(() {
    loginBloc = MockLoginBloc();
  });

  testWidgets('Login Success should navigate to HomePage',
      (WidgetTester tester) async {
    whenListen<LoginEvent, LoginState>(
      loginBloc,
      Stream<LoginState>.fromIterable(
          [LoginInitial(), LoginLoading(), LoginSuccess()]),
    );

    await tester.pumpWidget(
      MultiBlocProvider(providers: [
        BlocProvider<LoginBloc>(create: (BuildContext context) => loginBloc)
      ], child: WrapperApp(child: LoginPage())),
    );

    await tester.tap(find.text("Entrar"));
    await tester.pumpAndSettle();
    expect(find.byType(HomePage), findsOneWidget);
  });

  testWidgets('Login Failure should show failure message',
      (WidgetTester tester) async {
    whenListen<LoginEvent, LoginState>(
      loginBloc,
      Stream<LoginState>.fromIterable(
          [LoginInitial(), LoginLoading(), LoginFailure()]),
    );

    await tester.pumpWidget(
      MultiBlocProvider(providers: [
        BlocProvider<LoginBloc>(create: (BuildContext context) => loginBloc)
      ], child: WrapperApp(child: LoginPage())),
    );

    await tester.tap(find.text("Entrar"));
    await tester.pumpAndSettle();
    expect(find.byType(SnackBar), findsOneWidget);
    expect(find.text("Login Failure"), findsOneWidget);
    expect(find.text("OK"), findsOneWidget);
  });
}
