// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.deepOrangeAccent,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text("Contact Us",
        style: TextStyle(
          fontFamily: "Montserrat",
          fontSize: 25
        ),),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            child: Center(
              child: Image(
                height: height * 0.30,
                image: const AssetImage("assets/contact1.jpg"),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 10, right: 10, top: 20),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey
              )
            ),
            child: const TextField(
              decoration: InputDecoration(
                hintText: "Name",
                prefixIcon: Icon(Icons.person)

              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 10, right: 10, top: 20),
            decoration: BoxDecoration(
                border: Border.all(
                    color: Colors.grey
                )
            ),
            child: const TextField(
              decoration: InputDecoration(
                  hintText: "Email",
                  prefixIcon: Icon(Icons.email_outlined)

              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 10, right: 10, top: 20),
            decoration: const BoxDecoration(
            ),
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: "Comment Section",
                prefixIcon: Icon(Icons.comment),
                hintStyle: TextStyle(
                  fontFamily: "Montserrat",
                  fontSize: 18
                )
              ),
            ),
          ),
          SizedBox(height: height * 0.03,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: const Text("You can contact us via ",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.2,
                      fontFamily: "Montserrat"
                  ),
                ),
              ),
              const SizedBox(height: 3,),
              Container(
                child: const Text("Email: arthurwilchield@gmail.com,",

                  style: TextStyle(
                      fontSize: 20,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.1,
                      fontFamily: "Montserrat"
                  ),),
              ),
              const SizedBox(height: 5,),
              Container(
                child: const Text("Mobile: 0552893284",

                  style: TextStyle(
                      fontSize: 18,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.1,
                      fontFamily: "Montserrat"
                  ),),
              ),
              Container(
                child: const Text("WhatsApp: 0595069933",
                  style: TextStyle(
                      fontSize: 18,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.1,
                      fontFamily: "Montserrat"
                  ),),
              ),
            ],
          )
        ],
      ),
    );
  }
}
