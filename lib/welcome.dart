//Welcome screen for when user started the app.
import 'package:flutter/material.dart';

enum MenuScreen { playerSelect, playerNames, playGame }

typedef HomeCallBack = void Function(bool isActive);
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
            homeCallBack(false);
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
            homeCallBack(true);
            menuCallBack(MenuScreen.playerNames);
          },
        )
      ],
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

  _MenuState({@required this.homeCallBack}) {}

  var currentScreen = MenuScreen.playerSelect;

  void changeMenuScreen(MenuScreen screen) {
    currentScreen = screen;
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
                if (currentScreen == MenuScreen.playerSelect)
                  PlayerSelectBar(
                    homeCallBack: homeCallBack,
                    menuCallBack: (MenuScreen screen) {
                      setState(() {
                        changeMenuScreen(screen);
                      });
                    },
                  ),
              ],
            ))));
  }
}
