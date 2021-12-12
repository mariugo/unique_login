import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '/presentation/ui/theme/design_system.dart';
import '/presentation/ui/widgets/wave_widget.dart';
import '/presentation/ui/screens/users_list.dart';
import '/presentation/ui/widgets/button_widget.dart';
import '/presentation/ui/widgets/custom_input_field.dart';
import '/usecases/login_user/log_in_user_imp.dart';
import '/usecases/login_user/log_in_user_usecase.dart';

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
      const snackBar = SnackBar(content: Text('Email ou senha inválidos'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bool keyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: size.height - 200,
            color: DesignSystem.primaryColor,
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeOutQuad,
            top: keyboardOpen ? -size.height / 3.7 : 0.0,
            child: WaveWidget(
              size: size,
              yOffset: size.height / 3.0,
              color: Colors.white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Login',
                  style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontSize: 50.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 30, 30, 100),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                _loginForm(),
                const SizedBox(
                  height: 30,
                ),
                ButtonWidget(
                  title: 'Entrar',
                  hasBorder: false,
                  onTap: () {
                    if (_loginFormKey.currentState!.validate()) {
                      _loginFormKey.currentState!.save();
                      _loginUser(_email!, _password!);
                    }
                  },
                ),
              ],
            ),
          ),
        ],
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
            height: 20,
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
