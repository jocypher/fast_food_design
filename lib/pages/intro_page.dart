import 'package:fast_food_app_design/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnimationPage extends StatefulWidget {
  const AnimationPage({super.key});

  @override
  State<AnimationPage> createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 5));
    super.initState();

    final curveAnimation =
    CurvedAnimation(parent: controller,
        curve: Curves.bounceIn,
        reverseCurve: Curves.easeOut);


    animation =
    Tween<double>(begin: 0, end: 1 ).animate(curveAnimation)
      ..addStatusListener((status) {
      if(status == AnimationStatus.completed){
        controller.reverse();
      } else if (status == AnimationStatus.dismissed){
        controller.forward();
      }
    });

    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SizedBox(height: 100,),
          FadeTransition(
            opacity: animation,
          child: const ProfilePage(),
          ),

          SizedBox(height: height * 0.03,),
          Text("Fresh Foods",
            style: GoogleFonts.actor(
                fontSize: 30,
                fontWeight: FontWeight.bold
            ),
          ),
          const SizedBox(height: 10,),
          Text("In particular the garbled words of",
            style: GoogleFonts.aladin(
                fontSize: 28,
                fontWeight: FontWeight.w400,
                color: Colors.grey
            ),
          ),
          Text("bear an unmistakable",
            style: GoogleFonts.aladin(fontSize: 28,
                fontWeight: FontWeight.w400,
                color: Colors.grey

            ),
          ),
          SizedBox(height: height * 0.15),
          TextButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(
                    builder: (context){
                  return const LoginPage();
                }));
              }, child: Container(
              padding: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                  color: Colors.deepOrangeAccent,
                  borderRadius: BorderRadius.circular(7),
                  boxShadow: const [BoxShadow(
                      color: Colors.deepOrangeAccent,
                      spreadRadius: 1,
                      blurRadius: 17,
                      offset: Offset(0, 15)
                  ) ] ),
              child: Text("Get Started",
                  style: GoogleFonts.aboreto(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white,
                      letterSpacing: 0.5
                  )
              )
          )

          )
        ],
      ),
    );
  }
}
class RotatingTransition extends StatelessWidget {
  const RotatingTransition({super.key, required this.angle, required this.child});

     final Animation<double> angle;
     final Widget child;
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: angle,
        child: child,
        builder: (context, child){
      return Transform.rotate(angle: angle.value, child: child,);
    });
  }
}


class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});


  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Image(
        image: AssetImage("assets/profile.png"),
      ),
    );
  }
}

