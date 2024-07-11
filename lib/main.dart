import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:pet_rescue/UI/auth_bloc/auth_bloc.dart';
import 'package:pet_rescue/UI/routes/routes.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  final dbUrl = dotenv.env['DB_URL'];
  final dbAnon = dotenv.env['DB_ANON'];

  if (dbUrl == null || dbAnon == null) {
    throw Exception('.env file is missing DB_URL or DB_ANON');
  }

  await Supabase.initialize(url: dbUrl, anonKey: dbAnon);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AuthBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        title: 'Pet rescue',
        initialRoute: 'login',
        routes: appRoutes,
      ),
    );
  }
}
