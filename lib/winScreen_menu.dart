import 'package:flutter/material.dart';
import './data.dart';
import './menu.dart';

// Player winning screen
class WinScreen extends StatelessWidget {
  final GameData data;

  const WinScreen(
      {@required this.homeCallBack,
      @required this.menuCallBack,
      @required this.data});

  final HomeCallBack homeCallBack;
  final MenuCallBack menuCallBack;

  Widget build(BuildContext buildcontext) {
    data.printGrid();
    return (Container(
      child: Column(
        children: [
          data.currentWinner != 0
              ? Text(
                  'player ${data.currentPlayerTurn} wins! \nPlayer 1 score: ${data.playerOneScore} \nPlayer 2 score: ${data.playerTwoScore} ',
                  style: DefaultTextStyle.of(buildcontext)
                      .style
                      .apply(fontSizeFactor: 2.0),
                )
              : Text(
                  'Cats Game, no winner! \nPlayer 1 score: ${data.playerOneScore} \nPlayer 2 score: ${data.playerTwoScore} ',
                  style: DefaultTextStyle.of(buildcontext)
                      .style
                      .apply(fontSizeFactor: 2.0),
                ),
          SizedBox(
            height: 100,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  data.clear();
                  menuCallBack(MenuScreen.main);
                },
                child: Text("Menu"),
                style: TextButton.styleFrom(
                  minimumSize: Size(100, 50),
                  primary: Colors.white,
                  backgroundColor: Colors.teal,
                  onSurface: Colors.grey,
                ),
              ),
              TextButton(
                onPressed: () {
                  // TODO reset the data
                  data.clear();
                  homeCallBack(HomeScreen.play);
                },
                child: Text("Play Again"),
                style: TextButton.styleFrom(
                  minimumSize: Size(100, 50),
                  primary: Colors.white,
                  backgroundColor: Colors.teal,
                  onSurface: Colors.grey,
                ),
              )
            ],
          )
        ],
      ),
    ));
  }
}
