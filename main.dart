import 'package:bug_coffee/cash.dart';
import 'package:bug_coffee/home_page.dart';
import 'package:bug_coffee/login.dart';
import 'package:bug_coffee/order.dart';
import 'package:bug_coffee/pembayaran.dart';
import 'package:bug_coffee/qris.dart';
import 'package:bug_coffee/shopping_cart.dart';
import 'package:bug_coffee/cash.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  LoginScreen(),
      routes: {
        '/home': (context) => const HomePage(), 
        '/shoppingCart': (context) => ShoppingCartScreen(),
        '/pembayaran': (context) => PembayaranScreen(),
        '/qris': (context) => const Qris(),
        '/cash': (context) => KirimUangScreen(),        
        '/order': (context) => Order(),        
      },
    );
  }
}
