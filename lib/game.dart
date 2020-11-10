//Game logic.
import 'package:flutter/material.dart';

// class for each clickable box to be used in the game's grid.

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

// the grid houses 9 boxes for the game.

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
      IconSelect(),
    ]);
  }
}

// class for choosing whether to use X's or O's in the game

enum icon { x, o }

class IconSelect extends StatefulWidget {
  @override
  _IconSelectState createState() => _IconSelectState();
}

class _IconSelectState extends State<IconSelect> {
  icon _currentIcon = icon.x;

  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: const Text('X'),
          leading: Radio(
            value: icon.x,
            groupValue: _currentIcon,
            onChanged: (icon value) {
              setState(() {
                _currentIcon = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('O'),
          leading: Radio(
            value: icon.o,
            groupValue: _currentIcon,
            onChanged: (icon value) {
              setState(() {
                _currentIcon = value;
              });
            },
          ),
        ),
      ],
    );
  }
}
