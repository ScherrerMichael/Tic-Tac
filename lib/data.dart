class GameData {
  final int rows = 3;
  final int col = 3;

  bool isMultiplayer = false;

  int currentPlayer = 1;

  String _playerOneName;
  int playerOneScore;
  String playerOneIcon;

  String _playerTwoName;
  int playerTwoScore;
  String playerTwoIcon;

  List<List<int>> grid;

  GameData(bool isMultiplayer,
      {String playerOneName: "Player One",
      String playerTwoName: "Player Two"}) {
    this.isMultiplayer = isMultiplayer;
    this._playerOneName = playerOneName;
    this._playerTwoName = playerTwoName;
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

  set playerOneName(String name) {
    this._playerOneName = name;
  }

  set playerTwoName(String name) {
    this._playerTwoName = name;
  }

  void make_winner(bool player) {
    if (player == true)
      print("Player $playerOneName has won!");
    else
      print("Player $playerTwoName has won!");
  }

  bool isFull() {
    for (int i = 0; i < rows; ++i) {
      for (int j = 0; j < col; ++j) if (grid[i][j] == 0) return false;
    }
    return true;
  }

  bool checkWin(int row, int col, int symbol, bool player) {
    //verify:

    // diagonals
    if (row == col) {
      if ((grid[0][0] == symbol) &&
          (grid[1][1] == symbol) &&
          (grid[2][2] == symbol)) {
        make_winner(player);
        return false;
      }
    }

    // first row
    if (row == 0) {
      if (grid[0][0] == symbol &&
          grid[0][1] == symbol &&
          grid[0][2] == symbol) {
        make_winner(player);
        return false;
      }
    }
    // second row
    if (row == 1) {
      if (grid[1][0] == symbol &&
          grid[1][1] == symbol &&
          grid[1][2] == symbol) {
        make_winner(player);
        return false;
      }
    }
    // third row
    if (row == 2) {
      if (grid[2][0] == symbol &&
          grid[2][2] == symbol &&
          grid[2][2] == symbol) {
        make_winner(player);
        return false;
      }
    }
    // first column
    if (col == 0) {
      if (grid[0][0] == symbol &&
          grid[1][0] == symbol &&
          grid[2][0] == symbol) {
        make_winner(player);
        return false;
      }
    }
    // second column
    if (col == 1) {
      if (grid[0][1] == symbol &&
          grid[1][1] == symbol &&
          grid[2][1] == symbol) {
        make_winner(player);
        return false;
      }
    }
    // third column
    if (col == 2) {
      if (grid[0][2] == symbol &&
          grid[1][2] == symbol &&
          grid[2][2] == symbol) {
        make_winner(player);
        return false;
      }
    }

    //cats game (no winner)
    if (isFull()) {
      print("cats game, no winner!");
      return false;
    }

    return true;
  }

  void setGrid(int row, int col, int state, bool player) {
    grid[row][col] = state;
    checkWin(row, col, state, player);
    print(grid);
  }
}
