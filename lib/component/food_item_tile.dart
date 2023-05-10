import 'package:fast_food_app_design/nav_pages/history.dart';
import 'package:flutter/material.dart';

class Food {
  final String name;
  final int price;
  final String img;

  Food({required this.name, required this.price, required this.img});
}

class AddFood extends ValueNotifier<List<Food>> {
  AddFood._sharedInstance() : super([]);
  static final AddFood _shared = AddFood._sharedInstance();
  factory AddFood() => _shared;
  int get length => value.length;

  void addTile({required Food food}) {
    value.add(food);
    notifyListeners();
  }

  void removeTile({required Food food}) {
    value.remove(food);
    notifyListeners();
  }

  String calculateTotal() {
    double totalPrice = 0;
    for (int i = 0; i < value.length; i++) {
      totalPrice += double.parse((value[i].price).toString());
    }
    return totalPrice.toStringAsFixed(2);
  }

  Food? food({required int atIndex}) =>
      value.length > atIndex ? value[atIndex] : null;
}

class FoodItemTile extends StatefulWidget {
  final String itemName;
  final String itemPrice;
  final String imagePath;

  const FoodItemTile({
    super.key,
    required this.itemName,
    required this.itemPrice,
    required this.imagePath,
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
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            widget.imagePath,
            height: 110,
            width: 180,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Text(widget.itemName,
                    style: const TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500)),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, top: 0),
                child: TextButton(
                    onPressed: () {
                      final food = Food(
                          name: widget.itemName,
                          price: int.parse(widget.itemPrice),
                          img: widget.imagePath);
                      AddFood().addTile(food: food);
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return const HistoryPage();
                      }));
                    },
                    child: const Text(
                      "ADD",
                      style: TextStyle(
                          fontFamily: "Montserrat", color: Colors.deepOrange),
                    )),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 12.0,
            ),
            child: Text("\$${widget.itemPrice}",
                style: const TextStyle(
                  fontFamily: "Montserrat",
                  fontSize: 15.0,
                )),
          )
        ],
      ),
    );
  }
}
