import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'custom_button.dart';
import 'custom_delete_button.dart';

class CheckoutCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String amount;
  final VoidCallback onRemove;
  final String image = "http://api.timbu.cloud/images/";
  final VoidCallback onOrder;

  const CheckoutCard({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.amount,
    required this.onRemove,
    required this.onOrder,
  });

  String formatNumber(String numberString) {
    final number = double.parse(numberString);
    final formatter = NumberFormat('₦#,##0.00', 'en_NG'); //
    return formatter.format(number);
  }

  @override
  Widget build(BuildContext context) {
    String formattedAmount = formatNumber(amount);
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 0.0),
            blurRadius: 1.0,
            spreadRadius: 0.1,
          ),
        ],
      ),
      margin: const EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image.network(image + imageUrl,
                height: 150, width: double.infinity, fit: BoxFit.contain),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(name,
                  style:
                      const TextStyle(fontSize: 20, color: Color(0xff393F47))),
            ),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(formattedAmount,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87)),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                    child: CustomButton(
                  onPress: onOrder,
                  label: 'ORDER',
                  colour: Colors.amber[800],
                )),
                const SizedBox(width: 30),
                Expanded(
                  child: CustomDeleteButton(
                    onPress: onRemove,
                    label: 'REMOVE',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
