import 'package:flutter/material.dart';
import 'package:pet_rescue/widget/custom_input.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _Logo(),
                _Form(),
                _Labels(),
                const Text("Terms and conditions of use", style: TextStyle(fontWeight: FontWeight.w200)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.only(top: 50),
        width: 170,
        child: const Column(
          children: [
            Image(image: AssetImage('assets/tag-logo.png')),
            SizedBox(height: 20),
            Text('Messenger', style: TextStyle(fontSize: 30)),
          ],
        ),
      ),
    );
  }
}

class _Form extends StatefulWidget {
  @override
  State<_Form> createState() => _FormState();
}

class _FormState extends State<_Form> {
  final TextEditingController emailCtrl = TextEditingController();
  final TextEditingController passwordCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          CustomInput(icon: Icons.email, placeholder: 'Email', keyboardType: TextInputType.emailAddress, controller: emailCtrl),
          CustomInput(icon: Icons.lock_outline, placeholder: 'Password', controller: passwordCtrl, isPassword: true),
          ElevatedButton(
            style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.blue[600])),
            child: const SizedBox(
              width: double.infinity,
              child: Center(child: Text('Login', style: TextStyle(color: Colors.white))),
            ),
            onPressed: () {
              print('${emailCtrl.text} ${passwordCtrl.text}');
            },
          ),
        ],
      ),
    );
  }
}

class _Labels extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("Don't have an account?", style: TextStyle(color: Colors.black54, fontSize: 15, fontWeight: FontWeight.w300)),
        Text("Create one now!", style: TextStyle(color: Colors.blue[600], fontSize: 18, fontWeight: FontWeight.bold)),
      ],
    );
  }
}
