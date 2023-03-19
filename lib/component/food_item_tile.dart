import 'package:flutter/material.dart';

class Food{
  final String name;
  final int price;
  final String img;

  Food({required this.name, required this.price, required this.img});
}
class AddFood{
  AddFood._sharedInstance();
  static final AddFood _shared = AddFood._sharedInstance();
  factory AddFood()=> _shared;

  final List foodTile = [
    Food(name: "Burger", price: 10, img: "assets/burger.jpg")
  ];
  int get length => foodTile.length;

  void addTile({required Food food}){
    foodTile.add(food);
  }
  void removeTile({required Food food}){
    foodTile.remove(food);
  }

  Food? food({required int atIndex}) =>
      foodTile.length > atIndex ? foodTile[atIndex]: null;

}




class FoodItemTile extends StatefulWidget {
   final String itemName;
   final String itemPrice;
  final String imagePath;
  final Color color;

   const FoodItemTile({
     super.key,
    required this.itemName,
    required this.itemPrice,
    required this.imagePath,
     required this.color,

});



  @override
  State<FoodItemTile> createState() => _FoodItemTileState();
}

class _FoodItemTileState extends State<FoodItemTile> {

  late final TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: widget.color
      ),

      child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(widget.imagePath,
          height: 125,
          width: 195,
          ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(widget.itemName,
              style: const TextStyle(
                fontFamily: "Montserrat",
                fontSize: 20.0,
                fontWeight: FontWeight.w500
              )
                ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 0),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.deepOrange
                    )
                ),
                child: TextButton(
                  onPressed: (){
                    final food = Food(
                        name:_controller.text,
                        price: int.parse(widget.itemPrice),
                        img: widget.imagePath
                    );
                    AddFood().addTile(food: food);
                    Navigator.of(context).pop();
                  },
                  child: Text("ADD",
                  style: TextStyle(
                      fontFamily: "Montserrat",
                      color: Colors.deepOrange
                  ),
                  )
                  ),
              ),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 12.0, bottom: 0),
          child: Text("\$" +widget.itemPrice,
          style: const TextStyle(
              fontFamily: "Montserrat",
              fontSize: 17.0,
          )),
        )


      ],
        ),
    );
  }
}
