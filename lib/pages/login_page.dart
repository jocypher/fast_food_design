import 'package:fast_food_app_design/nav_pages/main_page1.dart';
import 'package:fast_food_app_design/pages/signup_page.dart';
import 'package:flutter/material.dart';
class LoginPage extends StatefulWidget {
   final Animation<double> transitionAnimation;
  const LoginPage({
    Key? key,
    required this.transitionAnimation}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: (){
            Navigator.of(context).pop();
          },
          child: const Icon(Icons.arrow_back,
          size: 35,),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: AnimatedBuilder(
          animation: widget.transitionAnimation,

          builder: (context, child){
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1,0), end: const Offset(0, 0)).animate(
                CurvedAnimation(parent: widget.transitionAnimation, curve:
                const Interval(0, 0.5, curve: Curves.easeIn)
                ),
            ),
              child: child

            );
          },
          child: Column(

            children: [
              const SizedBox(height: 80,),
              const Center(
                child: Image(
                  image: AssetImage("assets/profile.png"),
                ),
              ),
              const SizedBox(height: 25,),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Container(
                  margin: const EdgeInsets.only(left: 30, right: 30),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    border: Border.all(
                      color: Colors.grey,
                    )

                  ),
                  child: const TextField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                        prefixIcon: Icon(Icons.person,
                        color: Colors.deepOrange,),
                      hintText: "Username",
                        hintStyle: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontFamily: "Montserrat"
                        )
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 30, right: 30),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                    border: Border.all(
                        color: Colors.grey
                    )
                ),
                child: const TextField(
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.email_outlined,
                    color: Colors.deepOrange,),
                      hintText: "Email",
                    hintStyle: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontFamily: "Montserrat",
                    )
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return const MainPage();
                  }));
                },
                child: Container(
                  margin: const EdgeInsets.only(left: 30, right: 30, top: 30),
                  padding: const EdgeInsets.all(17),
                  decoration: BoxDecoration(
                    color: Colors.deepOrange,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: Colors.white
                      )
                  ),
                  child: const Center(
                      child: Text("Login",
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                      ),)
                  )
                ),
              ),
              const SizedBox(height: 15,),
             const Padding(
               padding: EdgeInsets.symmetric(horizontal: 15.0),
               child: Divider(
                 thickness: 2,
               ),
             ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context,
              PageRouteBuilder(
                transitionDuration: const Duration(seconds: 2),
                  pageBuilder: (context, animation, secondaryAnimation){
            return SignUpPage(
              transitionAnimation: animation,
            );
          }));
        },
        child: const Icon(
          Icons.keyboard_arrow_right_outlined,
        ),
      ),
    );
  }
}
