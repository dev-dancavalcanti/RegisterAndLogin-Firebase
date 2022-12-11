import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../components/auth_textformfield.dart';
import 'auth_store.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  late AuthStore auth = context.read<AuthStore>();
  final formKey = GlobalKey<FormState>();
  bool animated = true;

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
                    padding: EdgeInsets.only(top: 150, bottom: 100),
                    child: Text('THIS MOVIES',
                        style: TextStyle(
                            fontFamily: 'BebasNeue',
                            fontSize: 100,
                            color: Colors.red)),
                  ),
                  AuthTextFormField(
                      validator: (value) => auth.validateEmail(value),
                      onChanged: (value) => auth.email = value,
                      icon: Icons.email,
                      hintText: 'Enter email'),
                  AuthTextFormField(
                      validator: (value) => auth.validatePassword(value),
                      onChanged: (value) => auth.password = value,
                      icon: Icons.password,
                      hintText: 'Password'),
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 40, horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            onTap: () async {
                              if (formKey.currentState!.validate()) {
                                await auth.login();
                                if (auth.person != null) {
                                  await Future.delayed(Duration.zero)
                                      .whenComplete(() => Navigator.of(context)
                                          .pushReplacementNamed('/home'));
                                }
                              }
                            },
                            child: AnimatedContainer(duration: const Duration(seconds: 1),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.red),
                              width: 150,
                              height: 40,
                              child:  Center(
                                child: animated ?const  Text(
                                  'Login',
                                ) :const Center(child:   CircularProgressIndicator()) ,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                animated = true;
                              });
                              Navigator.of(context)
                                  .pushNamed('/register', arguments: auth);
                            },
                            child: Container(
                              width: 150,
                              height: 40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.white),
                              child: const Center(
                                child: Text(
                                  'Register',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ),
                          )
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

