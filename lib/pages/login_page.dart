import 'package:fast_food_app_design/nav_pages/main_page1.dart';
import 'package:fast_food_app_design/pages/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
      body: SingleChildScrollView(
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
              const SizedBox(height: 40,),
              Text('Tuk~In Login', style: 
              GoogleFonts.aboreto(fontSize: 30,
              color: Colors.deepOrange
              )
              ), 
              const SizedBox(height: 40,),
              const Center(
                child: Image(
                  image: AssetImage("assets/profile.png"),
                ),
              ),
              const SizedBox(height: 25,),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: Container(
                  padding: const EdgeInsets.all(7),
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
                      hintText: "Email",
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
                padding: const EdgeInsets.all(7),
                margin: const EdgeInsets.only(left: 30, right: 30),
                decoration: BoxDecoration(
                  
                  borderRadius: BorderRadius.circular(7),
                    border: Border.all(
                        color: Colors.grey
                    )
                ),
                child: const TextField(
                  obscureText: true,
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.password,
                    
                    color: Colors.deepOrange,),
                      hintText: "Password",
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
                  padding: const EdgeInsets.all(20),
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
              const Text('Click the arrow below to navigate to sign up')
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context,
              PageRouteBuilder(
                transitionDuration: const Duration(seconds: 1),
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
