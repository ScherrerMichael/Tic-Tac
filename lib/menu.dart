//Welcome screen for when user started the app.
import 'package:flutter/material.dart';
import './data.dart';
import './main_menu.dart';
import './player_setup_menu.dart';

enum MenuScreen { playerSelect, playerNames, bluetooth, settings, playGame }
enum HomeScreen { welcome, icon, play }

typedef HomeCallBack = void Function(HomeScreen state);
typedef MenuCallBack = void Function(MenuScreen state);

// The menu widget to hold all of the screens
class Menu extends StatefulWidget {
  final HomeCallBack homeCallBack;
  final GameData data;
  Menu({@required this.homeCallBack, @required this.data});

  _MenuState createState() =>
      _MenuState(homeCallBack: homeCallBack, data: this.data);
}

class _MenuState extends State<Menu> {
  HomeCallBack homeCallBack;
  final GameData data;

  _MenuState({@required this.homeCallBack, @required this.data});

  var currentScreen = MenuScreen.playerSelect;

  void changeMenuScreen(MenuScreen screen) {
    currentScreen = screen;
  }

  Widget showScreen(MenuScreen screen) {
    switch (screen) {
      case MenuScreen.playerSelect:
        {
          return PlayerSelectBar(
              data: this.data,
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
              data: this.data,
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
          return Text("playing the game");
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
      color: Colors.amber,
      child: showScreen(currentScreen),
    )));
  }
}
