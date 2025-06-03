import 'package:first_screen/app.dart';
import 'package:first_screen/src/features/loginScreens/register_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void handleLogin() {
    String email = emailController.text;
    String password = passwordController.text;

    if (email == 'stylesphere@test.com' && password == '123456') {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login erfolgreich')),
      );

      Future.delayed(Duration(milliseconds: 500), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => Navigation()),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Willkommen zurück!",
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.pink[800]),
            ),
            SizedBox(height: 30),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'E-Mail',
                border: OutlineInputBorder(),
                fillColor: Colors.grey[100],
                filled: true,
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Passwort',
                border: OutlineInputBorder(),
                fillColor: Colors.grey[100],
                filled: true,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: handleLogin,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink[300],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 14),
              ),
              child: Text("Login", style: TextStyle(color: Colors.white)),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => RegisterScreen()));
              },
              child: Text(
                "Noch kein Konto? Hier zur Registrierung",
                style: TextStyle(
                    color: Colors.pink[700],
                    decoration: TextDecoration.underline),
              ),
            )
          ],
        ),
      ),
    );
  }
}
