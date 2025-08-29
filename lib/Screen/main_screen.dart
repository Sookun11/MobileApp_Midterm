import 'package:flutter/material.dart';
import 'package:pos_app/Screen/menu_screen.dart';
import 'package:pos_app/Screen/profile_screen.dart';
import 'package:pos_app/Screen/login_screen.dart';

class MainScreen extends StatefulWidget {
  final String email;

  const MainScreen({super.key, required this.email});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int counter = 0;
  int _currentIndex = 0;

  void decrease() => setState(() => counter--);
  void increase() => setState(() => counter++);

  @override
  Widget build(BuildContext context) {
    String username = widget.email.split('@')[0];

    Widget bodyContent;
    if (_currentIndex == 0) {
      bodyContent = Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 60),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 40),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [BoxShadow(color: Colors.blue.shade100.withOpacity(0.5), blurRadius: 10, offset: const Offset(0, 6))],
              ),
              child: Text("$counter", style: const TextStyle(fontSize: 60, fontWeight: FontWeight.bold, color: Colors.blueAccent, letterSpacing: 2)),
            ),
            const SizedBox(height: 60),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: decrease, style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent, minimumSize: const Size(80, 80), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))), child: const Icon(Icons.remove, size: 36, color: Colors.white)),
                ElevatedButton(onPressed: increase, style: ElevatedButton.styleFrom(backgroundColor: Colors.green, minimumSize: const Size(80, 80), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))), child: const Icon(Icons.add, size: 36, color: Colors.white)),
              ],
            ),
          ],
        ),
      );
    } else if (_currentIndex == 1) {
      bodyContent = ProfileScreen(username: username, email: widget.email);
    } else {
      bodyContent = MenuScreen(
        onLogout: () {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const LoginScreen()));
        },
      );
    }

    return Scaffold(
      body: bodyContent,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (value) => setState(() => _currentIndex = value),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color.fromARGB(255, 231, 157, 9),
        elevation: 2,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: "Settings"),
        ],
      ),
    );
  }
}
