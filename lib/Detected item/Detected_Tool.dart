import 'package:flutter/material.dart';
import 'package:mechtool_app/Equipments/Wrench%20Nuts.dart';
import 'package:mechtool_app/Safety%20Guide/Adjustable%20Wrench%20Safety.dart';
import 'package:mechtool_app/Safety%20Guide/Claw%20Hammer%20Safety.dart';
import 'package:mechtool_app/Equipments/Iron%20Nails.dart';
import 'package:mechtool_app/Safety%20Guide/Electric%20Drill%20Safety.dart';
import 'package:mechtool_app/Safety%20Guide/Screwdriver%20Safety.dart';
import 'package:mechtool_app/Safety%20Guide/Wrench%20Safety.dart';

import 'package:mechtool_app/screens/store_location.dart';
import 'package:mechtool_app/screens/tool_detection.dart';

import '../Components/tool_button.dart';
import '../Equipments/Cables.dart';
import '../Equipments/Phillips Screwdriver nails.dart';
import '../screens/welcome_screen.dart';

class Tool {
  final String name;
  final String subname;
  final String description;
  final String imageUrl;
  final String safety;
  final String equipment;

  Tool({
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.subname,
    required this.safety,
    required this.equipment,
  });
}

class DetectedTool extends StatefulWidget {
  const DetectedTool({super.key});

  static const String id = 'detected_tool';

  @override
  State<DetectedTool> createState() => _DetectedToolState();
}

class _DetectedToolState extends State<DetectedTool> {
  late Tool detectedTool;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final String? label = ModalRoute.of(context)!.settings.arguments as String?;
    if (label != null) {
      detectedTool = fetchToolDetails(label);
    } else {
      detectedTool = Tool(
        name: 'Unknown Tool',
        description: 'No details available.',
        imageUrl: 'images/picture.png',
        subname: 'Unknown',
        safety: '',
        equipment: '',
      );
    }
  }

  Tool fetchToolDetails(String classification) {
    Map<String, Tool> toolDetails = {
      'Electric Drill': Tool(
        name: 'Electric Drill',
        subname: 'Hand Drill',
        description:
            'An electric drill is a versatile power tool used for drilling holes and driving screws. It can be corded or cordless and comes with variable speed settings and reversible rotation. Different drill bits are used for materials like wood, metal, plastic, and masonry. Modern electric drills often include features like built-in lights, ergonomic handles, and keyless chucks for easy bit changes.',
        imageUrl: 'images/elec.jpeg',
        safety: ElectricDrillSafety.id,
        equipment: PhillipsScrewdriverNailsEquipment.id,
      ),
      'Screwdriver': Tool(
        name: 'Screwdriver',
        subname: 'Flat Head / Phillips Head',
        description:
            'A screwdriver is a hand tool used for turning screws. It has a handle and a shaft with a tip that matches the screw head. Common types include flathead, Phillips, Torx, and hex. Screwdrivers come in various sizes to fit different screws. The handles are usually ergonomically designed for comfort and control, and the shafts are made from hardened steel for durability.',
        imageUrl: 'images/screwdriver.jpg',
        safety: ScrewdriverSafety.id,
        equipment: PhillipsScrewdriverNailsEquipment.id,
      ),
      'Adjustable wrench': Tool(
        name: 'Adjustable Wrench',
        subname: 'Adjustable',
        description:
            'An adjustable wrench, also known as a crescent wrench, has a movable jaw that can be adjusted to fit various sizes of nuts and bolts. It is commonly used in plumbing, automotive, and general repair work. The tool is made from high-strength steel and features a smooth jaw to prevent damage to the fasteners. Its versatility and ease of adjustment make it a staple in any toolkit.',
        imageUrl: 'images/aw5.jpg',
        safety: AdjustableWrenchSafety.id,
        equipment: WrenchNutsEquipment.id,
      ),
      'claw hammer': Tool(
        name: 'Claw Hammer',
        subname: 'Nail Hammer',
        description:
            'A claw hammer is a common hand tool with a heavy metal head and a handle made of wood, fiberglass, or steel. The flat side of the head is used for driving nails into wood, while the claw side is used for removing nails and prying apart objects. The hammer head is typically made of forged steel for durability, and the handle is ergonomically designed for a comfortable grip.',
        imageUrl: 'images/claw.jpg',
        safety: ClawHammerSafety.id,
        equipment: IronNailsEquipment.id,
      ),
      'wrench': Tool(
        name: 'Wrench',
        subname: 'Non Adjustable',
        description:
            'A wrench, or spanner, is used to provide grip and mechanical advantage in applying torque to turn objects, typically rotary fasteners like nuts and bolts. Wrenches come in various types, including open-end, box-end, combination, and socket wrenches. They are made from durable materials like chrome vanadium steel and are often coated with anti-corrosion finishes.',
        imageUrl: 'images/wrench.jpg',
        safety: WrenchSafety.id,
        equipment: WrenchNutsEquipment.id,
      ),
      'Unknown': Tool(
        name: 'Unknown',
        subname: 'Unknown',
        description: 'Not available in the system',
        imageUrl: 'images/picture.png',
        safety: "",
        equipment: "",
      ),
      //Unknown
    };

    return toolDetails[classification] ??
        Tool(
          name: 'Unknown Tool',
          subname: 'Unknown',
          description: 'No details available.',
          imageUrl: 'images/picture.jpg',
          safety: '',
          equipment: '',
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
        title: const Text("Detected Tool"),
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
                              detectedTool.imageUrl,
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
                      padding: const EdgeInsets.only(left: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            detectedTool.name,
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
                                detectedTool.subname,
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
                                "Tool Details",
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
                              detectedTool.description,
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
                            Navigator.pushNamed(context, detectedTool.safety);
                          },
                        ),

                        //Tools Details button
                        ToolButton(
                          iconImagePath: 'images/bolt.png',
                          buttonText: 'Equipment\nDETAILS',
                          onPressed: () {
                            Navigator.pushNamed(
                                context, detectedTool.equipment);
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
