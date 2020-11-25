import 'package:flutter/material.dart';
import './data.dart';

// class for each clickable box to be used in the game's grid.

class BoxW extends StatefulWidget {
  final Border border;
  final Function(int, int) onSelected;
  final int col;
  final int row;

  BoxW(
      {this.border,
      @required this.onSelected,
      @required this.row,
      @required this.col});

  @override
  _BoxWidgetState createState() => _BoxWidgetState(
      border: this.border,
      onSelected: onSelected,
      row: this.row,
      col: this.col);
}

class _BoxWidgetState extends State<BoxW> {
  Border border;

  Function(int, int) onSelected;
  int row;
  int col;

  _BoxWidgetState({
    this.border,
    @required this.onSelected,
    @required this.row,
    @required this.col,
  });

  bool _isOn = false;

  Color _color;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          onSelected(row, col);
        },
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
  GameData data;

  Grid({@required this.data});

  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BoxW(
            row: 0,
            col: 0,
            onSelected: (int row, int col) {
              data.setGrid(row, col, 1);
            },
            border: Border(bottom: BorderSide(color: Colors.black)),
          ),
          BoxW(
            row: 0,
            col: 1,
            onSelected: (int row, int col) {
              data.setGrid(row, col, 1);
            },
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
            onSelected: (int row, int col) {
              data.setGrid(row, col, 1);
            },
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
            onSelected: (int row, int col) {
              data.setGrid(row, col, 1);
            },
            border: Border(
              bottom: BorderSide(color: Colors.black),
            ),
          ), // middle left
          BoxW(
            row: 1,
            col: 1,
            onSelected: (int row, int col) {
              data.setGrid(row, col, 1);
            },
            border: Border(
              left: BorderSide(color: Colors.black),
              right: BorderSide(color: Colors.black),
            ),
          ), // middle middle
          BoxW(
            row: 1,
            col: 2,
            onSelected: (int row, int col) {
              data.setGrid(row, col, 1);
            },
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
            onSelected: (int row, int col) {
              data.setGrid(row, col, 1);
            },
          ), // bottom left
          BoxW(
            row: 2,
            col: 1,
            onSelected: (int row, int col) {
              data.setGrid(row, col, 1);
            },
            border: Border(
              left: BorderSide(color: Colors.black),
              right: BorderSide(color: Colors.black),
              top: BorderSide(color: Colors.black),
            ),
          ), // bottom middle
          BoxW(
            row: 2,
            col: 2,
            onSelected: (int row, int col) {
              data.setGrid(row, col, 1);
            },
          ), // botom right
        ],
      ),
    ]);
  }
}
