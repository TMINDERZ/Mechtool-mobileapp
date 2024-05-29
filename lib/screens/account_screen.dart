import 'package:flutter/material.dart';
import 'package:mechtool_app/screens/home_screen.dart';
import 'package:mechtool_app/screens/welcome_screen.dart';

import 'login_screen.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  static const String id = 'account_screen';

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[800],
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, HomeScreen.id);
          },
          backgroundColor: Colors.blueAccent,
          child: const Icon(
            Icons.image_search_outlined,
            size: 20,
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.blue[700],
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, HomeScreen.id);
              },
              icon: Icon(
                Icons.home,
                size: 32,
                color: Colors.blue[200],
              ),
            ),
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, HomeScreen.id);
                },
                icon: Icon(
                  Icons.arrow_back,
                  size: 32,
                  color: Colors.blue[200],
                )),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // Logo with white box
            Center(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16.0),
                ),
                padding: EdgeInsets.all(16.0),
                child: Image.asset(
                  'images/logo.png', // Ensure you have a logo image at this path
                  height: 150.0,
                ),
              ),
            ),
            SizedBox(height: 16.0),
            // Description
            Text(
              'MECHTOOL',
              style: TextStyle(
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16.0),
            Text(
              'Welcome to MECHTOOL, the user-friendly mobile application that helps you identify mechanical hand tools and equipment using artificial intelligence and image recognition. Empower yourself to work faster, smarter, and safer with MECHTOOL!',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 32.0),
            Text(
              'Developed by Minidu Tharinda', // Replace [Your Name] with your actual name
              style: TextStyle(
                fontSize: 18.0,
                fontStyle: FontStyle.italic,
                color: Colors.grey[300],
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
