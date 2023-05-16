import 'dart:typed_data';

import 'package:fast_food_app_design/resources/auth_methods.dart';
import 'package:fast_food_app_design/utils/utils.dart';
import 'package:fast_food_app_design/widget/textfield.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import '../nav_pages/main_page1.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({
    Key? key,
  }) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  Uint8List? _image;
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
       super.dispose();
  }

  void selectImage() async {
    Uint8List im = await pickImage(ImageSource.gallery);
    setState(() {
      _image = im;
    });
  }

  void signUpUser() async {
    setState(() {
      _isLoading = true;
    });
    String res = await AuthMethods().SignUpUser(
        email: _emailController.text,
        password: _passwordController.text,
        username: _usernameController.text,
        file: _image!);
    if (res == 'success') {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const MainPage()));
      showSnackBar(res, context);
    }
    setState(() {
      _isLoading = false;
    });
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
              height: 70,
            ),
            Text('Tuk~In Sign up',
                style: GoogleFonts.aboreto(
                    fontSize: 30, color: Colors.deepOrange)),
            const SizedBox(height: 40),
            Center(
                child: Stack(
              children: [
                _image != null
                    ? CircleAvatar(
                        radius: 64, backgroundImage: MemoryImage(_image!))
                    : const CircleAvatar(
                        radius: 64,
                        backgroundImage: NetworkImage(
                            "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cGVyc29ufGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=900&q=60"),
                      ),
                Positioned(
                    bottom: -13,
                    left: 85,
                    child: IconButton(
                        onPressed: selectImage,
                        icon: const Icon(Icons.add_a_photo)))
              ],
            )),
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
                    fontSize: 18,
                    color: Colors.black,
                    fontFamily: "Montserrat"),
                prefixIcon: const Icon(
                  Icons.person,
                  color: Colors.deepOrange,
                ),
              ),
            ),
            const SizedBox(
              height: 14,
            ),
            Container(
              margin: const EdgeInsets.only(left: 30, right: 30),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  border: Border.all(color: Colors.grey)),
              child: TextFieldInput(
                textEditingController: _emailController,
                textInputType: TextInputType.emailAddress,
                hintText: "email",
                hintStyle: const TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontFamily: "Montserrat"),
                prefixIcon: const Icon(
                  Icons.email_outlined,
                  color: Colors.deepOrange,
                ),
              ),
            ),
            const SizedBox(
              height: 14,
            ),
            Container(
              margin: const EdgeInsets.only(left: 30, right: 30),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  border: Border.all(color: Colors.grey)),
              child: TextFieldInput(
                textEditingController: _passwordController,
                textInputType: TextInputType.text,
                isPassword: true,
                hintText: "password",
                hintStyle: const TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontFamily: "Montserrat"),
                prefixIcon: const Icon(
                  Icons.password,
                  color: Colors.deepOrange,
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            InkWell(
              onTap: signUpUser,
              child: Container(
                  margin: const EdgeInsets.only(left: 30, right: 30, top: 30),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: Colors.deepOrange,
                      borderRadius: BorderRadius.circular(7),
                      border: Border.all(color: Colors.white)),
                  child:  Center(
                      child: _isLoading? const Center(
                child: CircularProgressIndicator(
                  color: Colors.white),)
                  
              :const Text(
                    "Sign Up",
                    style: TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ))),
            ),
            const SizedBox(
              height: 14,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Have an account already? '),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    'Sign In',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
