import 'package:flutter/material.dart';
import 'package:mechtool_app/Safety%20Guide/Screwdriver%20Safety.dart';
import 'package:mechtool_app/screens/equipment_screen.dart';

import '../screens/tool_screen.dart';
import '../screens/welcome_screen.dart';

class FlatScrewdriverNailEquipment extends StatefulWidget {
  const FlatScrewdriverNailEquipment({super.key});

  static const String id = 'flat_screwdriver_nails';

  @override
  State<FlatScrewdriverNailEquipment> createState() =>
      _FlatScrewdriverNailEquipmentState();
}

class _FlatScrewdriverNailEquipmentState
    extends State<FlatScrewdriverNailEquipment> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.blue[800],
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, ScrewdriverSafety.id);
          },
          backgroundColor: Colors.blueAccent,
          child: const Icon(
            Icons.health_and_safety_outlined,
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
                  Navigator.pushNamed(context, EquipmentScreen.id);
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
        title: const Text("Flat Screwdriver Nails"),
        backgroundColor: Colors.blue[800],
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        SizedBox(
                          width: width,
                          height: width,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: Image.asset(
                              "images/flat.jpg",
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Nails",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 27,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Flat Head",
                                style: TextStyle(
                                    color: Colors.white70, fontSize: 18),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.lightBlue,
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Container(
                        margin: EdgeInsets.only(
                          bottom: height * 0.1,
                        ),
                        padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                        width: width,
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Center(
                              child: Text(
                                "Equipment Details",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Flat screwdriver nails, also known as slotted nails, are designed for specific applications where they can be driven or removed using a flat screwdriver. These nails feature a distinctive head with a horizontal slot, compatible with the tip of a flat screwdriver, allowing for effective torque application. The heads are broader and flatter than standard nails, providing a substantial contact area for the screwdriver and ensuring a firm grip during use. Commonly utilized in decorative or non-structural applications, flat screwdriver nails are often chosen for cabinetry, finish carpentry, and crafts where the nail head's appearance contributes aesthetically to the project.",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                              ),
                              textAlign: TextAlign.justify,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "YOU SHOULD CHECK SAFETY INSTRUCTIONS FOR SAFE USE.",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
