import 'package:flutter/material.dart';

import '../screens/tool_screen.dart';
import '../screens/welcome_screen.dart';

class ElectricDrillTool extends StatefulWidget {
  const ElectricDrillTool({super.key});

  static const String id = 'electric_drill_tool';

  @override
  State<ElectricDrillTool> createState() => _ElectricDrillToolState();
}

class _ElectricDrillToolState extends State<ElectricDrillTool> {
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
                  Navigator.pushNamed(context, ToolScreen.id);
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
        title: const Text("Wrench"),
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
                              "images/elec.jpeg",
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
                            "Electric Drill",
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
                                "Hand Drill",
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
                              "The electric drill, a pivotal tool in modern construction and home improvement, is engineered for drilling holes and driving fasteners into a variety of materials such as wood, metal, plastic, and masonry. This tool comprises a durable body, typically made from hard plastic and metal, housing a powerful motor that drives the drill bit or screwdriver attachment. The front of the drill features a chuck that can be tightened or loosened to secure various types of bits, allowing for versatility in applications. Most models are equipped with adjustable speed settings and a reverse function, enhancing control and efficiency for both drilling and screwing tasks. Additionally, many electric drills include features such as a hammer function for masonry work, variable torque settings for precision, and ergonomic designs that improve comfort and reduce fatigue during extended use. Whether for professional construction projects, household repairs, or intricate crafting, the electric drill is an indispensable tool, offering robust performance and adaptability across diverse drilling and fastening operations.",
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
