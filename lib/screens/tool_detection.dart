import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_tflite/flutter_tflite.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mechtool_app/Detected%20item/Detected_Tool.dart';
import 'package:mechtool_app/screens/equipment_detection.dart';
import 'package:mechtool_app/screens/welcome_screen.dart';

import '../Components/arrow_button.dart';
import '../Components/tool_button.dart';
import 'home_screen.dart';
import 'dart:developer' as devtools;

class ToolDetection extends StatefulWidget {
  const ToolDetection({super.key});

  static const String id = 'tool_detection';

  @override
  State<ToolDetection> createState() => _ToolDetectionState();
}

class _ToolDetectionState extends State<ToolDetection> {
  File? filePath;

  double confidence = 0.0;
  String label = "TOOL";

  Future<void> _tfLteInit() async {
    String? res = await Tflite.loadModel(
        model: "assets/model.tflite",
        labels: "assets/lables.txt",
        numThreads: 1,
        isAsset: true,
        useGpuDelegate: false);
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
        path: image.path,
        imageMean: 0,
        imageStd: 1,
        numResults: 5,
        threshold: 0.1,
        asynch: true);
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
        path: image.path,
        imageMean: 0,
        imageStd: 1,
        numResults: 5,
        threshold: 0.1,
        asynch: true);

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
                      buttonText: 'Detect \nEquipment',
                      onPressed: () {
                        Navigator.pushNamed(context, EquipmentDetection.id);
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
                      buttonName: 'TOOL DETAILS',
                      buttonSubName:
                          'Description and more\ninfo about the Tool',
                      onPressed: () {
                        Navigator.pushNamed(context, DetectedTool.id,
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
