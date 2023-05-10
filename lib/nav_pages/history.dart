import 'package:fast_food_app_design/component/food_item_tile.dart';
import 'package:fast_food_app_design/nav_pages/main_page1.dart';
import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final addFood = AddFood();
    return Scaffold(
        appBar: AppBar(
          title: const Text("My Cart"),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return const MainPage();
              }));
            },
          ),
          centerTitle: true,
        ),
        body: ValueListenableBuilder(
          valueListenable: AddFood(),
          builder: (BuildContext context, value, Widget? child) {
            final foods = value;
            return Column(children: [
              Expanded(
                child: ListView.builder(
                    itemCount: addFood.length,
                    itemBuilder: (context, index) {
                      final food = addFood.food(atIndex: index)!;
                      return Dismissible(
                        onDismissed: (direction) {
                          foods.remove(food);
                        },
                        key: ValueKey(food.name),
                        child: Material(
                          elevation: 0,
                          child: Card(
                            child: ListTile(
                              title: Text(food.name),
                              leading: Image(
                                image: AssetImage(food.img),
                              ),
                              subtitle: Text("\$${food.price}"),
                              trailing: IconButton(
                                  onPressed: () {
                                    addFood.removeTile(food: food);
                                  },
                                  icon: const Icon(Icons.delete)),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
              Padding(
                padding: const EdgeInsets.all(38.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.deepOrange,
                      borderRadius: BorderRadius.circular(5)),
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Total Price",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            "\$${AddFood().calculateTotal()}",
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.white60,
                            ),
                            borderRadius: BorderRadius.circular(5)),
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: const [
                            Text(
                              "Pay Now",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ]);
          },
        ));
  }
}
