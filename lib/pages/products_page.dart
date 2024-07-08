import 'package:flutter/material.dart';

import '../components/product_card.dart';
import '../model/products.dart';
import '../services/network_helper.dart';

const orgID = 'db9ac75a5b6942d68e3c98452029f75d';
const apiKey = '3f789dbf6514431b9ab3fbad7c8d96a020240707132444883782';
const appID = 'UG013DNDZ9PV7T3';

class ProductsPage extends StatefulWidget {
  final Function(String, String, String) addItem;
  static const String id = 'products_page';

  const ProductsPage({super.key, required this.addItem});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  List<Product> products = [];

  Future getProductData() async {
    NetworkHelper networkHelper = NetworkHelper(
        'https://api.timbu.cloud/products?organization_id=$orgID&reverse_sort=false&page=1&size=10&Appid=$appID&Apikey=$apiKey');
    var productData = await networkHelper.getData();

    for (var eachProduct in productData['items']) {
      final name = eachProduct['name'];
      final currentPriceList = eachProduct['current_price'];
      String price = '0';
      if (currentPriceList.isNotEmpty) {
        final ngnList = currentPriceList[0]['NGN'];
        if (ngnList != null && ngnList.isNotEmpty) {
          price = ngnList[0].toString();
        }
      }
      final photosList = eachProduct['photos'];
      final imageUrl = photosList.isNotEmpty ? photosList[0]['url'] : '';
      final product = Product(name: name, price: price, imageUrl: imageUrl);
      products.add(product);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getProductData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return GridView.builder(
              itemCount: 10,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 5 / 10,
                // Width / height ratio for each item
                crossAxisSpacing: 5,
                mainAxisSpacing: 10,
              ),
              itemBuilder: (ctx, i) => Center(
                child: ProductCard(
                  imageUrl: products[i].imageUrl,
                  name: products[i].name,
                  amount: products[i].price,
                  onPressed: () {
                    widget.addItem(products[i].imageUrl, products[i].name,
                        products[i].price);
                  },
                ),
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
