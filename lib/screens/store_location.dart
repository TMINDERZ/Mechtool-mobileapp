import 'package:flutter/material.dart';
import 'package:mechtool_app/Components/arrow_button.dart';
import 'package:mechtool_app/maps/maps_page.dart';
import 'package:mechtool_app/screens/home_screen.dart';
import 'package:mechtool_app/screens/welcome_screen.dart';

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
                      buttonName: 'Store 1',
                      buttonSubName: 'Address 1',
                      onPressed: () {
                        Navigator.pushNamed(context, MapPage.id);
                      }),
                  const SizedBox(
                    height: 15,
                  ),
                  ArrowButton(
                      iconImagePath: 'images/store.png',
                      buttonName: 'Store 2',
                      buttonSubName: 'Address 2',
                      onPressed: () {
                        Navigator.pushNamed(context, MapPage.id);
                      }),
                  const SizedBox(
                    height: 15,
                  ),
                  ArrowButton(
                      iconImagePath: 'images/store.png',
                      buttonName: 'Store 3',
                      buttonSubName: 'Address 3',
                      onPressed: () {
                        Navigator.pushNamed(context, MapPage.id);
                      }),
                  const SizedBox(
                    height: 15,
                  ),
                  ArrowButton(
                      iconImagePath: 'images/store.png',
                      buttonName: 'Store 4',
                      buttonSubName: 'Address 4',
                      onPressed: () {
                        Navigator.pushNamed(context, MapPage.id);
                      }),
                  const SizedBox(
                    height: 15,
                  ),
                  ArrowButton(
                      iconImagePath: 'images/store.png',
                      buttonName: 'Store 5',
                      buttonSubName: 'Address 5',
                      onPressed: () {
                        Navigator.pushNamed(context, MapPage.id);
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
