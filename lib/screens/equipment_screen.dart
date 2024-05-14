import 'package:flutter/material.dart';
import 'package:mechtool_app/screens/welcome_screen.dart';

import '../Components/arrow_button.dart';
import '../Tools/Screwdriver.dart';
import 'home_screen.dart';

class EquipmentScreen extends StatefulWidget {
  const EquipmentScreen({super.key});

  static const String id = 'equipment_screen';

  @override
  State<EquipmentScreen> createState() => _EquipmentScreenState();
}

class _EquipmentScreenState extends State<EquipmentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[800],
      floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.blueAccent,
          child: const Icon(
            Icons.add_circle_outline,
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
        title: const Text("Equipment Details"),
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
                      iconImagePath: 'images/bolt.png',
                      buttonName: 'Iron Nails',
                      buttonSubName: 'Details',
                      onPressed: () {
                        Navigator.pushNamed(context, ScrewdriverTool.id);
                      }),
                  const SizedBox(
                    height: 15,
                  ),
                  ArrowButton(
                      iconImagePath: 'images/bolt.png',
                      buttonName: 'Flat Screwdriver Nails',
                      buttonSubName: 'Details',
                      onPressed: () {
                        Navigator.pushNamed(context, ScrewdriverTool.id);
                      }),
                  const SizedBox(
                    height: 15,
                  ),
                  ArrowButton(
                      iconImagePath: 'images/bolt.png',
                      buttonName: 'Phillips Screwdriver \nNails',
                      buttonSubName: 'Details',
                      onPressed: () {
                        Navigator.pushNamed(context, ScrewdriverTool.id);
                      }),
                  const SizedBox(
                    height: 15,
                  ),
                  ArrowButton(
                      iconImagePath: 'images/bolt.png',
                      buttonName: 'Wrench Nuts',
                      buttonSubName: 'Details',
                      onPressed: () {
                        Navigator.pushNamed(context, ScrewdriverTool.id);
                      }),
                  const SizedBox(
                    height: 15,
                  ),
                  ArrowButton(
                      iconImagePath: 'images/bolt.png',
                      buttonName: 'Wires',
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
