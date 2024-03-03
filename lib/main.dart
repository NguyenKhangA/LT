import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_basic/cart_provider.dart';
import 'package:shopping_basic/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Times New Roman',
          colorScheme: ColorScheme.fromSeed(
              seedColor:const Color.fromRGBO(254, 206, 1, 1),
              primary: const Color.fromRGBO(254, 206, 1, 1)),
          inputDecorationTheme: const InputDecorationTheme(
            hintStyle: TextStyle(
              fontWeight: FontWeight.bold
            ),
            prefixIconColor: Color.fromRGBO(119, 119, 119, 1)
          ),
          textTheme: const TextTheme(
            titleLarge: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),
            titleMedium: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20
            ),
            bodySmall: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16
            )
          ),
          appBarTheme: const AppBarTheme(
            titleTextStyle: TextStyle(
              fontSize: 20,
              color: Colors.black
            )
          ),
        ),
        title: 'Hopping App',
        home:  const HomePage(),
      ),
    );
  }
}
