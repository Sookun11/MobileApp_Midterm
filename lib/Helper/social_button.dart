import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class SocialButton extends StatelessWidget {
  final String label;
  final String imagePath;
  final VoidCallback onPressed;

  const SocialButton({
    super.key,
    required this.imagePath,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton.icon(
        icon: Image.asset(
          imagePath,
          width: 24,
          height: 24,
        ),
        label: Text(
          label,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: HexColor('#F5F9FE'),
          foregroundColor: Colors.black87,
          elevation: 2,
          padding: const EdgeInsets.symmetric(vertical: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
