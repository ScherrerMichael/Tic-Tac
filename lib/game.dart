import 'package:flutter/material.dart';
import './data.dart';

// class for each clickable box to be used in the game's grid.

class BoxW extends StatefulWidget {
  final Border border;
  final GameData data;
  final int col;
  final int row;

  BoxW(
      {this.border,
      @required this.row,
      @required this.col,
      @required this.data});

  @override
  _BoxWidgetState createState() => _BoxWidgetState(
      border: this.border, row: this.row, col: this.col, data: this.data);
}

class _BoxWidgetState extends State<BoxW> {
  Border border;

  GameData data;
  int row;
  int col;

  _BoxWidgetState({
    this.border,
    @required this.data,
    @required this.row,
    @required this.col,
  });

  var _color = Colors.white;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          data.setGrid(this.row, this.col, data.currentPlayerTurn,
              data.currentPlayerTurn);
          setState(() {
            _color = data.currentColor;
          });
        },
        child: Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            border: this.border,
            color: _color,
          ),
        ));
  }
}

// the grid houses 9 boxes for the game.

class Grid extends StatelessWidget {
  final GameData data;

  Grid({@required this.data});

  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BoxW(
            row: 0,
            col: 0,
            data: this.data,
            border: Border(bottom: BorderSide(color: Colors.black)),
          ),
          BoxW(
            row: 0,
            col: 1,
            data: this.data,
            border: Border(
              left: BorderSide(color: Colors.black),
              right: BorderSide(color: Colors.black),
              bottom: BorderSide(color: Colors.black),
            ),
          ),
          BoxW(
            //top right
            row: 0,
            col: 2,
            data: this.data,
            border: Border(bottom: BorderSide(color: Colors.black)),
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BoxW(
            row: 1,
            col: 0,
            data: this.data,
            border: Border(
              bottom: BorderSide(color: Colors.black),
            ),
          ), // middle left
          BoxW(
            row: 1,
            col: 1,
            data: this.data,
            border: Border(
              left: BorderSide(color: Colors.black),
              right: BorderSide(color: Colors.black),
            ),
          ), // middle middle
          BoxW(
            row: 1,
            col: 2,
            data: this.data,
            border: Border(
              bottom: BorderSide(color: Colors.black),
            ),
          ), // middle right
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BoxW(
            row: 2,
            col: 0,
            data: this.data,
          ), // bottom left
          BoxW(
            row: 2,
            col: 1,
            data: this.data,
            border: Border(
              left: BorderSide(color: Colors.black),
              right: BorderSide(color: Colors.black),
              top: BorderSide(color: Colors.black),
            ),
          ), // bottom middle
          BoxW(
            row: 2,
            col: 2,
            data: this.data,
          ), // botom right
        ],
      ),
    ]);
  }
}
