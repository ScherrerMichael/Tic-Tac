import 'package:flutter/material.dart';

class GameData {
  final int rows = 3;
  final int col = 3;

  bool _isMultiplayer = false;

  // no player = 0
  // first player = 1
  // second player / ai = 2

  Color _currentColor;

  int _currentPlayerTurn = 1;

  String _playerOneName;
  Color _playerOneColor = Colors.blue;
  int _playerOneScore = 0;
  String _playerOneIcon;

  String _playerTwoName;
  Color _playerTwoColor = Colors.red;
  int _playerTwoScore = 0;
  String _playerTwoIcon;

  List<List<int>> grid;

  GameData(bool isMultiplayer,
      {String playerOneName: "Player One",
      String playerTwoName: "Player Two"}) {
    this._isMultiplayer = isMultiplayer;
    this._playerOneName = playerOneName;
    this._playerTwoName = playerTwoName;
    this._currentColor = _playerOneColor;
    grid = List<List<int>>.generate(3, (i) => List<int>.generate(3, (j) => 0));
    print(grid);
    print(
        "initial game data created, \n player one name: $_playerOneName \n player two name: $_playerTwoName");
  }

  String get playerOneName {
    return _playerOneName;
  }

  String get playerTwoName {
    return _playerTwoName;
  }

  bool get isMultiplayer {
    return _isMultiplayer;
  }

  bool isActive(int row, int col) {
    return (grid[row][col] == 0);
  }

  int gridAt(int row, int col) {
    return grid[row][col];
  }

  void printGrid() {
    print('$grid');
  }

  get playerOneIcon {
    return this._playerOneIcon;
  }

  get playerOneScore {
    return this._playerOneScore;
  }

  get playerTwoScore {
    return this._playerTwoScore;
  }

  set playerOneColor(Color color) {
    this._playerOneColor = color;
  }

  set playerTwoColor(Color color) {
    this._playerTwoColor = color;
  }

  set playerOneIcon(String icon) {
    this._playerOneIcon = icon;
  }

  set playerTwoIcon(String icon) {
    this._playerTwoIcon = icon;
  }

  set isMultiplayer(bool isMultiplayer) {
    this._isMultiplayer = isMultiplayer;
  }

  set playerOneName(String name) {
    this._playerOneName = name;
  }

  set playerTwoName(String name) {
    this._playerTwoName = name;
  }

  void makeWinner(int player) {
    if (player == 1) {
      print("Player $playerOneName has won!");
      ++this._playerOneScore;
    } else if (player == 2) {
      print("Player $playerTwoName has won!");
      ++this._playerTwoScore;
    }
  }

  bool isFull() {
    for (int i = 0; i < rows; ++i) {
      for (int j = 0; j < col; ++j) if (grid[i][j] == 0) return false;
    }
    return true;
  }

  void clear() {
    for (int i = 0; i < rows; ++i) for (int j = 0; j < col; ++j) grid[i][j] = 0;
  }

  bool checkWin(int row, int col, int symbol, int player) {
    //verify:

    // diagonals
    if (row == col) {
      if ((grid[0][0] == symbol) &&
          (grid[1][1] == symbol) &&
          (grid[2][2] == symbol)) {
        makeWinner(player);
        return true;
      }
    }

    // first row
    if (row == 0) {
      if (grid[0][0] == symbol &&
          grid[0][1] == symbol &&
          grid[0][2] == symbol) {
        makeWinner(player);
        return true;
      }
    }
    // second row
    if (row == 1) {
      if (grid[1][0] == symbol &&
          grid[1][1] == symbol &&
          grid[1][2] == symbol) {
        makeWinner(player);
        return true;
      }
    }
    // third row
    if (row == 2) {
      if (grid[2][0] == symbol &&
          grid[2][2] == symbol &&
          grid[2][2] == symbol) {
        makeWinner(player);
        return true;
      }
    }
    // first column
    if (col == 0) {
      if (grid[0][0] == symbol &&
          grid[1][0] == symbol &&
          grid[2][0] == symbol) {
        makeWinner(player);
        return true;
      }
    }
    // second column
    if (col == 1) {
      if (grid[0][1] == symbol &&
          grid[1][1] == symbol &&
          grid[2][1] == symbol) {
        makeWinner(player);
        return true;
      }
    }
    // third column
    if (col == 2) {
      if (grid[0][2] == symbol &&
          grid[1][2] == symbol &&
          grid[2][2] == symbol) {
        makeWinner(player);
        return true;
      }
    }

    //cats game (no winner)
    if (isFull()) {
      print("cats game, no winner!");
      return true;
    }

    return false;
  }

  get currentColor {
    return this._currentColor;
  }

  get currentPlayerTurn {
    return this._currentPlayerTurn;
  }

  void setGrid(int row, int col, int symbol, int player) {
    grid[row][col] = symbol;
  }

  void nextTurn() {
    _currentPlayerTurn == 1 ? _currentPlayerTurn = 2 : _currentPlayerTurn = 1;

    if (_currentColor == _playerOneColor)
      _currentColor = _playerTwoColor;
    else
      _currentColor = _playerOneColor;

    print("current player turn = $_currentPlayerTurn");
  }
}
