import 'package:fast_food_app_design/component/food_item_tile.dart';
import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final addFood = AddFood();
    return  Scaffold(
      appBar: AppBar(
        title: Text("History"),
        centerTitle: true,


      ),
        body:ListView.builder(
            itemCount: addFood.length,
            itemBuilder: (context, index){
              final food = addFood.food(atIndex: index)!;
              return ListTile(
                tileColor: Colors.white,
                title: Text(food.name),
                leading: Image(image: AssetImage(food.img),
                ),
                subtitle: Text(food.price.toString()),

              );
            }
        )
    );
  }
}