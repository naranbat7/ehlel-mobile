import 'package:ehlel/blocs/index.dart';
import 'package:ehlel/routes/index.dart';
import 'package:ehlel/services/dialog/index.dart';
import 'package:ehlel/utils/regex.dart';
import 'package:ehlel/widgets/button.dart';
import 'package:ehlel/widgets/loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _bloc = MainBloc();
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  void _onPress() {
    if (_formKey.currentState!.validate()) {
      Navigator.pop(context);
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
            appBar: AppBar(title: const Text('Нууц үгээ сэргээх'), centerTitle: true),
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
                            const SizedBox(height: 20),
                            Button(onPress: _onPress, title: 'Үргэлжлүүлэх'),
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
