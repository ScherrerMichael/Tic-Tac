//Game logic.
import 'package:flutter/material.dart';

// class for each clickable box to be used in the game's grid.

class BoxW extends StatefulWidget {
  final Border border;

  BoxW({this.border});

  @override
  _BoxWidgetState createState() => _BoxWidgetState(border: this.border);
}

class _BoxWidgetState extends State<BoxW> {
  Border border;
  _BoxWidgetState({this.border});

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
            border: this.border,
          ),
        ));
  }
}

// the grid houses 9 boxes for the game.

class Grid extends StatelessWidget {
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BoxW(
            // top left
            border: Border(bottom: BorderSide(color: Colors.black)),
          ),
          BoxW(), // top middle
          BoxW(), // top right
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BoxW(), // middle left
          BoxW(), // middle middle
          BoxW(), // middle right
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BoxW(), // bottom left
          BoxW(), // bottom middle
          BoxW(), // botom right
        ],
      ),
    ]);
  }
}
