import 'package:ehlel/blocs/index.dart';
import 'package:ehlel/routes/index.dart';
import 'package:ehlel/services/dialog/index.dart';
import 'package:ehlel/utils/regex.dart';
import 'package:ehlel/widgets/button.dart';
import 'package:ehlel/widgets/loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _bloc = MainBloc();
  final _formKey = GlobalKey<FormState>();
  final _lastnameCtrl = TextEditingController();
  final _firstnameCtrl = TextEditingController();
  final _phoneCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();

  void _onPress() {
    if (_formKey.currentState!.validate()) {
      _bloc.add(
        UserRegister(
          lastname: _lastnameCtrl.text,
          firstname: _firstnameCtrl.text,
          phone: _phoneCtrl.text,
          email: _emailCtrl.text,
          password: _passwordCtrl.text,
        ),
      );
    }
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
            appBar: AppBar(title: const Text('Бүртгүүлэх'), centerTitle: true),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/logo.png',
                        width: MediaQuery.of(context).size.width * 0.6,
                      ),
                      const SizedBox(height: 20),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            TextFormField(
                              controller: _lastnameCtrl,
                              decoration: const InputDecoration(labelText: 'Овог', prefixIcon: Icon(Icons.face)),
                              validator: UtilRegex.validate,
                            ),
                            const SizedBox(height: 30),
                            TextFormField(
                              controller: _firstnameCtrl,
                              decoration: const InputDecoration(labelText: 'Нэр', prefixIcon: Icon(Icons.face)),
                              validator: UtilRegex.validate,
                            ),
                            const SizedBox(height: 30),
                            TextFormField(
                              controller: _phoneCtrl,
                              decoration: const InputDecoration(labelText: 'Утасны дугаар', prefixIcon: Icon(Icons.phone)),
                              validator: UtilRegex.validate,
                              keyboardType: TextInputType.phone,
                            ),
                            const SizedBox(height: 30),
                            TextFormField(
                              controller: _emailCtrl,
                              decoration: const InputDecoration(labelText: 'Цахим шуудан', prefixIcon: Icon(Icons.email_outlined)),
                              validator: UtilRegex.emailValidate,
                            ),
                            const SizedBox(height: 30),
                            TextFormField(
                              controller: _passwordCtrl,
                              obscureText: true,
                              decoration: const InputDecoration(labelText: 'Нууц үг', prefixIcon: Icon(Icons.password_outlined)),
                              validator: UtilRegex.validate,
                            ),
                            const SizedBox(height: 20),
                            Button(onPress: _onPress, title: 'Бүртгүүлэх'),
                          ],
                        ),
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
