import 'package:flutter/material.dart';
import 'package:shopp/components/my_list_title.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              // drawer header: logo
              DrawerHeader(
                child: Center(
                  child: Icon(
                    Icons.shopping_bag_outlined,
                    size: 75,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
              ),

              const SizedBox(height: 25),

              // shop title

              MyListTitle(
                text: 'shop',
                icon: Icons.home_outlined,
                onTap: () => Navigator.pop(context),
              ),

              // cart title

              MyListTitle(
                text: 'cart',
                icon: Icons.shopping_cart_outlined,
                onTap: () {
                  // pop drawer first
                  Navigator.pop(context);
                  //  go to cart page
                  Navigator.pushNamed(context, '/cart_page');
                },
              ),
            ],
          ),

          // exit shop title

          SafeArea(
            bottom: true,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 5.0),
              child: MyListTitle(
                text: 'exit',
                icon: Icons.logout_outlined,
                onTap: () => Navigator.pushNamedAndRemoveUntil(
                    context, '/intro_page', (rute) => false),
              ),
            ),
          )
        ],
      ),
    );
  }
}
