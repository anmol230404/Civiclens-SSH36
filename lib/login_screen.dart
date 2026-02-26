import 'package:flutter/material.dart';
import 'auth_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  bool isLogin = true; 

  void _authenticate() async {
    String email = _emailController.text.trim();
    String password = _passController.text.trim();
    
    if (email.isEmpty || password.isEmpty) return;

    String? error;
    if (isLogin) {
      error = await AuthService().signIn(email, password);
    } else {
      error = await AuthService().signUp(email, password);
    }

    if (error != null && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F4F8),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.location_city, size: 60, color: Color(0xFF1A237E)),
            const SizedBox(height: 10),
            const Text("CivicLens", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Color(0xFF1A237E))),
            const Text("Citizen E-Governance Portal", style: TextStyle(fontSize: 14, color: Colors.grey)),
            const SizedBox(height: 40),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: "Email Address", border: OutlineInputBorder(), filled: true, fillColor: Colors.white),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _passController,
              decoration: const InputDecoration(labelText: "Password", border: OutlineInputBorder(), filled: true, fillColor: Colors.white),
              obscureText: true,
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: _authenticate,
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                backgroundColor: const Color(0xFF1A237E),
                foregroundColor: Colors.white,
              ),
              child: Text(isLogin ? "Access Portal" : "Register as Citizen"),
            ),
            TextButton(
              onPressed: () => setState(() => isLogin = !isLogin),
              child: Text(isLogin ? "Create new citizen account" : "I already have an account"),
            )
          ],
        ),
      ),
    );
  }
}