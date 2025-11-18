import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:football_shop/screens/login.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(title: const Text('Register'), backgroundColor: const Color(0xFF388E3C), foregroundColor: Colors.white),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Create Account", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
             const SizedBox(height: 20),
            TextField(controller: _usernameController, decoration: const InputDecoration(labelText: "Username", border: OutlineInputBorder())),
            const SizedBox(height: 12),
            TextField(controller: _passwordController, obscureText: true, decoration: const InputDecoration(labelText: "Password", border: OutlineInputBorder())),
            const SizedBox(height: 12),
            TextField(controller: _confirmPasswordController, obscureText: true, decoration: const InputDecoration(labelText: "Confirm Password", border: OutlineInputBorder())),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF388E3C), foregroundColor: Colors.white, minimumSize: const Size.fromHeight(50)),
              onPressed: () async {
                  String username = _usernameController.text;
                  String password = _passwordController.text;
                  String confirmPassword = _confirmPasswordController.text;

                  // CHANGE TO YOUR DEPLOYMENT URL
                  final response = await request.postJson(
                    "http://127.0.0.1:8000/register-ajax/",
                    jsonEncode({
                      "username": username,
                      "password": password,
                      "password_confirm": confirmPassword, // Key matches our new Django view
                    }),
                  );

                  if (response['status'] == 'success') {
                    if(context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Registration success!")));
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginPage()));
                    }
                  } else {
                    if(context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(response['message'])));
                    }
                  }
              },
              child: const Text("Register"),
            )
          ],
        ),
      ),
    );
  }
}