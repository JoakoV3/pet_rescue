import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  const CustomInput({
    super.key,
    required this.icon,
    required this.placeholder,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.isPassword = false,
  });

  final IconData icon;
  final String placeholder;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool isPassword;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.only(top: 0, left: 5, bottom: 0, right: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 5, offset: const Offset(0, 5))],
      ),
      child: TextField(
        autocorrect: false,
        keyboardType: keyboardType,
        controller: controller,
        obscureText: isPassword,
        decoration: InputDecoration(
          isDense: true,
          border: const OutlineInputBorder(borderSide: BorderSide.none),
          hintText: placeholder,
          prefixIcon: Icon(icon),
          focusColor: Colors.blue[600],
        ),
      ),
    );
  }
}
