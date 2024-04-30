import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test12/Cam/camera.dart';
import 'package:tflite/tflite.dart';


List<CameraDescription>? cameras;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.indigo[900],
      ),
      home: Xcamera(),
    );
  }
}

class Xcamera extends StatefulWidget {
  @override
  _XcameraState createState() => _XcameraState();
}

class _XcameraState extends State<Xcamera> {
  loadmodel() async {
   try {
                      await Tflite.loadModel(
                        model: "assets/MODEL.tflite",
                        labels: "assets/labels.txt",
                      );
                     
                      print('Model loaded successfully');
                    } on PlatformException catch (e) {
                      print('Failed to load model: $e');
                    }

  }

  @override
  void initState() {
    super.initState();

    loadmodel();
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.indigo[900],
      body: Center(
        child: Container(
          color: Theme.of(context).primaryColor,
          child: Container(
            margin: EdgeInsets.all(20),
            height: 50,
            width: w,
            child: MaterialButton(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => camera(),
                  ),
                );
              },
              child: Text(
                'Start Detecting',
              ),
            ),
          ),
        ),
      ),
    );
  }
}