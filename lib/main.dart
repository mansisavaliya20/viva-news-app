import 'package:flutter/material.dart';
import 'package:news_headlines/Views/Screen/second_page.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Model/bookmark_modal.dart';
import 'Provider/news_provider.dart';
import 'Views/Screen/home_page.dart';
import 'Views/Screen/splesh_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences Pref = await SharedPreferences.getInstance();

  List<String> BookMark = Pref.getStringList("BookMark") ?? [];
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
          create: (context) =>
              BookMark_Provider(m1: BookMark_Model(BookMark: BookMark))),
    ],
    builder: (context, child) => MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      routes: {
        '/': (context) => SplashScreen(),
        'home_page': (context) => HomePage(),
        'second_page': (context) => SecondPage(),
      },
    ),
  ));
}
