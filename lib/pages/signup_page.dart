import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  final Animation<double> transitionAnimation;
  const SignUpPage({
    Key? key,
    required this.transitionAnimation
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: AnimatedBuilder(
          animation: transitionAnimation,
          builder: (context, child){
            return SlideTransition(
              position: Tween<Offset>(
                    begin: const Offset(0,1),
                  end: const Offset(0,0)
                ).animate(
                    CurvedAnimation(
                    parent: transitionAnimation,
                    curve: const Interval(0,0.5,curve: Curves.easeInCubic )
                    )
                ),
              child: child
            );
          },
          child: Column(
            children: [
              const SizedBox(height: 80),
              const Center(
                child: Image(
                  image: AssetImage("assets/profile.png"),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.only(left: 30, right: 30),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    border: Border.all(
                      color: Colors.grey,
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
                          fontFamily: "Montserrat"
                      )
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              Container(
                margin: const EdgeInsets.only(left: 30, right: 30),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    border: Border.all(
                        color: Colors.grey
                    )
                ),
                child: const TextField(
                  textInputAction: TextInputAction.next,
                  obscureText: true,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.password,
                        color: Colors.deepOrange,),
                      hintText: "Password",
                      hintStyle: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontFamily: "Montserrat"
                      )
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              Container(
                margin: const EdgeInsets.only(left: 30, right: 30),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    border: Border.all(
                        color: Colors.grey
                    )
                ),
                child: const TextField(
                  textInputAction: TextInputAction.done,
                  obscureText: true,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.password,
                        color: Colors.deepOrange,),
                      hintText: "Re-enter Password",
                      hintStyle: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontFamily: "Montserrat"
                      )
                  ),
                ),
              ),
              const SizedBox(height: 30,),
              Container(
                  margin: const EdgeInsets.only(left: 30, right: 30, top: 30),
                  padding: const EdgeInsets.all(17),
                  decoration: BoxDecoration(
                      color: Colors.deepOrange,
                      borderRadius: BorderRadius.circular(7),
                      border: Border.all(
                          color: Colors.white
                      )
                  ),
                  child: const Center(
                      child: Text("Sign Up",
                        style: TextStyle(
                            fontFamily: "Montserrat",
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                        ),)
                  )
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: (){
            Navigator.of(context).pop();
          }, label: const Text("Navigate back")
      ),
    );
  }
}
