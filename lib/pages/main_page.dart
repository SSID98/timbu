import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timbu/pages/products_page.dart';
import 'package:timbu/services/item_manager.dart';

import 'checkout_page.dart';

class MainPage extends StatefulWidget {
  static const String id = 'main_page';

  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final PageStorageBucket bucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    return Consumer<ItemManager>(builder: (context, itemManager, child) {
      return Scaffold(
        appBar: AppBar(
          title: Text(itemManager.selectedIndex == 0 ? 'Products' : 'Checkout'),
        ),
        body: PageStorage(
          bucket: bucket,
          child: IndexedStack(
            index: itemManager.selectedIndex,
            children: [
              ProductsPage(addItem: itemManager.addItem),
              CheckoutPage(
                  items: itemManager.items,
                  removeItem: itemManager.removeItem,
                  orderItem: itemManager.orderItem),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Products',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Checkout',
            ),
          ],
          currentIndex: itemManager.selectedIndex,
          selectedItemColor: Colors.amber[800],
          onTap: itemManager.onItemTapped,
        ),
      );
    });
  }
}
