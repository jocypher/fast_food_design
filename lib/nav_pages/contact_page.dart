import 'package:flutter/material.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width= MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.deepOrangeAccent,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text("Contact Us",
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
                image: AssetImage("assets/contact1.jpg"),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10, right: 10, top: 20),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey
              )
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Name",
                prefixIcon: Icon(Icons.person)

              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10, right: 10, top: 20),
            decoration: BoxDecoration(
                border: Border.all(
                    color: Colors.grey
                )
            ),
            child: TextField(
              decoration: InputDecoration(
                  hintText: "Email",
                  prefixIcon: Icon(Icons.email_outlined)

              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10, right: 10, top: 20),
            decoration: BoxDecoration(
            ),
            child: TextFormField(
              decoration: InputDecoration(
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
                child: Text("You can contact us via ",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.2,
                      fontFamily: "Montserrat"
                  ),
                ),
              ),
              SizedBox(height: 3,),
              Container(
                child: Text("Email: arthurwilchield@gmail.com,",

                  style: TextStyle(
                      fontSize: 20,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.1,
                      fontFamily: "Montserrat"
                  ),),
              ),
              SizedBox(height: 5,),
              Container(
                child: Text("Mobile: 0552893284",

                  style: TextStyle(
                      fontSize: 18,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.1,
                      fontFamily: "Montserrat"
                  ),),
              ),
              Container(
                child: Text("WhatsApp: 0595069933",
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
