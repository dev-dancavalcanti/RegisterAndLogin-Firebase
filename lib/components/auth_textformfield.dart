import 'package:flutter/material.dart';

class AuthTextFormField extends StatelessWidget {
  const AuthTextFormField({
    Key? key,
    this.validator,
    this.onChanged,
    required this.icon,
    required this.hintText,
    this.obscureText,
  }) : super(key: key);

  final String? Function(String?)? validator;
  final void Function(String?)? onChanged;
  final bool? obscureText;
  final IconData icon;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: TextFormField(
        cursorColor: Colors.red,
        obscureText: obscureText == null ? false : true,
        decoration: InputDecoration(
            fillColor: Colors.black54,
            filled: true,
            hintText: hintText,
            prefixIcon: Icon(
              icon,
              color: Colors.red,
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 3),
            ),
            border: const OutlineInputBorder()),
        validator: validator,
        onChanged: onChanged,
      ),
    );
  }
}
