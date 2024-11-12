import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import './pages/loginpage.dart';
import './pages/registerpage.dart';
import './pages/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Function to check if the user is logged in
  Future<bool> _isLoggedIn() async {
    final storage = FlutterSecureStorage();
    String? accessToken = await storage.read(key: 'accessToken');
    // Check if an access token exists, indicating that the user is logged in
    return accessToken != null;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student Companion App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.white,
        scaffoldBackgroundColor: Colors.black,
      ),
      // Using a FutureBuilder to check if the user is logged in
      home: FutureBuilder<bool>(
        future: _isLoggedIn(),
        builder: (context, snapshot) {
          // If snapshot is still loading, show a loading indicator
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }

          // If the user is logged in, navigate to the homepage; otherwise, to the login page
          if (snapshot.hasData && snapshot.data == true) {
            return HomePage();
          } else {
            return LoginPage();
          }
        },
      ),
      routes: {
        '/login': (context) => LoginPage(),
        '/register': (context) => RegisterPage(),
        '/homepage': (context) => HomePage(),
      },
    );
  }
}
