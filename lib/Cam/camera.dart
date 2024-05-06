// ignore_for_file: unnecessary_set_literal

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:tflite/tflite.dart';

import 'Xcam.dart';


class camera extends StatefulWidget {
  @override
  _cameraState createState() => _cameraState();
}

class _cameraState extends State<camera> {
  String answer = "";
  CameraController? cameraController;
  CameraImage? cameraImage;
  
  
//  change the model name in main file at line number 35,36 
loadModel() async {
  try {
    await Tflite.loadModel(
      model: "assets/MODEL.tflite",
      labels: "assets/labels.txt",
    );
    print("Model loaded successfully");
  } catch (e) {
    print("Failed to load model: $e");
  }
}
  initCamera() {

     //cameraController = CameraController(cameras![1], ResolutionPreset.medium);

    
    cameraController = CameraController(
        CameraDescription(
          name: '1', // 0 for back camera and 1 for front camera
          lensDirection: CameraLensDirection.back,
          sensorOrientation: 0,
        ),
        ResolutionPreset.medium);
    cameraController!.initialize().then(
      (value) {
        if (!mounted) {
          return;
        }
        setState(
          () {
            cameraController!.startImageStream(
              (image) => {
                if (true)
                  {
                     setState(
                       () {
                         cameraImage = image;
                       },
                     ),
                    applymodelonimages(),
                  }
              },
            );
          },
        );
      },
    );
  }

  applymodelonimages() async {
  if (cameraImage != null) {
    try {
      var predictions = await Tflite.runModelOnFrame(
        bytesList: cameraImage!.planes.map((plane) => plane.bytes).toList(),
        imageHeight: cameraImage!.height,
        imageWidth: cameraImage!.width,
        imageMean: 127.5,
        imageStd: 127.5,
        rotation: 90,
        numResults: 3,
        threshold: 0.1,
        asynch: true,
      );

    setState(() {
        if (predictions != null && predictions.isNotEmpty) {
          answer = '';
          predictions.forEach((prediction) {
            answer +=
                "${prediction['label']} ${(prediction['confidence'] as double).toStringAsFixed(3)}\n";
          });
        } else {
          answer = 'No predictions';
        }
      });
    } catch (e) {
      print("Error running model: $e");
    }
  }
}
  @override
  void initState() {
    super.initState();
    initCamera();
     loadModel();
  }

  @override
  void dispose() async {
    super.dispose();

    await Tflite.close();
    cameraController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:
          ThemeData(brightness: Brightness.dark, primaryColor: Colors.purple),
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: cameraImage != null
              ? Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.blue,
                  child: Stack(
                    children: [
                      Positioned(
                        child: Center(
                          child: Container(
                            height: MediaQuery.of(context).size.height,
                            width: MediaQuery.of(context).size.width,
                            child: AspectRatio(
                              aspectRatio: cameraController!.value.aspectRatio,
                              child: CameraPreview(
                                cameraController!,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Center(
                          child: Container(
                            padding: EdgeInsets.all(10),
                            color: Colors.black87,
                            child: Center(
                              child: Text(
                                answer,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              : Container(),
        ),
      ),
    );
  }
}
/*
import 'package:tflite/tflite.dart';



  // Method to run inference


// Usage:
void main() async {
  await YourModelHandler.loadModel();
  List<double> inputData = [/* Your input data */];
  await YourModelHandler.runInference(inputData);
}
*/