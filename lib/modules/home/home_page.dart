import 'package:flutter/material.dart';
import 'package:login/modules/auth/auth_store.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late AuthStore authStore = context.read<AuthStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Container(
          color: Colors.red,
          child: GestureDetector(
            child: const Icon(Icons.logout),
            onTap: () async {
              await authStore.logout();
              if (authStore.person == null) {
                await Future.delayed(Duration.zero).whenComplete(
                    () => Navigator.of(context).pushReplacementNamed('/auth'));
              }
            },
          ),
        ),
      ),
    );
  }
}
