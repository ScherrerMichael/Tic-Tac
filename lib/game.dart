import 'package:flutter/material.dart';
import './data.dart';

// class for each clickable box to be used in the game's grid.
typedef BoxCallBack = void Function(int row, int col);

class BoxW extends StatefulWidget {
  final Border border;
  final GameData data;
  final int col;
  final int row;
  final BoxCallBack boxCallBack;

  BoxW(
      {this.border,
      @required this.row,
      @required this.col,
      @required this.data,
      @required this.boxCallBack});

  @override
  _BoxWidgetState createState() => _BoxWidgetState(
      border: this.border,
      row: this.row,
      col: this.col,
      data: this.data,
      boxCallBack: this.boxCallBack);
}

class _BoxWidgetState extends State<BoxW> {
  Border border;

  GameData data;
  int row;
  int col;
  final BoxCallBack boxCallBack;

  _BoxWidgetState({
    this.border,
    @required this.data,
    @required this.row,
    @required this.col,
    @required this.boxCallBack,
  });

  var _color = Colors.white;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          boxCallBack(this.row, this.col);
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

class Grid extends StatefulWidget {
  final GameData data;

  Grid({@required this.data});

  _GridState createState() => _GridState(data: this.data);
}

//TODO: Im working on adding a confirm button, so I will need to make the gri stateful.
class _GridState extends State<Grid> {
  final GameData data;

  _GridState({@required this.data});

  bool isButtonDisabled = true;
  int selectedRow;
  int selectedCol;

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
            boxCallBack: (int row, int col) {
              setState(() {
                selectedRow = row;
                selectedCol = col;
                isButtonDisabled = false;
              });
            },
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
            boxCallBack: (int row, int col) {
              setState(() {
                selectedRow = row;
                selectedCol = col;
                isButtonDisabled = false;
              });
            },
          ),
          BoxW(
            //top right
            row: 0,
            col: 2,
            data: this.data,
            border: Border(bottom: BorderSide(color: Colors.black)),
            boxCallBack: (int row, int col) {
              setState(() {
                selectedRow = row;
                selectedCol = col;
                isButtonDisabled = false;
              });
            },
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
            boxCallBack: (int row, int col) {
              setState(() {
                selectedRow = row;
                selectedCol = col;
                isButtonDisabled = false;
              });
            },
          ), // middle left
          BoxW(
            row: 1,
            col: 1,
            data: this.data,
            border: Border(
              left: BorderSide(color: Colors.black),
              right: BorderSide(color: Colors.black),
            ),
            boxCallBack: (int row, int col) {
              setState(() {
                selectedRow = row;
                selectedCol = col;
                isButtonDisabled = false;
              });
            },
          ), // middle middle
          BoxW(
            row: 1,
            col: 2,
            data: this.data,
            border: Border(
              bottom: BorderSide(color: Colors.black),
            ),
            boxCallBack: (int row, int col) {
              selectedRow = row;
              selectedCol = col;
              isButtonDisabled = false;
            },
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
            boxCallBack: (int row, int col) {
              selectedRow = row;
              selectedCol = col;
              isButtonDisabled = false;
            },
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
            boxCallBack: (int row, int col) {
              selectedRow = row;
              selectedCol = col;
              isButtonDisabled = false;
            },
          ), // bottom middle
          BoxW(
            row: 2,
            col: 2,
            data: this.data,
            boxCallBack: (int row, int col) {
              setState(() {
                selectedRow = row;
                selectedCol = col;
                isButtonDisabled = false;
              });
            },
          ), // botom right
        ],
      ),
      SizedBox(
        height: 100,
      ),
      isButtonDisabled
          ? TextButton(
              // disabled confirm button.
              child: Text("Confirm"),
              style: TextButton.styleFrom(
                minimumSize: Size(100, 50),
                primary: Colors.white,
                backgroundColor: Colors.grey,
                onSurface: Colors.grey,
              ),
            )
          : TextButton(
              //enabled confirm button
              child: Text("Confirm"),
              style: TextButton.styleFrom(
                minimumSize: Size(100, 50),
                primary: Colors.white,
                backgroundColor: Colors.teal,
                onSurface: Colors.grey,
              ),
              onPressed: () {
                setState(() {
                  isButtonDisabled = true;
                });
              },
            )
    ]);
  }
}
