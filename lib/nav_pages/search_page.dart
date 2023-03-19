import 'package:fast_food_app_design/component/food_item_tile.dart';
import 'package:fast_food_app_design/nav_pages/main_page1.dart';
import 'package:flutter/material.dart';


class SearchPage extends StatefulWidget {
   const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  final List _foodItems = [
    ["Burger", "30", "assets/burger.jpg", Colors.white],
    ["Pizza", "44","assets/pizza.jpg", Colors.white],
    ["Fruits", "44","assets/fruits.jpg", Colors.white],
    ["Fruits", "10","assets/avocado.png", Colors.greenAccent],
    ["Fruits", "10","assets/chicken.png", Colors.brown.shade400],
    ["Fruits", "10","assets/water.png", Colors.blueAccent],
    ["Fruits", "10","assets/banana.png", Colors.yellowAccent]
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:  SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                      child: const Icon(Icons.arrow_back_ios_new),
                  onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          return const MainPage();
                        }));
                  },),

                  const Text("Menu Items",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.2,
                  ),
                  ),
                  Row(
                      children: const [
                        Icon(Icons.shopping_cart_outlined),
                        SizedBox(width: 3),
                        Icon(Icons.filter_alt_sharp)
                      ],
                  )

                ],
              ),
              const SizedBox(height: 5,),
              Container(
                margin: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.grey[100],
                    border: Border.all(
                        color: Colors.grey,
                        style: BorderStyle.solid
                    )
                ),
                child: const TextField(
                  decoration: InputDecoration(
                      hintText: "What are you looking for?",
                      hintStyle: TextStyle(
                          fontFamily: "Montserrat",
                          fontSize: 18
                      ),
                      prefixIcon: Icon(Icons.search_outlined)
                  ),
                ),
              ),
              const SizedBox(height: 10),
              GridView.builder(
                scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: _foodItems.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10),
                  itemBuilder: (context, index){
                    return
                      Container(
                        child: FoodItemTile(
                            itemName: _foodItems[index][0],
                            itemPrice: _foodItems[index][1],
                            imagePath: _foodItems[index][2],
                          color: _foodItems[index][3],
                        ),
                      );
                  })

            ],
          ),
        ),
      ),
    );
  }
}
