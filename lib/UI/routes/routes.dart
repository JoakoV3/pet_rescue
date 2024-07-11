import 'package:flutter/material.dart';
import 'package:pet_rescue/UI/pages/chat_page.dart';
import 'package:pet_rescue/UI/pages/loading_page.dart';
import 'package:pet_rescue/UI/pages/login_page.dart';
import 'package:pet_rescue/UI/pages/register_page.dart';
import 'package:pet_rescue/UI/pages/users_page.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  'users': (_) => UsersPage(),
  'chat': (_) => ChatPage(),
  'login': (_) => const LoginPage(),
  'register': (_) => RegisterPage(),
  'loading': (_) => LoadingPage(),
};