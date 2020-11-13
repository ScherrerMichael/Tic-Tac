//Welcome screen for when user started the app.
import 'dart:js';

import 'package:flutter/material.dart';

enum MenuScreen { playerSelect, playerNames, playGame }
enum HomeScreen { welcome, icon, play }

typedef HomeCallBack = void Function(HomeScreen state);
typedef MenuCallBack = void Function(MenuScreen state);

// Player Selects if the game will be single player or multiplayer
class PlayerSelectBar extends StatelessWidget {
  const PlayerSelectBar(
      {@required this.homeCallBack, @required this.menuCallBack});

  final HomeCallBack homeCallBack;
  final MenuCallBack menuCallBack;

  Widget build(BuildContext buildcontext) {
    return (ButtonBar(
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
            homeCallBack(HomeScreen.icon);
            menuCallBack(MenuScreen.playerNames);
          },
        ),
        SizedBox(
          width: 50,
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
            homeCallBack(HomeScreen.icon);
            menuCallBack(MenuScreen.playerNames);
          },
        )
      ],
    ));
  }
}

// Here The player will select thier icons from a scrollable list, then they may press play
class PlayerSetup extends StatelessWidget {
  final HomeCallBack homeCallBack;
  final MenuCallBack menuCallBack;
  PlayerSetup({@required this.homeCallBack, @required this.menuCallBack});

  // TODO: this is very bad, using this as an example for listview currently.
  List<String> items = List<String>.generate(100, (i) => "Item $i");

  Widget build(BuildContext buildcontext) {
    return (Container(
      width: 400,
      height: 400,
      child: Column(
        children: [
          Row(
            children: [
              Text("Player 1 Icon: "),
              Icon(Icons.android_outlined),
            ],
          ),
          Expanded(
              child: ListView.builder(
                  // exmaple list view!!!
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text('${items[index]}'),
                    );
                  }))
        ],
      ),
    ));
  }

  // child: TextButton(
  //   child: Text("button"),
  //   onPressed: () {
  //     homeCallBack(HomeScreen.play);
  //     menuCallBack(MenuScreen.playGame);
  //   },
  // ),

}

// The menu widget to hold all of the screens
class Menu extends StatefulWidget {
  final HomeCallBack homeCallBack;
  Menu({@required this.homeCallBack});

  _MenuState createState() => _MenuState(homeCallBack: homeCallBack);
}

class _MenuState extends State<Menu> {
  HomeCallBack homeCallBack;

  _MenuState({@required this.homeCallBack});

  //var currentScreen = MenuScreen.playerSelect;
  var currentScreen = MenuScreen.playerSelect;

  void changeMenuScreen(MenuScreen screen) {
    currentScreen = screen;
  }

  StatelessWidget showScreen(MenuScreen screen) {
    switch (screen) {
      case MenuScreen.playerSelect:
        {
          return PlayerSelectBar(
              homeCallBack: homeCallBack,
              menuCallBack: (MenuScreen screen) {
                setState(() {
                  changeMenuScreen(screen);
                });
              });
        }
        break;

      case MenuScreen.playerNames:
        {
          return PlayerSetup(
              homeCallBack: homeCallBack,
              menuCallBack: (MenuScreen screen) {
                setState(() {
                  changeMenuScreen(screen);
                });
              });
        }
        break;

      case MenuScreen.playGame:
        {
          return (Text("play gmae"));
        }
        break;

      default:
        {
          return (Text("oops!"));
        }
        break;
    }
  }

  @override
  Widget build(BuildContext buildContext) {
    return (Center(
        child: Container(
            width: 500,
            color: Colors.amber,
            child: Column(
              children: [
                Text('Choose your game type'),
                SizedBox(
                  height: 150,
                ),
                showScreen(currentScreen),
              ],
            ))));
  }
}
