import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rebot/home/navigation_page.dart';
import 'package:rebot/login/page/login_page.dart';
import 'package:rebot/login/state/login.dart';

class WrapperApp extends StatelessWidget {
  final Widget child;

  const WrapperApp({this.child});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter RE Boti',
        routes: {
          'login': (context) => LoginPage(),
          'navigation': (context) => NavigationPage()
        },
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: 'Domaine',
        ),
        home: child);
  }
}
