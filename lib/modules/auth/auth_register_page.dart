

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../components/auth_textformfield.dart';
import 'auth_store.dart';
import 'models/auth_user_model.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({
    Key? key,
  }) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late AuthStore authStore = context.read<AuthStore>();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Stack(
            children: [
              Image.asset(
                'assets/image/batman.jpg',
                color: Colors.black.withOpacity(.6),
                colorBlendMode: BlendMode.colorBurn,
                height: MediaQuery.of(context).size.height,
                fit: BoxFit.cover,
              ),
              Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 150, bottom: 50),
                    child: Text('THIS MOVIES',
                        style: TextStyle(
                            fontFamily: 'BebasNeue',
                            fontSize: 100,
                            color: Colors.red)),
                  ),
                   AuthTextFormField(icon: Icons.person, hintText: 'Name', onChanged: (value) => User(name: value)),
                  const AuthTextFormField(
                      icon: Icons.cookie, hintText: 'Birthday'),
                  AuthTextFormField(
                      validator: (value) => authStore.validateEmail(value),
                      onChanged: (value) => authStore.email = value,
                      icon: Icons.email,
                      hintText: 'Enter email'),
                  AuthTextFormField(
                      validator: (value) => authStore.validatePassword(value),
                      onChanged: (value) => authStore.password = value,
                      icon: Icons.password,
                      obscureText: true,
                      hintText: 'Password'),
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 40, horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            onTap: () async {
                              if (formKey.currentState!.validate()) {
                                await authStore.register();
                                if (authStore.person != null) {
                                  await Future.delayed(Duration.zero)
                                      .whenComplete(() => Navigator.of(context)
                                          .pushReplacementNamed('/home'));
                                }
                              }
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.red),
                              width: 150,
                              height: 40,
                              child: const Center(
                                child: Text(
                                  'Register',
                                ),
                              ),
                            ),
                          ),
                        ],
                      ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
