// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import './game.dart';
import './welcome.dart';

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
  bool _active = false;
  bool _showMenu = true;

  void _handleShowGrid(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: Text(_showMenu ? 'showing menu' : 'not showing menu'),
        ),
        body: Stack(children: [
          Grid(
            active: _active,
            onChanged: _handleShowGrid,
          ),
          AnimatedPositioned(
            child: Menu(
              menuCallback: (bool value) {
                setState(() {
                  _showMenu = !_showMenu;
                });
              },
            ),
            duration: Duration(seconds: 5),
            curve: Curves.bounceIn,
          )
        ]),
      ),
    );
  }
}
