// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import './game.dart';
import './menu.dart';

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

  // var currentScreen = HomeScreen.welcome;
  var currentScreen = HomeScreen.play;

  void changeHomeScreen(HomeScreen screen) {
    currentScreen = screen;
  }

  Widget build(BuildContext context) {
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
                ? Grid()
                : AnimatedPositioned(
                    top: currentScreen != HomeScreen.icon ? 200 : 100,
                    left: 100,
                    right: 100,
                    height: currentScreen == HomeScreen.icon ? 600 : 400,
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeInCubic,
                    child: Menu(
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
