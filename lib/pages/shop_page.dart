import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopp/components/my_drawer.dart';
import 'package:shopp/components/my_product_title.dart';
import 'package:shopp/models/shop.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    // access products in shop
    final products = context.watch<Shop>().shop;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: Theme.of(context).colorScheme.inverseSurface,
          title: const Text('Shop Page'),
        ),
        drawer: MyDrawer(),
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: ListView(
          children: [
            const SizedBox(
              height: 25,
            ),
            // shop subtitle
            Center(
                child: Text(
              'Pick from a selected list of products ',
              style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary),
            )),

            // product list
            SizedBox(
              height: 550,
              child: ListView.builder(
                itemCount: products.length,
                // SCROLL
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.all(15),
                itemBuilder: (context, index) {
                  // get each individul product from shop
                  final product = products[index];
                  // return asa a product title UI
                  return MyProductTitle(product: product);
                },
              ),
            ),
          ],
        ));
  }
}
