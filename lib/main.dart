import 'package:ehlel/blocs/index.dart';
import 'package:ehlel/global_keys.dart';
import 'package:ehlel/providers/index.dart';
import 'package:ehlel/routes/index.dart';
import 'package:ehlel/screens/auth/splash/index.dart';
import 'package:ehlel/theme/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MainProvider()),
        BlocProvider<MainBloc>(create: (_) => MainBloc()),
      ],
      child: MaterialApp(
        title: 'Ehlel',
        routes: routes,
        theme: myTheme,
        navigatorKey: GlobalKeys.navigatorKey,
        home: const SplashPage(),
        // home: const LoginPage(),
      ),
    );
  }
}
