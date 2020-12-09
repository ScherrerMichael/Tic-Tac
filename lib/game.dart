import 'dart:async';
import 'package:flutter/material.dart';
import './data.dart';
import './menu.dart';

// class for each clickable box to be used in the game's grid.
typedef BoxCallBack = void Function(int row, int col);

class BoxW extends StatefulWidget {
  final Border border;
  final GameData data;
  final int col;
  final int row;
  final BoxCallBack boxCallBack;
  final _GridState parent;

  BoxW({
    this.border,
    @required this.row,
    @required this.col,
    @required this.data,
    @required this.boxCallBack,
    @required this.parent,
  });

  @override
  _BoxWidgetState createState() => _BoxWidgetState(
        border: this.border,
        row: this.row,
        col: this.col,
        data: this.data,
        boxCallBack: this.boxCallBack,
        parent: this.parent,
      );
}

class _BoxWidgetState extends State<BoxW> {
  Border border;

  GameData data;
  int row;
  int col;
  final BoxCallBack boxCallBack;
  _GridState parent;

  _BoxWidgetState({
    this.border,
    @required this.data,
    @required this.row,
    @required this.col,
    @required this.boxCallBack,
    @required this.parent,
  });

  var _color = Colors.white;
  bool _selected = false;

  @override
  Widget build(BuildContext context) {
    int value = data.gridAt(row, col);
    setState(() {
      if (value == 0 &&
          (parent.selectedRow != this.row || parent.selectedCol != this.col))
        _color = Colors.white;
      else if (value == 1)
        _color = Colors.blue;
      else if (value == 2) _color = Colors.red;
    });
    return TextButton(
        onPressed: () {
          setState(() {
            if (data.isActive(row, col)) _color = data.currentColor;
          });
          boxCallBack(this.row, this.col);
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

typedef OnPlayerWin = void Function(GameData data);
// the grid houses 9 boxes for the game.

class Grid extends StatefulWidget {
  final GameData data;
  final OnPlayerWin onPlayerWin;

  Grid({@required this.data, @required this.onPlayerWin});

  _GridState createState() =>
      _GridState(data: this.data, onPlayerWin: this.onPlayerWin);
}

class _GridState extends State<Grid> {
  final GameData data;
  final OnPlayerWin onPlayerWin;

  _GridState({@required this.data, @required this.onPlayerWin});

  bool isButtonDisabled = true;
  int selectedRow;
  int selectedCol;
  bool isWinner = false;

  Future sleep1() {
    return new Future.delayed(
        const Duration(seconds: 5), () => {print('sleeping')});
  }

  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("player ${data.currentPlayerTurn}'s turn"),
          SizedBox(
            width: 25,
          ),
          Container(
            width: 20,
            height: 20,
            color: data.currentColor,
          )
        ],
      ),
      SizedBox(
        height: 100,
      ),
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
            parent: this,
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
            parent: this,
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
            parent: this,
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
            parent: this,
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
            parent: this,
          ), // middle middle
          BoxW(
            row: 1,
            col: 2,
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
            parent: this,
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
              setState(() {
                selectedRow = row;
                selectedCol = col;
                isButtonDisabled = false;
              });
            },
            parent: this,
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
              setState(() {
                selectedRow = row;
                selectedCol = col;
                isButtonDisabled = false;
              });
            },
            parent: this,
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
            parent: this,
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
                  // sleep1();
                  data.setGrid(selectedRow, selectedCol, data.currentPlayerTurn,
                      data.currentPlayerTurn);

                  if (data.checkWin(selectedRow, selectedCol,
                      data.currentPlayerTurn, data.currentPlayerTurn)) {
                    onPlayerWin(this.data);
                    return;
                  } else {
                    print(
                        'row: $selectedRow, col: $selectedCol, player: ${data.currentPlayerTurn}');
                    print(
                        'check win: ${data.checkWin(selectedRow, selectedCol, data.currentPlayerTurn, data.currentPlayerTurn)}');

                    data.nextTurn();
                  }
                });
              },
            )
    ]);
  }
}
