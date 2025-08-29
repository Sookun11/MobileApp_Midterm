import 'package:flutter/material.dart';
import 'package:pos_app/Screen/login_screen.dart';

class MenuScreen extends StatelessWidget {
  final VoidCallback onLogout;

  const MenuScreen({super.key, required this.onLogout});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          onLogout();
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const LoginScreen()));
        },
        child: const Text("Logout"),
      ),
    );
  }
}
