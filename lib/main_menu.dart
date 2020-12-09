import 'package:flutter/material.dart';
import './data.dart';
import './menu.dart';

//Idea: what if rows/columns get added as the game progresses, on a random side??

// Player Selects if the game will be single player or multiplayer
class PlayerSelectBar extends StatelessWidget {
  final GameData data;

  const PlayerSelectBar(
      {@required this.homeCallBack,
      @required this.menuCallBack,
      @required this.data});

  final HomeCallBack homeCallBack;
  final MenuCallBack menuCallBack;

  Widget build(BuildContext buildcontext) {
    return (Column(
      children: [
        SizedBox(
          height: 50,
        ),
        Text(
          "Game Type",
          style: DefaultTextStyle.of(buildcontext)
              .style
              .apply(fontSizeFactor: 2.0),
        ),
        SizedBox(
          height: 50,
        ),
        ButtonBar(
          alignment: MainAxisAlignment.center,
          children: [
            TextButton(
              style: TextButton.styleFrom(
                minimumSize: Size(100, 100),
                primary: Colors.white,
                backgroundColor: Colors.teal,
                onSurface: Colors.grey,
              ),
              child: Icon(Icons.person),
              onPressed: () {
                print('One Player Selected');
                data.isMultiplayer = false;
                homeCallBack(HomeScreen.play);
                // homeCallBack(HomeScreen.icon);
                // menuCallBack(MenuScreen.playerNames);
              },
            ),
            SizedBox(
              width: 25,
            ),
            TextButton(
              style: TextButton.styleFrom(
                minimumSize: Size(100, 100),
                primary: Colors.white,
                backgroundColor: Colors.teal,
                onSurface: Colors.grey,
              ),
              child: Icon(Icons.people),
              onPressed: () {
                print('Two Player Selected');
                data.isMultiplayer = true;
                homeCallBack(HomeScreen.play);
                // homeCallBack(HomeScreen.icon);
                // menuCallBack(MenuScreen.playerNames);
              },
            )
          ],
        ),
        SizedBox(
          height: 20,
        ),
        ButtonBar(
          // button bar 2
          alignment: MainAxisAlignment.center,
          children: [
            TextButton(
              style: TextButton.styleFrom(
                minimumSize: Size(100, 100),
                primary: Colors.white,
                backgroundColor: Colors.teal,
                onSurface: Colors.grey,
              ),
              child: Icon(Icons.star),
              onPressed: () {
                print('customization selected');
                data.isMultiplayer = true;
                homeCallBack(HomeScreen.play);
                // homeCallBack(HomeScreen.icon);
                // menuCallBack(MenuScreen.playerNames);
              },
            ),
            SizedBox(
              width: 25,
            ),
            TextButton(
              style: TextButton.styleFrom(
                minimumSize: Size(100, 100),
                primary: Colors.white,
                backgroundColor: Colors.teal,
                onSurface: Colors.grey,
              ),
              child: Icon(Icons.settings),
              onPressed: () {
                print('Settings Selected');
                homeCallBack(HomeScreen.play);
                // homeCallBack(HomeScreen.icon);
                // menuCallBack(MenuScreen.playerNames);
              },
            )
          ],
        )
      ],
    ));
  }
}
