import 'dart:math';

import 'package:flutter/material.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  List<String> restaurants = [
    "MC  DONALD`S",
    "SUBWAYS",
    "BURGUER KING",
    "PIZZA HUT",
    "FIVE GUYS",
    "DOMINO`S"
  ];

  int _currentRestaurant = -1;

  void updateIndex() {
    final random = Random();
    final index = random.nextInt(restaurants.length);

    setState(() {
      _currentRestaurant = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("What Do You Want To Eat?"),
              if (_currentRestaurant != -1)
                Text(restaurants[_currentRestaurant],
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center),
              Padding(
                padding: EdgeInsets.only(top: 50),
                child: TextButton(
                  onPressed: () {
                    updateIndex();
                  },
                  child: Text("Pick Restaurant"),
                  style: TextButton.styleFrom(
                    primary: Colors.white,
                    backgroundColor: Colors.purple,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
