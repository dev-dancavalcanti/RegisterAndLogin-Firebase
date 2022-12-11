import 'package:flutter/material.dart';
import 'package:login/modules/auth/auth_store.dart';
import 'package:login/modules/splash/splash_page.dart';

import 'package:provider/provider.dart';
import 'modules/auth/auth_login_page.dart';
import 'modules/home/home_page.dart';
import 'modules/auth/auth_register_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => AuthStore())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData.dark(),
        initialRoute: '/splash',
        routes: {
          '/splash': (context) => const SplashPage(),
          '/auth': (context) => const AuthPage(),
          '/register': (context) => const RegisterPage(),
          '/home': (context) => const HomePage(),
        },
      ),
    );
  }
}
