// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

//welcome screen
//prompt how many players
//choose symbol
//play game

class BoxW extends StatefulWidget {
  @override
  _BoxWidgetState createState() => _BoxWidgetState();
}

class _BoxWidgetState extends State<BoxW> {
  bool _isOn = false;

  Color _color;

  void _toggleClicked() {
    setState(() {
      _isOn = !_isOn;
      if (_isOn) {
        _color = Colors.white70;
      } else {
        _color = Colors.green;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: _toggleClicked,
        // color: _color,
        child: Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: _color,
            border: Border.all(),
          ),
        ));
  }
}

class Box extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white70,
        border: Border.all(),
      ),
    );
  }
}

class Grid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BoxW(),
          BoxW(),
          BoxW(),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BoxW(),
          BoxW(),
          BoxW(),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BoxW(),
          BoxW(),
          BoxW(),
        ],
      ),
    ]);
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Tic Tac Toe'),
        ),
        body: Center(
          child: Grid(),
        ),
      ),
    );
  }
}
