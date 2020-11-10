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

//TODO somehow the Grid is messing up the animations...??

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
          title: Text(_showMenu ? 'One player' : 'Two Player'),
        ),
        body: Container(
          child: Stack(children: [
            // Grid(
            //   active: _active,
            //   onChanged: _handleShowGrid,
            // ),
            AnimatedPositioned(
              top: _showMenu ? 150 : 5,
              duration: Duration(milliseconds: 500),
              curve: Curves.easeInCubic,
              child: Menu(
                menuCallback: (bool value) {
                  setState(() {
                    _showMenu = !_showMenu;
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
