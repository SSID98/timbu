import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timbu/pages/checkout_page.dart';
import 'package:timbu/pages/main_page.dart';
import 'package:timbu/pages/products_page.dart';
import 'package:timbu/services/item_manager.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ItemManager(),
      child: const SimpleShoppingApp(),
    ),
  );
}

class SimpleShoppingApp extends StatelessWidget {
  const SimpleShoppingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: MainPage.id,
      routes: {
        MainPage.id: (context) => const MainPage(),
        ProductsPage.id: (context) => ProductsPage(
              addItem: (string, strings, stringss) {},
            ),
        CheckoutPage.id: (context) => CheckoutPage(
              items: const [],
              removeItem: (intt) {},
              orderItem: (intt) {},
            ),
      },
    );
  }
}
