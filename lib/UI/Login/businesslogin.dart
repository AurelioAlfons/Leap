import 'package:flutter/material.dart';
import 'package:leap/UI/Layout/dark.dart';
import 'package:leap/UI/Layout/light.dart';
import 'package:leap/UI/Layout/themeprovider.dart';

class BusinessLoginPage extends StatelessWidget {
  const BusinessLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = ThemeProvider.of(context);

    // Get screen dimensions
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.08),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: screenHeight * 0.05),

              // Highlighted Title
              Column(
                children: [
                  Text(
                    'Business Portal',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontSize: screenWidth * 0.08,
                          fontWeight: FontWeight.bold,
                          color: themeProvider.isDarkMode
                              ? DarkMode.iconColor
                              : LightMode.iconColor,
                        ),
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    'Login to your business account',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontSize: screenWidth * 0.04,
                          color: Colors.grey,
                        ),
                  ),
                ],
              ),

              SizedBox(height: screenHeight * 0.05),

              // Logo / Icon
              CircleAvatar(
                radius: screenWidth * 0.15,
                backgroundColor: Colors.transparent,
                child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('assets/icon/terno.png'),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.04),

              // Input Fields Section
              Container(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                decoration: BoxDecoration(
                  color: themeProvider.isDarkMode
                      ? DarkMode.cardColor
                      : Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: themeProvider.isDarkMode
                          ? DarkMode.shadowColor
                          : Colors.grey.withOpacity(0.5),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    // Email Field
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 16.0),
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'Business Email',
                          prefixIcon: const Icon(Icons.email),
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(screenWidth * 0.02),
                          ),
                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                    // Password Field
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 16.0),
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'Password',
                          prefixIcon: const Icon(Icons.lock),
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(screenWidth * 0.02),
                          ),
                        ),
                        obscureText: true,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: screenHeight * 0.03),

              // Business Login Button
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/business');
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(screenWidth * 0.02),
                  ),
                ),
                child: Text(
                  'Business Login',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(fontSize: screenWidth * 0.05),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),

              // "Don't have a business account? Sign Up" row
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Forgot Password?',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontSize: screenWidth * 0.04,
                            color: Colors.grey,
                          ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/signup');
                    },
                    child: Text(
                      'Sign Up',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(fontSize: screenWidth * 0.045),
                    ),
                  ),
                ],
              ),

              const SizedBox(
                height: 7,
              ),

              // Divider with "OR"
              Row(
                children: <Widget>[
                  const Expanded(child: Divider()),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      "OR",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                  const Expanded(child: Divider()),
                ],
              ),
              SizedBox(height: screenHeight * 0.04),

              // "Login through Main App" Button
              OutlinedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/');
                },
                style: OutlinedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
                  side: BorderSide(
                    color: themeProvider.isDarkMode
                        ? DarkMode.iconColor
                        : LightMode.iconColor,
                    width: 1.5,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(screenWidth * 0.02),
                  ),
                ),
                child: Text(
                  'Login through Main App',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontSize: screenWidth * 0.045,
                        color: themeProvider.isDarkMode
                            ? DarkMode.iconColor
                            : LightMode.iconColor,
                      ),
                ),
              ),

              SizedBox(height: screenHeight * 0.04),

              // Theme Toggle Button
              Center(
                child: IconButton(
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
