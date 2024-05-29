import 'package:flutter/material.dart';
import 'package:mechtool_app/screens/tool_detection.dart';

import '../Components/tool_button.dart';
import '../screens/welcome_screen.dart';

class DetectedEquipment extends StatefulWidget {
  const DetectedEquipment({super.key});

  static const String id = 'equipment_tool';

  @override
  State<DetectedEquipment> createState() => _DetectedEquipmentState();
}

class _DetectedEquipmentState extends State<DetectedEquipment> {
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
        title: const Text("Adjustable Wrench"),
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
                              "images/aw5.jpg",
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
                            "Wrench",
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
                                "Adjustable",
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
                                "Tool Details",
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
                              "The adjustable wrench, an essential component of any comprehensive toolkit, is a versatile hand tool designed for gripping and turning nuts and bolts of various sizes. This tool consists of a sturdy handle, typically made from steel or chrome-vanadium, which is both durable and comfortable to hold. At one end of the handle is an adjustable jaw, which can be moved by turning a worm screw located near the tool's head. This allows the wrench to adapt its grip to a wide range of fastener sizes, making it incredibly useful for jobs requiring multiple socket sizes. Known also as a crescent wrench or an adjustable spanner, this tool is invaluable for plumbing, automotive repair, and general maintenance tasks. Its ability to quickly adjust to different fastener sizes not only simplifies work but also reduces the need for carrying multiple fixed-size wrenches, thereby lightening the load and enhancing efficiency in various mechanical and assembly operations.",
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
                    const SizedBox(height: 25),
                    // 3 Buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //Tool detection button
                        ToolButton(
                          iconImagePath: 'images/analysis.png',
                          buttonText: 'TOOL \nDETECT',
                          onPressed: () {
                            Navigator.pushNamed(context, ToolDetection.id);
                          },
                        ),

                        //Tools Details button
                        ToolButton(
                          iconImagePath: 'images/tool-box.png',
                          buttonText: 'TOOL \nDETAILS',
                          onPressed: () {
                            Navigator.pushNamed(context, ToolDetection.id);
                          },
                        ),
                        //Safety Guide button
                        ToolButton(
                          iconImagePath: 'images/worker.png',
                          buttonText: 'SAFETY \nGUIDE',
                          onPressed: () {
                            Navigator.pushNamed(context, ToolDetection.id);
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
