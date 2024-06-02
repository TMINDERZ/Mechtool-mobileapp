import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_tflite/flutter_tflite.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mechtool_app/Detected%20item/Detected_Equipment.dart';
import 'package:mechtool_app/screens/safety_screen.dart';
import 'package:mechtool_app/screens/store_location.dart';
import 'package:mechtool_app/screens/tool_detection.dart';
import 'package:mechtool_app/screens/welcome_screen.dart';
import 'package:mechtool_app/Detected%20item/Detected_Equipment.dart';
import '../Components/arrow_button.dart';
import '../Components/tool_button.dart';
import 'equipment_screen.dart';
import 'home_screen.dart';
import 'dart:developer' as devtools;

class EquipmentDetection extends StatefulWidget {
  const EquipmentDetection({super.key});

  static const String id = 'equipment_detection';

  @override
  State<EquipmentDetection> createState() => _EquipmentDetectionState();
}

class _EquipmentDetectionState extends State<EquipmentDetection> {
  File? filePath;

  double confidence = 0.0;
  String label = "EQUIPMENT";

  Future<void> _tfLteInit() async {
    String? res = await Tflite.loadModel(
        model: "assets/modeleq.tflite",
        labels: "assets/lableseq.txt",
        numThreads: 1, // defaults to 1
        isAsset:
            true, // defaults to true, set to false to load resources outside assets
        useGpuDelegate:
            false // defaults to false, set to true to use GPU delegate
        );
  }

  pickImageFromGallery() async {
    final ImagePicker picker = ImagePicker();
    // Pick an image.
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image == null) return;

    var imageMap = File(image.path);

    setState(() {
      filePath = imageMap;
    });

    var recognitions = await Tflite.runModelOnImage(
        path: image.path, // required
        imageMean: 0, // defaults to 117.0
        imageStd: 1, // defaults to 1.0
        numResults: 2, // defaults to 5
        threshold: 0.1, // defaults to 0.1
        asynch: true // defaults to true
        );
    print(confidence);
    if (recognitions == null) {
      devtools.log("recognition is null");
      return;
    }
    devtools.log(recognitions.toString());
    setState(() {
      confidence = (recognitions[0]['confidence'] * 100);
      label = recognitions[0]['label'].toString();
    });
  }

  pickImageFromCamera() async {
    final ImagePicker picker = ImagePicker();
    // Pick an image.
    final XFile? image = await picker.pickImage(source: ImageSource.camera);

    if (image == null) return;

    var imageMap = File(image.path);

    setState(() {
      filePath = imageMap;
    });

    var recognitions = await Tflite.runModelOnImage(
        path: image.path, // required
        imageMean: 0, // defaults to 117.0
        imageStd: 1, // defaults to 1.0
        numResults: 2, // defaults to 5
        threshold: 0.1, // defaults to 0.1
        asynch: true // defaults to true
        );

    if (recognitions == null) {
      devtools.log("recognition is null");
      return;
    }
    devtools.log(recognitions.toString());
    setState(() {
      confidence = (recognitions[0]['confidence'] * 100);
      label = recognitions[0]['label'].toString();
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    Tflite.close();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tfLteInit();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[800],
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            pickImageFromCamera();
          },
          backgroundColor: Colors.blueAccent,
          child: const Icon(
            Icons.camera_alt_outlined,
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
        title: const Text("TOOL DETECTOR"),
        backgroundColor: Colors.blue[800],
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 25,
                ),
                Card(
                  elevation: 20,
                  clipBehavior: Clip.hardEdge,
                  color: Colors.lightBlue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: SizedBox(
                      width: 350,
                      child: SingleChildScrollView(
                          child: Column(
                        children: [
                          const SizedBox(
                            height: 8,
                          ),
                          Container(
                            height: 280,
                            width: 280,
                            decoration: BoxDecoration(
                              color: Colors.blue[800],
                              borderRadius: BorderRadius.circular(12),
                              image: const DecorationImage(
                                image: AssetImage('images/picture.png'),
                              ),
                            ),
                            child: filePath == null
                                ? const Text('')
                                : Image.file(filePath!, fit: BoxFit.fill),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: Column(
                              children: [
                                Text(
                                  label,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                                const Text(
                                  "DETECTION",
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ))),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //Tool detection button
                    ToolButton(
                      iconImagePath: 'images/analysis.png',
                      buttonText: 'Detect \nTools',
                      onPressed: () {
                        Navigator.pushNamed(context, ToolDetection.id);
                      },
                    ),

                    //Camera Access button
                    ToolButton(
                      iconImagePath: 'images/camera.png',
                      buttonText: 'Get Using \nCamera',
                      onPressed: () {
                        pickImageFromCamera();
                      },
                    ),
                    //Gallery Access button
                    ToolButton(
                      iconImagePath: 'images/Gallery.png',
                      buttonText: 'Pick From \nGallery',
                      onPressed: () {
                        pickImageFromGallery();
                        // Navigator.pushNamed(context, SafetyScreen.id);
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 25),

                //Store Locations
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ArrowButton(
                      iconImagePath: 'images/tool-box.png',
                      buttonName: 'EQUIPMENT DETAILS',
                      buttonSubName:
                          'Description and more\ninfo about the Equipment',
                      onPressed: () {
                        Navigator.pushNamed(context, DetectedEquipment.id,
                            arguments: label);
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      //Stores
    );
  }
}
