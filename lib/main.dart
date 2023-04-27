import 'dart:async';

import 'package:flutter/material.dart';
import 'dice.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Dice dice = Dice(size: 46);
  late Timer timer;
  int pickNumber = 0;
  List<int> result = [];

  void roll(){
    timer = Timer.periodic(const Duration(milliseconds: 10), (timer) {
      setState(() {
        pickNumber = dice.shuffle()[0];
      });
    });
  }

  void pick(){
    setState(() {
      result.add(dice.pick());
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Flexible(
              flex: 5,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.amber,
                child: Center(child: Text('$pickNumber', style: const TextStyle(fontSize: 70, color: Colors.black),),),
              )
            ),
            
            Flexible(
              child: Center(child: Text('$result'),),
            ),
            
            Flexible(
              flex: 1,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children:[
                      IconButton(
                        iconSize: 80,
                        onPressed: roll,
                        icon: const Icon(Icons.play_circle_outline),
                      ),
                      IconButton(
                        iconSize: 80,
                        onPressed: pick,
                        icon: const Icon(Icons.done),
                      )
                    ]
                  ),
                ),
              ),
            )
          ]
        ),
      ),
    );
  }

}