import 'package:fast_food_app_design/widget/textfield.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpPage extends StatefulWidget {

  const SignUpPage({Key? key,})
      : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            Text('Tuk~In Sign up',
                style: GoogleFonts.aboreto(
                    fontSize: 30, color: Colors.deepOrange)),
            const SizedBox(height: 40),
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
                  )),
              child: TextFieldInput(
                textEditingController: _usernameController, 
                textInputType: TextInputType.text, 
                hintText: "username", 
                hintStyle: const TextStyle(
                  fontSize: 18 ,
                  color: Colors.black,
                  fontFamily: "Montserrat"
                ),
                prefixIcon: const Icon(Icons.person, color: Colors.deepOrange,),
                ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.only(left: 30, right: 30),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  border: Border.all(color: Colors.grey)),
              child: TextFieldInput(
                textEditingController: _usernameController, 
                textInputType: TextInputType.text, 
                hintText: "email", 
                hintStyle: const TextStyle(
                  fontSize: 18 ,
                  color: Colors.black,
                  fontFamily: "Montserrat"
                ),
                prefixIcon: const Icon(Icons.email_outlined, color: Colors.deepOrange,),
                ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.only(left: 30, right: 30),
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  border: Border.all(color: Colors.grey)),
              child: TextFieldInput(
                textEditingController: _passwordController, 
                textInputType: TextInputType.text, 
                hintText: "password", 
                hintStyle: const TextStyle(
                  fontSize: 18 ,
                  color: Colors.black,
                  fontFamily: "Montserrat"
                ),
                prefixIcon: const Icon(Icons.password, color: Colors.deepOrange,),
                ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
                margin: const EdgeInsets.only(left: 30, right: 30, top: 30),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: Colors.deepOrange,
                    borderRadius: BorderRadius.circular(7),
                    border: Border.all(color: Colors.white)),
                child: const Center(
                    child: Text(
                  "Sign Up",
                  style: TextStyle(
                      fontFamily: "Montserrat",
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ))),
                const SizedBox(height: 16,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                   children: const [
                     Text('Have an account already? '),
                     Text('Sign In', 
                     style: TextStyle(fontWeight: FontWeight.bold),
                     )
                   ],)
          ],
        ),
      ),
      
    );
  }
}
