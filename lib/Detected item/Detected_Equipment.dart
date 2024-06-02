import 'package:flutter/material.dart';
import 'package:mechtool_app/Equipments/Iron%20Nails.dart';
import 'package:mechtool_app/Equipments/Wrench%20Nuts.dart';
import 'package:mechtool_app/Safety%20Guide/Adjustable%20Wrench%20Safety.dart';
import 'package:mechtool_app/Safety%20Guide/Claw%20Hammer%20Safety.dart';
import 'package:mechtool_app/Safety%20Guide/Wrench%20Safety.dart';
import 'package:mechtool_app/Tools/Adjustable%20Wrench.dart';
import 'package:mechtool_app/Tools/Claw%20Hammer.dart';
import 'package:mechtool_app/Tools/Wrench.dart';
import 'package:mechtool_app/screens/tool_detection.dart';

import '../Components/tool_button.dart';
import '../screens/store_location.dart';
import '../screens/welcome_screen.dart';

class Equipment {
  final String name;
  final String subname;
  final String description;
  final String imageUrl;
  final String safety;
  final String tool;

  Equipment({
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.subname,
    required this.safety,
    required this.tool,
  });
}

class DetectedEquipment extends StatefulWidget {
  const DetectedEquipment({super.key});

  static const String id = 'equipment_tool';

  @override
  State<DetectedEquipment> createState() => _DetectedEquipmentState();
}

class _DetectedEquipmentState extends State<DetectedEquipment> {
  late Equipment detectedEquipment;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final String? label = ModalRoute.of(context)!.settings.arguments as String?;
    if (label != null) {
      detectedEquipment = fetchEquipmentDetails(label);
    } else {
      detectedEquipment = Equipment(
        name: 'Unknown Tool',
        description: 'No details available.',
        imageUrl: 'images/unknown.jpg',
        subname: 'Unknown',
        safety: 'Unknown',
        tool: 'Unknown',
      );
    }
  }

  Equipment fetchEquipmentDetails(String classification) {
    Map<String, Equipment> toolDetails = {
      'Iron Nails': Equipment(
        name: 'Iron Nails',
        subname: 'Claw Hammer Nails',
        description:
            'Claw hammer nails, commonly referred to as common nails or wire nails, are optimized for use with a claw hammer and are widely utilized in a variety of carpentry and construction projects. These nails are characterized by a thick shank and a flat, wide head that provides a large striking surface, making them easy to drive into wood with a few firm hammer blows. The opposite end of the nail, which is sharp and pointed, allows for easy insertion and reduces wood splitting.',
        imageUrl: 'images/in.jpg',
        safety: ClawHammerSafety.id,
        tool: ClawHammerTool.id,
      ),
      'Wrench Nuts': Equipment(
        name: 'Wrench Nuts',
        subname: 'Iron Nuts',
        description:
            'Wrench nuts, often referred to as hex nuts, are designed for tightening and loosening with various wrenches, including adjustable and fixed wrenches. These nuts feature a hexagonal exterior, offering multiple flat sides that a wrench can easily grip to apply torque. The hexagonal shape ensures that the force is evenly distributed around the perimeter of the nut, enhancing the efficiency of adjustments.',
        imageUrl: 'images/wn.jpg',
        safety: WrenchSafety.id,
        tool: WrenchTool.id,
      ),
    };

    return toolDetails[classification] ??
        Equipment(
          name: 'Unknown Tool',
          subname: 'Unknown',
          description: 'No details available.',
          imageUrl: 'images/picture.jpg',
          safety: 'Unknown',
          tool: 'Unknown',
        );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.blue[800],
      floatingActionButton: FloatingActionButton(
          onPressed: () {},
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
                  Navigator.pushNamed(context, ToolDetection.id);
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
        title: const Text("Detected Equipment"),
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
                              detectedEquipment.imageUrl,
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            detectedEquipment.name,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 27,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                detectedEquipment.subname,
                                style: const TextStyle(
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
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            const Center(
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
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              detectedEquipment.description,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                              ),
                              textAlign: TextAlign.justify,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
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
                    const SizedBox(height: 25),
                    // 3 Buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //Tool detection button
                        ToolButton(
                          iconImagePath: 'images/worker.png',
                          buttonText: 'SAFETY\nGUIDE',
                          onPressed: () {
                            Navigator.pushNamed(
                                context, detectedEquipment.safety);
                          },
                        ),

                        //Tools Details button
                        ToolButton(
                          iconImagePath: 'images/tool-box.png',
                          buttonText: 'TOOL\nDETAILS',
                          onPressed: () {
                            Navigator.pushNamed(
                                context, detectedEquipment.tool);
                          },
                        ),
                        //Safety Guide button
                        ToolButton(
                          iconImagePath: 'images/store.png',
                          buttonText: 'STORE\nLOCATION',
                          onPressed: () {
                            Navigator.pushNamed(context, StoreLocation.id);
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 25),
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
