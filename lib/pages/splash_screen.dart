import 'package:ajuda_5_modul_exap/pages/sign_in.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), (){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const SignIn()));
    });

    return Scaffold(
      backgroundColor: Colors.amber,
      body: Center(
        child: Image.asset('assest/images/splash_img.png'),
      ),
    );
  }
}
