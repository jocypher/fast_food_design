import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fast_food_app_design/nav_pages/contact_page.dart';
import 'package:fast_food_app_design/nav_pages/main_page1.dart';
import 'package:fast_food_app_design/pages/login_page.dart';
import 'package:fast_food_app_design/resources/auth_methods.dart';
import 'package:fast_food_app_design/utils/utils.dart';
import 'package:flutter/material.dart';

class MyPage extends StatefulWidget {
  final String uid;
  const MyPage({Key? key, required this.uid}) : super(key: key);

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  var userData = {};

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    try {
      var userSnap = await FirebaseFirestore.instance
          .collection("users")
          .doc(widget.uid)
          .get();

      userData = userSnap.data()!;
    } catch (err) {
      showSnackBar(err.toString(), context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) {
                        return const MainPage();
                      }));
                    },
                    icon: const Icon(Icons.arrow_back_ios_new_outlined)),
                const SizedBox(
                  width: 70,
                ),
                const Text(
                  "My Account",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 27),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              color: Colors.deepOrangeAccent,
              height: 170,
              child: Column(
                children: [
                  Center(
                    child: Container(
                      margin: const EdgeInsets.only(top: 20),
                      decoration: const BoxDecoration(
                          color: Colors.black, shape: BoxShape.circle),
                      child: ClipOval(
                        child: SizedBox.fromSize(
                          size: const Size.fromRadius(30), // Image radius
                          child: Image.network(
                            userData['photoUrl'],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                   Text(
                    userData['username'],
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Montserrat"),
                  ),
                   Text(userData['email'],
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontFamily: "Montserrat"))
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: ListView(
                shrinkWrap: true,
                children: [
                  const ListTile(
                    title: Text(
                      "Account Settings",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: "Montserrat",
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                  const ListTile(
                    title: Text(
                      "Notifications",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: "Montserrat",
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                  ListTile(
                    title: GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const ContactPage();
                        }));
                      },
                      child: const Text(
                        "Contact us",
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: "Montserrat",
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios),
                  ),
                  const ListTile(
                    title: Text(
                      "Privacy Policy",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: "Montserrat",
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                  const ListTile(
                    title: Text(
                      "Delete account",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: "Montserrat",
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () async {
                await AuthMethods().LogOutUser();
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => LoginPage()));
              },
              child: Container(
                padding: const EdgeInsets.only(
                    top: 15, bottom: 15, left: 100, right: 100),
                decoration: BoxDecoration(
                    color: Colors.deepOrangeAccent,
                    borderRadius: BorderRadius.circular(30)),
                child: const Text(
                  "Log Out",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontFamily: "Montserrat"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
