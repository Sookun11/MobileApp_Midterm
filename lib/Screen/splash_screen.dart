import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:pos_app/Screen/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
@override
  void initState() {
    Future.delayed(Duration(seconds: 3), (){
      Navigator.pushAndRemoveUntil(context,
      //  MaterialPageRoute(builder: (context) => MainScreen()),
       MaterialPageRoute(builder: (context) => LoginScreen()),
       (route)=>false);
    });
    super.initState();
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('asset/images/loading.png', width: 150)
        
      ),
    );
  }
}