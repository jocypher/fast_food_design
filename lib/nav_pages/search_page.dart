import 'package:fast_food_app_design/component/food_item_tile.dart';
import 'package:fast_food_app_design/nav_pages/history.dart';
import 'package:fast_food_app_design/nav_pages/main_page1.dart';
import 'package:flutter/material.dart';


class SearchPage extends StatefulWidget {
   const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  final List _foodItems = [
    ["Burger", "30", "assets/burger.jpg",],
    ["Pizza", "44","assets/pizza.jpg",],
    ["Fruits", "44","assets/fruits.jpg",],
    ["Fruits", "10","assets/avocado.png",],
    ["Fruits", "10","assets/chicken.png", ],
    ["Fruits", "10","assets/water.png", ],
    ["Fruits", "10","assets/banana.png",]
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
                      children:  [
                        IconButton(
                          onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const HistoryPage())),
                          icon: const Icon(Icons.shopping_cart_outlined)),
                        const SizedBox(width: 3,)
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
                    border: InputBorder.none,
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
              Container(
                 margin: const EdgeInsets.symmetric(horizontal: 5),
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: _foodItems.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 8),
                    itemBuilder: (context, index){
                      return
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.grey)
                          ),
                          child: FoodItemTile(
                              itemName: _foodItems[index][0],
                              itemPrice: _foodItems[index][1],
                              imagePath: _foodItems[index][2],
                          ),
                        );
                    }),
              )

            ],
          ),
        ),
      ),
    );
  }
}
