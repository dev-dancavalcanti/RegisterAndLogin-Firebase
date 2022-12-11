import 'dart:async';

import 'package:flutter/material.dart';
import 'package:login/modules/auth/auth_store.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late final AuthStore authStore;
  @override
  void initState() {
    super.initState();
    authStore = context.read<AuthStore>();
    Timer(const Duration(seconds: 3), () {
      if (authStore.person != null) {
        Navigator.of(context).pushReplacementNamed('/home');
      } else {
        Navigator.of(context).pushReplacementNamed('/auth');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Image.asset('assets/image/bat.png')),
    );
  }
}
