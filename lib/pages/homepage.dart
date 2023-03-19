import 'package:fast_food_app_design/component/food_item_tile.dart';
import 'package:fast_food_app_design/nav_pages/contact_page.dart';
import 'package:fast_food_app_design/nav_pages/search_page.dart';
import 'package:flutter/material.dart';



class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}



class _HomePageState extends State<HomePage> {


  final List _shopItems = [
    ["Burger", "30", "assets/burger.jpg", Colors.white],
    ["Pizza", "44","assets/pizza.jpg", Colors.white],
    ["Fruits", "44","assets/fruits.jpg", Colors.white],
    ["Fruits", "10","assets/avocado.png", Colors.green],
    ["Fruits", "10","assets/chicken.png", Colors.brown],
    ["Fruits", "10","assets/water.png", Colors.blue],
    ["Fruits", "10","assets/banana.png", Colors.yellow]
  ];




  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.deepOrangeAccent,
          title: const Text("Home"),
          actions: [
            IconButton(onPressed: (){}, icon: const Icon(Icons.favorite_outline_outlined)),
            IconButton(onPressed: (){}, icon: const Icon(Icons.shopping_cart_outlined))
          ],
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              Container(
                color: Colors.deepOrangeAccent,
                child: DrawerHeader(
                  child: Column(
                    children: [
                      Center(
                        child: Container(

                          margin: const EdgeInsets.only(top: 20,),
                          decoration: const BoxDecoration(color: Colors.black, shape: BoxShape.circle),
                          child: ClipOval(
                            child: SizedBox.fromSize(
                              size: const Size.fromRadius(30), // Image radius
                              child: Image.asset('assets/profile.jpg', fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Text("Jonathan .W. Arthur",
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontFamily: "Montserrat"
                        ),),
                      const Text("arthurwilchield@gmail.com",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontFamily: "Montserrat"))
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20,),
              ListTile(
                leading: const Icon(Icons.home, color: Colors.black,size: 30,),
                title: GestureDetector(
                  onTap: (){
                    Navigator.of(context).pop();
                  },
                  child: const Text("Home",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontFamily: "Montserrat"
                    ),
                  ),
                ),
              ),
              const ListTile(
                leading: Icon(Icons.add_alert_outlined,color: Colors.black,size: 30,),
                title: Text("Notification",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontFamily: "Montserrat"
                  ),),
              ),
              ListTile(
                leading: const Icon(Icons.search_outlined,color: Colors.black,size: 30,),
                title: GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return const SearchPage();
                    }));
                  },
                  child: const Text("Search",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontFamily: "Montserrat"
                    ),),
                ),
              ),

              const ListTile(
                leading: Icon(Icons.credit_card,color: Colors.black,size: 30,),
                title: Text("Payments",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontFamily: "Montserrat"
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.phone,color: Colors.black,size: 30,),
                title: GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return const ContactPage();
                    }));
                  },
                  child: const Text("Contacts",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontFamily: "Montserrat"
                    ),
                  ),
                ),
              ),
              const ListTile(
                leading: Icon(Icons.info_outline,color: Colors.black,size: 30,),
                title: Text("Info",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontFamily: "Montserrat"
                  ),
                ),
              ),
            ],
          ),

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
                    itemBuilder: (context,index){
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(23),
                        image: const DecorationImage(
                          image: AssetImage("assets/index.jpeg"),
                          fit: BoxFit.cover
                        )
                      ),
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
                    color: Colors.grey,
                    style: BorderStyle.solid
                  )
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: "Search Product...",
                    hintStyle: TextStyle(
                      fontFamily: "Montserrat",
                      fontSize: 18
                    ),
                    prefixIcon: Icon(Icons.search_outlined)
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              Container(
                margin: const EdgeInsets.only(left: 10),
                child: const Text("All Products",
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.bold
                ),
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
                        decoration: BoxDecoration(color: Colors.grey[400], shape: BoxShape.circle),
                        child: ClipOval(
                          child: SizedBox.fromSize(
                            size: const Size.fromRadius(30), // Image radius
                            child: Image.asset('assets/fruits.jpg', fit: BoxFit.cover),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(2),
                        margin: const EdgeInsets.only(right: 7),
                        decoration: BoxDecoration(color: Colors.grey[400], shape: BoxShape.circle),
                        child: ClipOval(
                          child: SizedBox.fromSize(
                            size: const Size.fromRadius(30), // Image radius
                            child: Image.asset('assets/fruits.jpg', fit: BoxFit.cover),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(2),
                        margin: const EdgeInsets.only(right: 7),
                        decoration: BoxDecoration(color: Colors.grey[400], shape: BoxShape.circle),
                        child: ClipOval(
                          child: SizedBox.fromSize(
                            size: const Size.fromRadius(30), // Image radius
                            child: Image.asset('assets/fruits.jpg', fit: BoxFit.cover),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(2),
                        margin: const EdgeInsets.only(right: 7),
                        decoration: BoxDecoration(color: Colors.grey[400], shape: BoxShape.circle),
                        child: ClipOval(
                          child: SizedBox.fromSize(
                            size: const Size.fromRadius(30), // Image radius
                            child: Image.asset('assets/fruits.jpg', fit: BoxFit.cover),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(2),
                        margin: const EdgeInsets.only(right: 7),
                        decoration: BoxDecoration(color:Colors.grey[400], shape: BoxShape.circle),
                        child: ClipOval(
                          child: SizedBox.fromSize(
                            size: const Size.fromRadius(30), // Image radius
                            child: Image.asset('assets/fruits.jpg', fit: BoxFit.cover),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(2),
                        margin: const EdgeInsets.only(right: 7),
                        decoration: BoxDecoration(color: Colors.grey[400], shape: BoxShape.circle),
                        child: ClipOval(
                          child: SizedBox.fromSize(
                            size: const Size.fromRadius(30), // Image radius
                            child: Image.asset('assets/fruits.jpg', fit: BoxFit.cover),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(2),
                        margin: const EdgeInsets.only(right: 7),
                        decoration: BoxDecoration(color: Colors.grey[400], shape: BoxShape.circle),
                        child: ClipOval(
                          child: SizedBox.fromSize(
                            size: const Size.fromRadius(30), // Image radius
                            child: Image.asset('assets/fruits.jpg', fit: BoxFit.cover),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10,),
              Container(
                margin: const EdgeInsets.only(left: 10),
                child: const Text("Most Popular",
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
              const SizedBox(height: 10,),
                  Container( margin: const EdgeInsets.symmetric(horizontal: 5),
                    child: GridView.builder(
                      shrinkWrap: true,
                      itemCount: _shopItems.length,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10),
                        itemBuilder: (context, index){
                          return
                            Container(
                              child: FoodItemTile(
                                  itemName: _shopItems[index][0],
                                  itemPrice: _shopItems[index][1],
                                  imagePath: _shopItems[index][2],
                                  color: _shopItems[index][3],
                              ),
                            );
                        })
                  )




            ],
          ),
        ),
      ),

    );
  }
}
