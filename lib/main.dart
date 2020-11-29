import 'package:flutter/material.dart';
import './game.dart';
import './menu.dart';
import './data.dart';

void main() => runApp(MyApp());

//welcome screen
//prompt how many players
//choose symbol
//play game

// this main app widget keeps track of the child widget, Grid.

class MyApp extends StatefulWidget {
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isMultiplayer = false;

  var currentScreen = HomeScreen.welcome;

  Widget build(BuildContext context) {
    GameData gameData = new GameData(false);

    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: Text(_isMultiplayer ? 'Two Player' : 'One Player'),
        ),
        body: Container(
          constraints: null,
          child: Stack(children: [
            currentScreen == HomeScreen.play
                ? Grid(
                    data: gameData,
                  )
                : AnimatedPositioned(
                    top: currentScreen != HomeScreen.icon ? 200 : 100,
                    left: 100,
                    right: 100,
                    height: currentScreen == HomeScreen.icon ? 600 : 400,
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeInCubic,
                    child: Menu(
                      data: gameData,
                      homeCallBack: (HomeScreen screen) {
                        setState(() {
                          print("current screen = $screen");
                          currentScreen = screen;
                        });
                      },
                    ),
                  )
          ]),
        ),
      ),
    );
  }
}
