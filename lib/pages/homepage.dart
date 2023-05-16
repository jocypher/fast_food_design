import 'package:fast_food_app_design/component/food_item_tile.dart';
import 'package:fast_food_app_design/nav_pages/contact_page.dart';
import 'package:fast_food_app_design/nav_pages/history.dart';
import 'package:fast_food_app_design/nav_pages/search_page.dart';
import 'package:fast_food_app_design/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List _shopItems = [
    ["Burger", "30", "assets/burger.jpg", Colors.white],
    ["Pizza", "44", "assets/pizza.jpg", Colors.white],
    ["Fruits", "44", "assets/fruits.jpg", Colors.white],
    ["Fruits", "10", "assets/avocado.png", Colors.green],
    ["Fruits", "10", "assets/chicken.png", Colors.brown],
    ["Fruits", "10", "assets/water.png", Colors.blue],
    ["Fruits", "10", "assets/banana.png", Colors.yellow]
  ];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            "Junky Yard",
            style: GoogleFonts.adventPro(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 40),
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.favorite_outline_outlined,
                  color: Colors.black,
                )),
            IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => HistoryPage()));
                },
                icon: const Icon(
                  Icons.shopping_cart_outlined,
                  color: Colors.black,
                ))
          ],
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height * 0.017),
              SizedBox(
                height: height * 0.23,
                child: PageView.builder(
                    itemCount: 2,
                    controller: PageController(viewportFraction: 0.94),
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(23),
                            image: const DecorationImage(
                                image: AssetImage("assets/index.jpeg"),
                                fit: BoxFit.cover)),
                      );
                    }),
              ),
              const SizedBox(height: 30),
              Container(
                margin: const EdgeInsets.only(left: 10, right: 30),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: Colors.grey[100],
                    border: Border.all(
                        color: Colors.grey, style: BorderStyle.solid)),
                child: const TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Search Product...",
                      hintStyle:
                          TextStyle(fontFamily: "Montserrat", fontSize: 18),
                      prefixIcon: Icon(Icons.search_outlined)),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                margin: const EdgeInsets.only(left: 10),
                child: const Text(
                  "All Products",
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                margin: const EdgeInsets.only(left: 10),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(2),
                        margin: const EdgeInsets.only(right: 7),
                        decoration: BoxDecoration(
                            color: Colors.grey[400], shape: BoxShape.circle),
                        child: ClipOval(
                          child: SizedBox.fromSize(
                            size: const Size.fromRadius(30), // Image radius
                            child: Image.asset('assets/fruits.jpg',
                                fit: BoxFit.cover),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(2),
                        margin: const EdgeInsets.only(right: 7),
                        decoration: BoxDecoration(
                            color: Colors.grey[400], shape: BoxShape.circle),
                        child: ClipOval(
                          child: SizedBox.fromSize(
                            size: const Size.fromRadius(30), // Image radius
                            child: Image.asset('assets/fruits.jpg',
                                fit: BoxFit.cover),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(2),
                        margin: const EdgeInsets.only(right: 7),
                        decoration: BoxDecoration(
                            color: Colors.grey[400], shape: BoxShape.circle),
                        child: ClipOval(
                          child: SizedBox.fromSize(
                            size: const Size.fromRadius(30), // Image radius
                            child: Image.asset('assets/fruits.jpg',
                                fit: BoxFit.cover),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(2),
                        margin: const EdgeInsets.only(right: 7),
                        decoration: BoxDecoration(
                            color: Colors.grey[400], shape: BoxShape.circle),
                        child: ClipOval(
                          child: SizedBox.fromSize(
                            size: const Size.fromRadius(30), // Image radius
                            child: Image.asset('assets/fruits.jpg',
                                fit: BoxFit.cover),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(2),
                        margin: const EdgeInsets.only(right: 7),
                        decoration: BoxDecoration(
                            color: Colors.grey[400], shape: BoxShape.circle),
                        child: ClipOval(
                          child: SizedBox.fromSize(
                            size: const Size.fromRadius(30), // Image radius
                            child: Image.asset('assets/fruits.jpg',
                                fit: BoxFit.cover),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(2),
                        margin: const EdgeInsets.only(right: 7),
                        decoration: BoxDecoration(
                            color: Colors.grey[400], shape: BoxShape.circle),
                        child: ClipOval(
                          child: SizedBox.fromSize(
                            size: const Size.fromRadius(30), // Image radius
                            child: Image.asset('assets/fruits.jpg',
                                fit: BoxFit.cover),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(2),
                        margin: const EdgeInsets.only(right: 7),
                        decoration: BoxDecoration(
                            color: Colors.grey[400], shape: BoxShape.circle),
                        child: ClipOval(
                          child: SizedBox.fromSize(
                            size: const Size.fromRadius(30), // Image radius
                            child: Image.asset('assets/fruits.jpg',
                                fit: BoxFit.cover),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                margin: const EdgeInsets.only(left: 10),
                child: const Text(
                  "Most Popular",
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  child: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: _shopItems.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10),
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.grey)),
                          child: FoodItemTile(
                            itemName: _shopItems[index][0],
                            itemPrice: _shopItems[index][1],
                            imagePath: _shopItems[index][2],
                          ),
                        );
                      }))
            ],
          ),
        ),
      ),
    );
  }
}
