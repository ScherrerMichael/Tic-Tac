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
  final State parent;

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
  State parent;

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
