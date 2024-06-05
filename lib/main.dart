import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:pet_rescue/routes/routes.dart';
import 'package:provider/provider.dart';
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
    return MultiProvider(
      providers: const [],
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
