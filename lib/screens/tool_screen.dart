import 'package:flutter/material.dart';
import 'package:mechtool_app/Tools/Adjustable%20Wrench.dart';
import 'package:mechtool_app/Tools/Claw%20Hammer.dart';
import 'package:mechtool_app/Tools/Electric%20Drill.dart';
import 'package:mechtool_app/Tools/Screwdriver.dart';
import 'package:mechtool_app/Tools/Wrench.dart';
import 'package:mechtool_app/screens/welcome_screen.dart';

import '../Components/arrow_button.dart';
import 'home_screen.dart';

class ToolScreen extends StatefulWidget {
  const ToolScreen({super.key});

  static const String id = 'tool_screen';

  @override
  State<ToolScreen> createState() => _ToolScreenState();
}

class _ToolScreenState extends State<ToolScreen> {
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
        title: const Text("Tool Details"),
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
                      iconImagePath: 'images/tool-box.png',
                      buttonName: 'Claw Hammer',
                      buttonSubName: 'Details',
                      onPressed: () {
                        Navigator.pushNamed(context, ClawHammerTool.id);
                      }),
                  const SizedBox(
                    height: 15,
                  ),
                  ArrowButton(
                      iconImagePath: 'images/tool-box.png',
                      buttonName: 'Wrench',
                      buttonSubName: 'Details',
                      onPressed: () {
                        Navigator.pushNamed(context, WrenchTool.id);
                      }),
                  const SizedBox(
                    height: 15,
                  ),
                  ArrowButton(
                      iconImagePath: 'images/tool-box.png',
                      buttonName: 'Electric Drill',
                      buttonSubName: 'Details',
                      onPressed: () {
                        Navigator.pushNamed(context, ElectricDrillTool.id);
                      }),
                  const SizedBox(
                    height: 15,
                  ),
                  ArrowButton(
                      iconImagePath: 'images/tool-box.png',
                      buttonName: 'Adjustable Wrench',
                      buttonSubName: 'Details',
                      onPressed: () {
                        Navigator.pushNamed(context, AdjustableWrenchTool.id);
                      }),
                  const SizedBox(
                    height: 15,
                  ),
                  ArrowButton(
                      iconImagePath: 'images/tool-box.png',
                      buttonName: 'Screwdrivers',
                      buttonSubName: 'Details',
                      onPressed: () {
                        Navigator.pushNamed(context, ScrewdriverTool.id);
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
