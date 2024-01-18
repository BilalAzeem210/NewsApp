import 'package:flutter/material.dart';
import 'package:newsapp/view/home_screen.dart';
import 'package:newsapp/view/splash_screen.dart';
import 'package:newsapp/view_model/category_view_model.dart';
import 'package:newsapp/view_model/news_view_model.dart';
import 'package:provider/provider.dart';

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
        ChangeNotifierProvider(create: (_) => NewsViewModel()),
        ChangeNotifierProvider(create: (_) => CategoryViewModel()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'News App',

        home: SplashScreen()
      ),
    );
  }
}

