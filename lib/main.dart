import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: JankenPage(),
    );
  }
}

class JankenPage extends StatefulWidget {
  const JankenPage({super.key});

  @override
  State<JankenPage> createState() => _JankenPageState();
}

class _JankenPageState extends State<JankenPage> {
  String myHand = '👍';
  String computerHand = '👍';
  String result = 'ボタンを押してね';

  void selectHand(String selectedHand) {
    myHand = selectedHand;
    generateCoputerHand();
    judge();
    setState(() {});
  }

  void generateCoputerHand() {
    final randomNumber = Random().nextInt(3);
    computerHand = randomNumberToHand(randomNumber);
  }

  String randomNumberToHand(int randomNumber) {
    switch (randomNumber) {
      case 0:
        return '✊';
      case 1:
        return '✌️';
      case 2:
        return '🖐️';
      default:
        return '✊';
    }
  }

  void judge() {
    if (myHand == computerHand) {
      result = '引き分け';
    } else if (myHand == '✊' && computerHand == '✌️' ||
        myHand == '✌️' && computerHand == '🖐️' ||
        myHand == '🖐️' && computerHand == '✊') {
      result = '勝ち';
    } else {
      result = '負け';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('じゃんけんアプリ'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            result,
            style: TextStyle(fontSize: 32),
          ),
          SizedBox(height: 64),
          Text(
            computerHand,
            style: TextStyle(fontSize: 32),
          ),
          SizedBox(height: 64),
          Text(
            myHand,
            style: TextStyle(fontSize: 32),
          ),
          SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                child: Text('✊'),
                onPressed: () {
                  selectHand('✊');
                },
              ),
              ElevatedButton(
                child: Text('✌️'),
                onPressed: () {
                  selectHand('✌️');
                },
              ),
              ElevatedButton(
                child: Text('🖐️'),
                onPressed: () {
                  selectHand('🖐️');
                },
              ),
            ],
          ),
        ],
      )),
    );
  }
}
