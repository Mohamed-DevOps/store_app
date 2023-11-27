import 'package:flutter/material.dart';
import 'package:store_app/pages/home_page.dart';
import 'package:store_app/pages/update_product_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Store App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          // brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      routes: {
        'HomePage': (context) => const HomePage(),
        'UpdateProductPage': (context) => const UpdateProductPage(),
      },
      initialRoute: 'HomePage',
    );
  }
}
