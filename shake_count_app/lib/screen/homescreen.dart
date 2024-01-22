import 'package:flutter/material.dart';
import 'package:shake/shake.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _counter = 0;

  @override
  void initState() {
    ShakeDetector detector = ShakeDetector.autoStart(onPhoneShake: () {
        setState(() {
          _counter++;
        });
    }, shakeThresholdGravity: 1.5);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text("흔들어서 카운트를 표시하세요"),
            Text("${_counter}", style: TextStyle(fontSize: 20),),
          ],
        ),
      ),
    );
  }
}