import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rebot/login/repository/user_repository_impl.dart';
import 'package:rebot/login/state/login.dart';
import 'package:rebot/home/navigation_page.dart';
import 'package:rebot/login/page/login_page.dart';

class ReBotiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<LoginBloc>(
            create: (BuildContext context) =>
                LoginBloc(userRepository: UserRepositoryImpl()),
          )
        ],
        child: MaterialApp(
          title: 'Flutter RE Boti',
          initialRoute: 'login',
          routes: {
            'login': (context) => LoginPage(),
            'navigation': (context) => NavigationPage()
          },
          theme: ThemeData(
            primarySwatch: Colors.blue,
            fontFamily: 'Domaine',
          ),
          home: LoginPage(),
        ));
  }
}
