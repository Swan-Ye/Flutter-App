import 'package:flutter/material.dart';
import 'package:myapp/components/button.dart';
import 'package:myapp/model/food.dart';
import 'package:myapp/themes/color.dart';
import 'package:myapp/components/food_tile.dart';
import 'package:provider/provider.dart';

import '../model/shop.dart';
import 'food_detail_page.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  //navigation to detail page

  void navigationToFoodDetails(int index) {
    final shop = context.read<Shop>();
    final foodMenu = shop.foodMenu;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FoodDetailsPage(food: foodMenu[index]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final shop = context.read<Shop>();
    final foodMenu = shop.foodMenu;
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.grey[800],
        elevation: 0,
        leading: const Icon(
          Icons.menu,
        ),
        title: const Text(
          'Tokyo',
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/cartpage');
            },
            icon: const Icon(Icons.shopping_cart),
          ),
        ],
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          decoration: BoxDecoration(
              color: primaryColor, borderRadius: BorderRadius.circular(20)),
          margin: const EdgeInsets.symmetric(vertical: 25, horizontal: 30),
          padding: const EdgeInsets.all(25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Get 32% Promo',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  const SizedBox(height: 20),
                  MyButton(text: "Reedem", onTap: () {})
                ],
              ),
              Image.asset(
                'asset/sushi.png',
                height: 100,
              )
            ],
          ),
        ),
        const SizedBox(
          height: 25,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: TextField(
            decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(20),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(20),
                ),
                hintText: "Search here..."),
          ),
        ),
        const SizedBox(
          height: 25,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Text(
            "Food Menu",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey[800],
                fontSize: 18),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Expanded(
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: foodMenu.length,
            itemBuilder: (context, index) => FoodTile(
              food: foodMenu[index],
              onTap: () => navigationToFoodDetails(index),
            ),
          ),
        ),
        const SizedBox(
          height: 25,
        ),
        Container(
          decoration: BoxDecoration(
              color: Colors.grey[100], borderRadius: BorderRadius.circular(20)),
          margin: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
          padding: const EdgeInsets.all(20),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Row(
              children: [
                Image.asset(
                  'asset/sushi.png',
                  height: 60,
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Salmon eggs',
                      style: TextStyle(fontSize: 18),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      '\$2000',
                      style: TextStyle(color: Colors.grey[700]),
                    )
                  ],
                ),
              ],
            ),
            const Icon(
              Icons.favorite_outline,
              color: Colors.grey,
              size: 28,
            )
          ]),
        )
      ]),
    );
  }
}
