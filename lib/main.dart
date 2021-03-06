import 'package:flutter/material.dart';
import 'package:flutterworkshop/data_provider.dart';
import 'package:flutterworkshop/edit_page.dart';
import 'package:flutterworkshop/main_page.dart';
import 'package:preferences/preference_service.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PrefService.init();

  PrefService.setDefaultValues({
    'data_map_keys': ['Flutter', 'React', 'Xamarin', 'Ionic'],
    'data_map_values': ['5', '3', '2', '2'],
  });

  runApp(ChangeNotifierProvider(
      create: (context) => DataProvider(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primaryColor: Color(0xFF4DB5E4),
        accentColor: Color(0xFF43ACCD),
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        '/': (context) => MainPage(),
        '/edit': (context) => EditPage(),
      },
    );
  }
}
