import 'package:flutter/material.dart';

import '../components/checkout_card.dart';
import 'order_successful.dart';

class CheckoutPage extends StatelessWidget {
  static const String id = 'checkout_page';
  final List<Map<String, String>> items;
  final Function(int) removeItem;
  final Function(int) orderItem;

  const CheckoutPage({
    super.key,
    required this.items,
    required this.removeItem,
    required this.orderItem,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return CheckoutCard(
            imageUrl: item['imageUrl']!,
            name: item['name']!,
            amount: item['amount']!,
            onOrder: () {
              orderItem(index);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const OrderSuccessful(),
                ),
              );
            },
            onRemove: () {
              removeItem(index);
            },
          );
        },
      ),
    );
  }
}
