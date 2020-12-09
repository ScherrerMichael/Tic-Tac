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
  var currentMenuScreen = MenuScreen.main;

  GameData gameData = new GameData(false);
  Widget build(BuildContext context) {
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
                    top: currentScreen != HomeScreen.icon ? 200 : 100,
                    left: 100,
                    right: 100,
                    bottom: currentScreen == HomeScreen.icon ? 20 : 110,
                    duration: Duration(milliseconds: 1000),
                    curve: Curves.easeInCubic,
                    child: Menu(
                      data: gameData,
                      currentScreen: this.currentMenuScreen,
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
