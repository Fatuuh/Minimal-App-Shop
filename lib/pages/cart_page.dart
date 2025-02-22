import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopp/components/my_button.dart';
import 'package:shopp/models/product.dart';
import 'package:shopp/models/shop.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});
  // remove item from cart method
  void removeItemFromCart(BuildContext context, Product product) {
    // show a dialog box tp ask to confirm ro temove from cart
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: const Text('Remove this item from your cart ?'),
        actions: [
          //  cancel button
          MaterialButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('cancel'),
          ),

          // yes button
          MaterialButton(
            onPressed: () {
              // pop dialog box
              Navigator.pop(context);

              //  add to cart

              context.read<Shop>().removeFromCart(product);
            },
            child: Text('yes'),
          ),
        ],
      ),
    );
  }

  // user pressed pay button
  void payButtonPressed(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content:
            Text('User wants to pay! Connect this app to your payment backend'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // get access to the cart
    final cart = context.watch<Shop>().cart;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Cart Page'),
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Column(
        children: [
          // cart list
          Expanded(
              child: cart.isEmpty
                  ? const Center(child: const Text('Your cart is empty..'))
                  : ListView.builder(
                      itemCount: cart.length,
                      itemBuilder: (context, index) {
                        // get individual item in cart
                        final item = cart[index];
                        // return as a cart title UI
                        return ListTile(
                          title: Text(item.name),
                          subtitle: Text(item.price.toStringAsFixed(2)),
                          trailing: IconButton(
                            icon:
                                const Icon(Icons.remove_shopping_cart_outlined),
                            onPressed: () => removeItemFromCart(context, item),
                          ),
                        );
                      },
                    )),

          // pay button
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: MyButton(
                onTap: () => payButtonPressed(context), child: Text('PAY NOW')),
          )
        ],
      ),
    );
  }
}
