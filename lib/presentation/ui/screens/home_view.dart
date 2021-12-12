import 'package:flutter/material.dart';
import 'package:unique_login/presentation/ui/screens/users_list.dart';
import 'package:unique_login/presentation/ui/widgets/button_widget.dart';
import 'package:unique_login/presentation/ui/widgets/custom_input_field.dart';
import 'package:unique_login/usecases/login_user/log_in_user_imp.dart';
import 'package:unique_login/usecases/login_user/log_in_user_usecase.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String? _email;
  String? _password;
  LogInUserUseCase logInUserUseCase = LogInUserUseCaseImp();
  final _loginFormKey = GlobalKey<FormState>();

  _loginUser(String email, String password) {
    if (logInUserUseCase(email, password)) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const UsersList()));
    } else {
      print('Error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            _loginForm(),
            const SizedBox(
              height: 20,
            ),
            ButtonWidget(
                title: 'Entrar',
                hasBorder: false,
                onTap: () {
                  if (_loginFormKey.currentState!.validate()) {
                    _loginFormKey.currentState!.save();
                    _loginUser(_email!, _password!);
                  }
                }),
          ],
        ),
      ),
    );
  }

  Widget _loginForm() {
    return Form(
      key: _loginFormKey,
      child: Column(
        children: [
          CustomInputField(
            labelText: 'Email',
            prefixIconData: Icons.mail_outline,
            obscureText: false,
            onSaved: (_value) {
              setState(() {
                _email = _value;
              });
            },
            regEx:
                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
          ),
          const SizedBox(
            height: 10,
          ),
          CustomInputField(
            labelText: 'Senha',
            prefixIconData: Icons.lock_outline,
            obscureText: true,
            onSaved: (_value) {
              setState(() {
                _password = _value;
              });
            },
            regEx: r".{8,}",
          ),
        ],
      ),
    );
  }
}
