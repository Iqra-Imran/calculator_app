import 'package:calculator/cart_task_with_api/provider/cart_provider.dart';
import 'package:calculator/cart_task_with_api/screens/product_screen.dart';
import 'package:calculator/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (_) => CartProvider(),
        child: const MyApp(),
      ),
    ],
    child:const MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home:  ProductListScreen(),
    ),
    );


  }
}


