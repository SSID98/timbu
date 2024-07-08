import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'custom_button.dart';

class ProductCard extends StatelessWidget {
  final String name;
  final String amount;
  final VoidCallback onPressed;
  final String image = "http://api.timbu.cloud/images/";
  final String imageUrl;

  const ProductCard({
    super.key,
    required this.name,
    required this.amount,
    required this.onPressed,
    required this.imageUrl,
  });

  String formatNumber(String numberString) {
    final number = double.parse(numberString);
    final formatter = NumberFormat('₦#,##0.00', 'en_NG'); //
    return formatter.format(number);
  }

  @override
  Widget build(BuildContext context) {
    String formattedAmount = formatNumber(amount);
    return Card(
      elevation: 5,
      margin: const EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Image.network(image + imageUrl,
                  height: 150, width: double.infinity, fit: BoxFit.contain),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(name,
                  style: const TextStyle(
                      fontSize: 20,
                      color: Color(0xff393F47),
                      overflow: TextOverflow.ellipsis)),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(formattedAmount,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87)),
            ),
            const Spacer(),
            Align(
              alignment: Alignment.bottomCenter,
              child: CustomButton(
                onPress: onPressed,
                colour: Colors.amber[800],
                label: 'ADD TO CART',
              ),
            )
          ],
        ),
      ),
    );
  }
}
