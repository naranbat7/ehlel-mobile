import 'package:ehlel/blocs/index.dart';
import 'package:ehlel/routes/index.dart';
import 'package:ehlel/services/dialog/index.dart';
import 'package:ehlel/utils/regex.dart';
import 'package:ehlel/widgets/button.dart';
import 'package:ehlel/widgets/loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _bloc = MainBloc();
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController(text: 'amroos988@gmail.com');
  final _passwordController = TextEditingController(text: 'xkalf0218');

  void _onLoginPress() {
    if (_formKey.currentState!.validate()) {
      _bloc.add(UserLogin(email: _emailController.text, password: _passwordController.text));
    }
  }

  void _onForgotPress() {
    Navigator.pushNamed(context, forgotPasswordRoute);
  }

  void _onRegister() {
    Navigator.pushNamed(context, registerRoute);
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<MainBloc, MainState>(
          bloc: _bloc,
          listener: (context, state) async {
            if (state is MainLoading) {
              LoaderWidget.showLoadingDialog();
            }
            if (state is MainSuccessful) {
              LoaderWidget.hideLoadingDialog();
              Navigator.pushNamedAndRemoveUntil(context, homeRoute, (route) => false);
            }
            if (state is MainFailure) {
              LoaderWidget.hideLoadingDialog();
              DialogService.showWarningDialog(state.error);
            }
          },
        ),
      ],
      child: BlocBuilder<MainBloc, MainState>(
        bloc: _bloc,
        builder: (context, state) {
          return Scaffold(
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      Image.asset(
                        'assets/logo.png',
                        width: MediaQuery.of(context).size.width * 0.8,
                      ),
                      const SizedBox(height: 50),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            TextFormField(
                              controller: _emailController,
                              keyboardType: TextInputType.emailAddress,
                              decoration: const InputDecoration(labelText: 'Имэйл хаяг'),
                              validator: UtilRegex.emailValidate,
                            ),
                            const SizedBox(height: 30),
                            TextFormField(
                              controller: _passwordController,
                              obscureText: true,
                              decoration: const InputDecoration(labelText: 'Нууц үг'),
                              validator: UtilRegex.validate,
                            ),
                            const SizedBox(height: 20),
                            Button(onPress: _onLoginPress, title: 'Нэвтрэх'),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: _onForgotPress,
                            child: const Text(
                              'Нууц үгээ мартсан уу?',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text('Шинэ хэрэглэгч?'),
                          TextButton(
                            onPressed: _onRegister,
                            child: const Text('Бүртгүүлэх', style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
