import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pos_app/Helper/user_manager.dart';



class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  void _togglePasswordVisibility() =>
      setState(() => _obscurePassword = !_obscurePassword);
  void _toggleConfirmPasswordVisibility() =>
      setState(() => _obscureConfirmPassword = !_obscureConfirmPassword);

  void _handleSignUp() async {
    if (_formKey.currentState!.validate()) {
      await UserManager.addUser(
        _emailController.text,
        _passwordController.text,
      );

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Registration Successful")));

      Navigator.pop(context, {
        'email': _emailController.text,
        'password': _passwordController.text,
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up"),
        backgroundColor: Colors.blue,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(24),
          children: [
            const SizedBox(height: 40),
            Text(
              "Create Account",
              style: GoogleFonts.poppins(
                color: Colors.blue,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: "Email",
                prefixIcon: Icon(Icons.alternate_email),
              ),
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null || value.isEmpty)
                  return "Please enter your email";
                if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value))
                  return "Enter a valid email";
                return null;
              },
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _phoneController,
              decoration: const InputDecoration(
                labelText: "Phone Number",
                prefixIcon: Icon(Icons.phone),
              ),
              keyboardType: TextInputType.phone,
              validator: (value) {
                if (value == null || value.isEmpty)
                  return "Please enter your phone number";
                if (!RegExp(r'^[0-9]+$').hasMatch(value))
                  return "Phone number must be numeric";
                if (value.length < 8)
                  return "Phone number must be at least 8 digits";
                return null;
              },
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _passwordController,
              obscureText: _obscurePassword,
              decoration: InputDecoration(
                labelText: "Password",
                prefixIcon: const Icon(Icons.lock),
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscurePassword ? Icons.visibility_off : Icons.visibility,
                  ),
                  onPressed: _togglePasswordVisibility,
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty)
                  return "Please enter your password";
                if (value.length < 6)
                  return "Password must be at least 6 characters";
                return null;
              },
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _confirmPasswordController,
              obscureText: _obscureConfirmPassword,
              decoration: InputDecoration(
                labelText: "Confirm Password",
                prefixIcon: const Icon(Icons.lock),
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscureConfirmPassword
                        ? Icons.visibility_off
                        : Icons.visibility,
                  ),
                  onPressed: _toggleConfirmPasswordVisibility,
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty)
                  return "Please confirm your password";
                if (value != _passwordController.text)
                  return "Passwords do not match";
                return null;
              },
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: _handleSignUp,
              child: const Text("Sign Up"),
            ),
          ],
        ),
      ),
    );
  }
}
