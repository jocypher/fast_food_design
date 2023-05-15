import 'package:fast_food_app_design/pages/signup_page.dart';
import 'package:fast_food_app_design/widget/textfield.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            Text('Tuk~In Login',
                style: GoogleFonts.aboreto(
                    fontSize: 30, color: Colors.deepOrange)),
            const SizedBox(
              height: 40,
            ),
            const Center(
              child: Image(
                image: AssetImage("assets/profile.png"),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            // Email box
            Container(
              margin: const EdgeInsets.only(left: 30, right: 30),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  border: Border.all(color: Colors.grey)),
              child: TextFieldInput(
                textEditingController: _emailController,
                textInputType: TextInputType.text,
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
              height: 12,
            ),
            Container(
                margin: const EdgeInsets.only(left: 30, right: 30, top: 30),
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                    color: Colors.deepOrange,
                    borderRadius: BorderRadius.circular(7),
                    border: Border.all(color: Colors.white)),
                child: const Center(
                    child: Text(
                  "Log In",
                  style: TextStyle(
                      fontFamily: "Montserrat",
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ))),
            const SizedBox(
              height: 16,
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Don\'t have an account ? '),
                    InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const SignUpPage();
                        }));
                      },
                      child: const Text(
                        'Sign up',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
