import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mechtool_app/Components/arrow_button.dart';
import 'package:mechtool_app/Components/item_card.dart';
import 'package:mechtool_app/Components/tool_button.dart';
import 'package:mechtool_app/screens/account_screen.dart';
import 'package:mechtool_app/screens/equipment_screen.dart';
import 'package:mechtool_app/screens/safety_screen.dart';
import 'package:mechtool_app/screens/store_location.dart';
import 'package:mechtool_app/screens/tool_detection.dart';
import 'package:mechtool_app/screens/tool_screen.dart';
import 'package:mechtool_app/screens/welcome_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'login_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String id = 'home_screen';

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //adding page controller
  final _controller = PageController();
  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;
  final _data = FirebaseDatabase.instance;
  bool showSpinner = false;
  String name = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final user = _auth.currentUser;

    if (user != null) {
      _data.ref("users/${user.uid}/userName").onValue.listen((event) {
        if (event.snapshot.exists) {
          setState(() {
            //dynamic
            name = event.snapshot.value.toString();
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[800],
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, ToolDetection.id);
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
                  Navigator.pushNamed(context, LoginScreen.id);
                },
                icon: Icon(
                  Icons.logout_sharp,
                  size: 32,
                  color: Colors.blue[200],
                )),
          ],
        ),
      ),
      body: SingleChildScrollView(
        // physics: const BouncingScrollPhysics(),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hi, $name!',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Welcome To MECHTOOL',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.blue[200]),
                        )
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, AccountScreen.id);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.blue[600],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.all(12),
                        child: const Icon(
                          Icons.account_circle,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 25),
                //cards
                SizedBox(
                  height: 200,
                  child: PageView(
                    scrollDirection: Axis.horizontal,
                    controller: _controller,
                    children: const [
                      ItemCard(
                        toolName: 'Wrench',
                        type: 'Non-Adjustable Wrench',
                        tool: 'Now Available',
                        backgroundImage: 'images/n1.png',
                        size: 'Large',
                      ),
                      ItemCard(
                        toolName: 'Hammer',
                        type: 'Claw Hammer',
                        tool: 'Get Now',
                        backgroundImage: 'images/cw.png',
                        size: 'Small',
                      ),
                      ItemCard(
                        toolName: 'Wrench',
                        type: 'Adjustable Wrench',
                        tool: 'New',
                        backgroundImage: 'images/aw1.png',
                        size: 'Medium',
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 25),
                SmoothPageIndicator(
                  controller: _controller,
                  count: 3,
                  effect: ExpandingDotsEffect(
                    activeDotColor: Colors.blue.shade200,
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
                        Navigator.pushNamed(context, ToolScreen.id);
                      },
                    ),
                    //Safety Guide button
                    ToolButton(
                      iconImagePath: 'images/worker.png',
                      buttonText: 'SAFETY \nGUIDE',
                      onPressed: () {
                        Navigator.pushNamed(context, SafetyScreen.id);
                      },
                    ),
                  ],
                ),

                const SizedBox(height: 25),

                //Store Locations
                Column(
                  children: [
                    ArrowButton(
                      iconImagePath: 'images/store.png',
                      buttonName: 'STORES',
                      buttonSubName: 'Hardware Marts',
                      onPressed: () {
                        Navigator.pushNamed(context, StoreLocation.id);
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    //equipment
                    ArrowButton(
                      iconImagePath: 'images/bolt.png',
                      buttonName: 'EQUIPMENTS',
                      buttonSubName: 'Equipment Details',
                      onPressed: () {
                        Navigator.pushNamed(context, EquipmentScreen.id);
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
