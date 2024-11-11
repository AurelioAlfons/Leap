import 'package:flutter/material.dart';
import 'package:leap/UI/Layout/dark.dart';
import 'package:leap/UI/Layout/light.dart';
import 'package:leap/UI/Layout/themeprovider.dart';

class SignUpPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = ThemeProvider.of(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up"),
      ),
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.05),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: screenHeight * 0.15),
              TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: "Username",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(screenWidth * 0.02),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter a username";
                  }
                  return null;
                },
              ),
              SizedBox(height: screenHeight * 0.02),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(screenWidth * 0.02),
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty || !value.contains('@')) {
                    return "Please enter a valid email";
                  }
                  return null;
                },
              ),
              SizedBox(height: screenHeight * 0.02),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(screenWidth * 0.02),
                  ),
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.length < 6) {
                    return "Password must be at least 6 characters";
                  }
                  return null;
                },
              ),
              SizedBox(height: screenHeight * 0.03),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(screenWidth * 0.02),
                  ),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Process sign-up logic here
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Signing Up...")),
                    );
                  }
                },
                child: Text(
                  "Sign Up",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(fontSize: screenWidth * 0.05),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/');
                },
                child: Text(
                  "Already have an account? Log in",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontSize: screenWidth * 0.04,
                        color: Colors.grey,
                      ),
                ),
              ),
              SizedBox(height: screenHeight * 0.1),
              IconButton(
                icon: Icon(
                  themeProvider.isDarkMode
                      ? Icons.brightness_4
                      : Icons.brightness_4_outlined,
                ),
                color: themeProvider.isDarkMode
                    ? DarkMode.iconColor
                    : LightMode.iconColor,
                onPressed: themeProvider.toggleTheme,
                tooltip: 'Toggle Theme',
                iconSize: screenWidth * 0.08, // Scales icon size
              ),
            ],
          ),
        ),
      ),
    );
  }
}
