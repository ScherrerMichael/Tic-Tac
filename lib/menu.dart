//Welcome screen for when user started the app.
import 'package:flutter/material.dart';

enum MenuScreen { playerSelect, playerNames, playGame }
enum HomeScreen { welcome, play }

typedef HomeCallBack = void Function(HomeScreen state);
typedef MenuCallBack = void Function(MenuScreen state);

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
          child: Text('One Player'),
          onPressed: () {
            print('One Player Selected');
            // homeCallBack(false);
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
          child: Text('Two Player'),
          onPressed: () {
            print('Two Player Selected');
            // homeCallBack(true);
            menuCallBack(MenuScreen.playerNames);
          },
        )
      ],
    ));
  }
}

class PlayerSetup extends StatelessWidget {
  final HomeCallBack homeCallBack;
  final MenuCallBack menuCallBack;
  const PlayerSetup({@required this.homeCallBack, @required this.menuCallBack});

  Widget build(BuildContext buildcontext) {
    return (Container(
      child: TextButton(
        child: Text("button"),
        onPressed: () {
          homeCallBack(HomeScreen.play);
          menuCallBack(MenuScreen.playGame);
        },
      ),
    ));
  }
}

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
            width: 400,
            height: 400,
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
