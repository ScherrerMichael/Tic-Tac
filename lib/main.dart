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
  var currentScreen = HomeScreen.welcome;

  Widget build(BuildContext context) {
    GameData gameData = new GameData(false);

    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: Text("Tick Tack Toe"),
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
                    left: 50,
                    right: 50,
                    bottom: currentScreen == HomeScreen.icon ? 20 : 110,
                    duration: Duration(milliseconds: 1000),
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
