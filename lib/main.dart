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

//maybe use this color pallet?: https://coolors.co/157a6e-499f68-77b28c-c2c5bb-b4654a

class MyApp extends StatefulWidget {
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var currentScreen = HomeScreen.welcome;
  var currentMenuScreen = MenuScreen.main;

  GameData gameData = new GameData(false);
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Color(0xFF157A6E), brightness: Brightness.light),
      title: 'Welcome to Flutter',
      home: Scaffold(
        backgroundColor: Color(0xFFC2C5bb),
        appBar: AppBar(
          title: Text("Tick Tack Toe"),
        ),
        body: Container(
          constraints: null,
          child: Stack(children: [
            currentScreen == HomeScreen.play
                ? Grid(
                    onPlayerWin: (GameData data) {
                      setState(() {
                        this.currentMenuScreen = MenuScreen.winScreen;
                        this.currentScreen = HomeScreen.welcome;
                        // gameData = data;
                      });
                    },
                    data: gameData,
                  )
                : AnimatedPositioned(
                    top: 50,
                    left: 50,
                    right: 50,
                    bottom: 20,
                    duration: Duration(milliseconds: 1000),
                    curve: Curves.easeInCubic,
                    child: Menu(
                      data: gameData,
                      currentScreen: this.currentMenuScreen,
                      homeCallBack: (HomeScreen screen) {
                        setState(() {
                          gameData.reset();
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
