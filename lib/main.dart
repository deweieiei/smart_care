import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_care/provider/provider.dart';
import 'package:smart_care/spalsh/spalsh.dart';
// ignore: depend_on_referenced_packages
//import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ((context) => DataProvider()))
      ],
      child: MaterialApp(
        // localizationsDelegates: const [
        //   GlobalMaterialLocalizations.delegate,
        //   GlobalWidgetsLocalizations.delegate,
        //   GlobalCupertinoLocalizations.delegate,
        // ],
        // supportedLocales: const [
        //   Locale('en', 'US'), // (สหรัฐอเมริกา)
        //   Locale('es', 'ES'), // (สเปน)
        //   Locale('th', 'TH'), // (ไทย)
        // ],
        // locale: const Locale('en', 'US'),
        debugShowCheckedModeBanner: false,
        title: 'SmartCare',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
          useMaterial3: true,
        ),
        home: const Spalsh(),
      ),
    );
  }
}
