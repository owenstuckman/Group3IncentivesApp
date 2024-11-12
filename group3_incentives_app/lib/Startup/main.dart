import 'package:flutter/material.dart';
import 'package:group3_incentives_app/Startup/themes.dart';
import 'package:provider/provider.dart';

import 'package:supabase_flutter/supabase_flutter.dart';

import 'home_page.dart';


Future<void> main() async {
  await Supabase.initialize(
    url: 'https://tsewlrukrykkycootlsb.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InRzZXdscnVrcnlra3ljb290bHNiIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjkzNjcwNTUsImV4cCI6MjA0NDk0MzA1NX0.DNwdRirUSViojOqOOLHaJ_lW9u2jd1siOxqdmQWz6PU',
  );
  runApp(
    MultiProvider(
      providers: [

      ],
      child: MyApp(),
    ),
  );
}

// Get a reference your Supabase client
final supabase = Supabase.instance.client;


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}



