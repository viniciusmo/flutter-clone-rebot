import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rebot/login/state/login.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF0077E77),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Container(height: double.infinity,color: Colors.white),
            SingleChildScrollView(
              child: BlocListener(
                bloc: context.bloc<LoginBloc>(),
                listener: (context, state) {
                  if (state is LoginFailure) {
                    _showLoginFailure(context);
                  }

                  if (state is LoginSuccess) {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        "navigation", (Route<dynamic> route) => false);
                  }
                },
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    _buildHeader(),
                    SizedBox(height: 18),
                    _buildTextField(
                        _usernameController, "Email, CPF ou cód. do revendedor"),
                    SizedBox(height: 22),
                    _buildTextField(_passwordController, "Senha",
                        isPassword: true),
                    SizedBox(height: 14),
                    _buildForgetMyPassword(),
                    SizedBox(height: 20),
                    _buildSignIn(),
                    _buildDividerActions(),
                    _buildSignUp(),
                    SizedBox(height: 6),
                    _buildDivider(),
                    SizedBox(height: 32),
                    _buildSupport()
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showLoginFailure(BuildContext context) {
    final snackBar = SnackBar(
      content: Text('Login Failure'),
      action: SnackBarAction(
        label: 'OK',
        onPressed: () {},
      ),
    );
    Scaffold.of(context).showSnackBar(snackBar);
  }

  Widget _buildDivider() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Divider(color: Color(0xffe5e5e5)),
    );
  }

  Text _buildSupport() {
    return Text("Problemas ao entrar no app?",
        style: TextStyle(
            fontSize: 14,
            color: Color(0xff004f4f),
            fontWeight: FontWeight.bold));
  }

  Widget _buildSignUp() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: SizedBox(
        width: double.infinity,
        height: 50,
        child: FlatButton(
          color: Color(0xffcde5e4),
          textColor: Colors.white,
          onPressed: () {},
          shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(4.0),
          ),
          child: Text(
            "Quero ser um Revendedor",
            style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
                color: Color(0xff015151)),
          ),
        ),
      ),
    );
  }

  Widget _buildDividerActions() {
    return Container(
      height: 50,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Divider(
                color: Color(0xffe5e5e5),
              ),
              flex: 3,
            ),
            Expanded(
              child: Center(
                  child: Text(
                "ou",
                style: TextStyle(color: Color(0xff5d5d5d)),
              )),
              flex: 1,
            ),
            Expanded(
              child: Container(
                child: Divider(color: Color(0xffe5e5e5)),
              ),
              flex: 3,
            )
          ],
        ),
      ),
    );
  }

  Widget _buildSignInInitial() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: SizedBox(
        width: double.infinity,
        height: 50,
        child: FlatButton(
          color: Color(0xff077e77),
          textColor: Colors.white,
          onPressed: () {
            context.bloc<LoginBloc>().add(LoginRequested(
                username: _usernameController.text,
                password: _passwordController.text));
          },
          shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(4.0),
          ),
          child: Text(
            "Entrar",
            style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  Widget _buildSignInLoading() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: SizedBox(
        width: double.infinity,
        height: 50,
        child: FlatButton(
          onPressed: () {},
          color: Color(0xff077e77),
          textColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(4.0),
          ),
          child: Container(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(
                valueColor: new AlwaysStoppedAnimation<Color>(Colors.white)),
          ),
        ),
      ),
    );
  }

  Padding _buildForgetMyPassword() {
    return Padding(
      padding: const EdgeInsets.only(right: 18.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Text("Esqueceu sua senha?",
              style: TextStyle(
                  fontSize: 14,
                  color: Color(0xff004f4f),
                  fontWeight: FontWeight.bold))
        ],
      ),
    );
  }

  Container _buildHeader() {
    return Container(
      color: Color(0xFF0077E77),
      height: 140,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          SizedBox(
              width: 156, height: 44, child: Image.asset("assets/ic_logo.png")),
        ],
      ),
    );
  }

  Widget _buildSignIn() {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        if (state is LoginLoading) {
          return _buildSignInLoading();
        } else {
          return _buildSignInInitial();
        }
      },
    );
  }

  Padding _buildTextField(TextEditingController controller, String title,
      {bool isPassword = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(title, style: TextStyle(fontSize: 14, color: Color(0xff575757))),
          SizedBox(height: 5),
          Container(
            height: 48,
            child: TextField(
                key: Key(title),
                obscureText: isPassword,
                controller: controller,
                decoration: InputDecoration(
                    suffixIcon: isPassword
                        ? IconButton(icon: Icon(Icons.visibility))
                        : null,
                    filled: true,
                    fillColor: Color(0xfff5f5f5),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xffe1e1e1), width: 2.0)),
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xffe1e1e1), width: 2.0)))),
          ),
        ],
      ),
    );
  }
}
