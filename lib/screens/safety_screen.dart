import 'package:flutter/material.dart';
import 'package:mechtool_app/Safety%20Guide/Adjustable%20Wrench%20Safety.dart';
import 'package:mechtool_app/Safety%20Guide/Claw%20Hammer%20Safety.dart';
import 'package:mechtool_app/Safety%20Guide/Electric%20Drill%20Safety.dart';
import 'package:mechtool_app/Safety%20Guide/Screwdriver%20Safety.dart';
import 'package:mechtool_app/Safety%20Guide/Wrench%20Safety.dart';
import 'package:mechtool_app/screens/welcome_screen.dart';

import '../Components/arrow_button.dart';
import '../Tools/Screwdriver.dart';
import 'home_screen.dart';

class SafetyScreen extends StatefulWidget {
  const SafetyScreen({super.key});

  static const String id = 'safety_screen';

  @override
  State<SafetyScreen> createState() => _SafetyScreenState();
}

class _SafetyScreenState extends State<SafetyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[800],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.blue[700],
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, WelcomeScreen.id);
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
      appBar: AppBar(
        //Safety Guide
        title: const Text("Safety Guide"),
        backgroundColor: Colors.blue[800],
        centerTitle: true,
      ),
      //Store Location
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              Column(
                children: [
                  ArrowButton(
                      iconImagePath: 'images/worker.png',
                      buttonName: 'Claw Hammer',
                      buttonSubName: 'Guide',
                      onPressed: () {
                        Navigator.pushNamed(context, ClawHammerSafety.id);
                      }),
                  const SizedBox(
                    height: 15,
                  ),
                  ArrowButton(
                      iconImagePath: 'images/worker.png',
                      buttonName: 'Wrench',
                      buttonSubName: 'Guide',
                      onPressed: () {
                        Navigator.pushNamed(context, WrenchSafety.id);
                      }),
                  const SizedBox(
                    height: 15,
                  ),
                  ArrowButton(
                      iconImagePath: 'images/worker.png',
                      buttonName: 'Electric Drill',
                      buttonSubName: 'Guide',
                      onPressed: () {
                        Navigator.pushNamed(context, ElectricDrillSafety.id);
                      }),
                  const SizedBox(
                    height: 15,
                  ),
                  ArrowButton(
                      iconImagePath: 'images/worker.png',
                      buttonName: 'Adjustable Wrench',
                      buttonSubName: 'Guide',
                      onPressed: () {
                        Navigator.pushNamed(context, AdjustableWrenchSafety.id);
                      }),
                  const SizedBox(
                    height: 15,
                  ),
                  ArrowButton(
                      iconImagePath: 'images/worker.png',
                      buttonName: 'Screwdrivers',
                      buttonSubName: 'Guide',
                      onPressed: () {
                        Navigator.pushNamed(context, ScrewdriverSafety.id);
                      }),
                ],
              )
            ],
          ),
        ),
      ),
      //Stores
    );
  }
}
