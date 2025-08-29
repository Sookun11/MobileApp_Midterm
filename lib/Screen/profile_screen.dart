import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  final String username;
  final String email;

  const ProfileScreen({super.key, required this.username, required this.email});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text("Username: $username", style: const TextStyle(fontSize: 20)),
        const SizedBox(height: 10),
        Text("Email: $email", style: const TextStyle(fontSize: 20)),
      ]),
    );
  }
}
