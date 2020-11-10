class GameData {
  bool isMultiplayer;

  String _playerOneName;
  int playerOneScore;
  String playerOneIcon;

  String _playerTwoName;
  int playerTwoScore;
  String playerTwoIcon;

  GameData(bool isMultiplayer,
      {String playerOneName: "Player One",
      String playerTwoName = "Player Two"}) {
    this.isMultiplayer = isMultiplayer;
    this._playerOneName = playerOneName;
    this._playerTwoName = playerTwoName;
    print(
        "initial game data created, \n player one name: ${_playerOneName} \n player two name: ${_playerTwoName}");
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
}
