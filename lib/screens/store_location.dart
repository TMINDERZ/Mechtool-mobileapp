import 'package:flutter/material.dart';
import 'package:mechtool_app/Components/arrow_button.dart';
import 'package:mechtool_app/maps/maps_page.dart';
import 'package:mechtool_app/maps/maps_page1.dart';
import 'package:mechtool_app/maps/maps_page3.dart';
import 'package:mechtool_app/maps/maps_page4.dart';
import 'package:mechtool_app/screens/home_screen.dart';
import 'package:mechtool_app/screens/welcome_screen.dart';

import '../maps/maps_page2.dart';

class StoreLocation extends StatefulWidget {
  const StoreLocation({super.key});

  static const String id = 'store_location';

  @override
  State<StoreLocation> createState() => _StoreLocationState();
}

class _StoreLocationState extends State<StoreLocation> {
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
        //Store Location
        title: const Text("Store Locations"),
        backgroundColor: Colors.blue[800],
        centerTitle: true,
      ),
      //Stores
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
                      iconImagePath: 'images/store.png',
                      buttonName: 'Rathna Hardware',
                      buttonSubName: 'No.173 New Kandy Rd',
                      onPressed: () {
                        Navigator.pushNamed(context, MapPage.id);
                      }),
                  const SizedBox(
                    height: 15,
                  ),
                  ArrowButton(
                      iconImagePath: 'images/store.png',
                      buttonName: 'S.B.C.Hardware',
                      buttonSubName: '421 Athurugiriya Rd',
                      onPressed: () {
                        Navigator.pushNamed(context, MapsPage1.id);
                      }),
                  const SizedBox(
                    height: 15,
                  ),
                  ArrowButton(
                      iconImagePath: 'images/store.png',
                      buttonName: 'Malabe Hardware\nstores',
                      buttonSubName: '649 Athurugiriya Rd',
                      onPressed: () {
                        Navigator.pushNamed(context, MapsPage2.id);
                      }),
                  const SizedBox(
                    height: 15,
                  ),
                  ArrowButton(
                      iconImagePath: 'images/store.png',
                      buttonName: 'Popular Paints\nand Hardware',
                      buttonSubName: '182 Kaduwela Rd',
                      onPressed: () {
                        Navigator.pushNamed(context, MapsPage3.id);
                      }),
                  const SizedBox(
                    height: 15,
                  ),
                  ArrowButton(
                      iconImagePath: 'images/store.png',
                      buttonName: 'Soga Hardware',
                      buttonSubName: '249/5/B New Kandy Rd',
                      onPressed: () {
                        Navigator.pushNamed(context, MapsPage4.id);
                      }),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
