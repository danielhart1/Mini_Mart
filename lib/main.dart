import 'package:flutter/material.dart';
import 'package:mini_mart/pages/homepage.dart';
import 'package:mini_mart/ui/styles.dart';
import 'package:mini_mart/providers/cart_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final cartProvider = CartProvider();
  await cartProvider.initCart();

  runApp(ChangeNotifierProvider.value(value: cartProvider, child: MyApp()));
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: primaryColor,

            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
      ),
      home: const Homepage(),
    );
  }
}
