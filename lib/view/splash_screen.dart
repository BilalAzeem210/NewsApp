import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsapp/view/home_screen.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 5),(){
        Navigator.pushReplacement(context, PageTransition(child: const HomeScreen(), type: PageTransitionType.rightToLeft));

    });

  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
       body:Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           Image.asset("images/splash_pic.jpg",
           fit: BoxFit.cover,
           height: height * .5,),
           SizedBox(height: height * 0.04,),
           Text('Top Headlines',style: GoogleFonts.anton(letterSpacing: 6,color: Colors.grey.shade700),),
           SizedBox(height: height * 0.04,),
           const SpinKitRipple(
               color: Colors.black,

           size: 50,)

         ],
       )
    );
  }
}
