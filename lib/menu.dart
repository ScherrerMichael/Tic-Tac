//Welcome screen for when user started the app.
import 'package:flutter/material.dart';
import './data.dart';
import './main_menu.dart';
import './player_setup_menu.dart';
import './winScreen_menu.dart';

enum MenuScreen { main, playerSetup, bluetooth, winScreen, settings }
enum HomeScreen { welcome, icon, play }

typedef HomeCallBack = void Function(HomeScreen state);
typedef MenuCallBack = void Function(MenuScreen state);

// The menu widget to hold all of the screens
class Menu extends StatefulWidget {
  final HomeCallBack homeCallBack;
  final GameData data;
  final MenuScreen currentScreen;
  Menu(
      {@required this.homeCallBack,
      @required this.data,
      @required this.currentScreen});

  _MenuState createState() => _MenuState(
      homeCallBack: homeCallBack,
      data: this.data,
      currentScreen: this.currentScreen);
}

class _MenuState extends State<Menu> {
  HomeCallBack homeCallBack;
  final GameData data;
  var currentScreen = MenuScreen.main;

  _MenuState(
      {@required this.homeCallBack,
      @required this.data,
      @required this.currentScreen});

  // var currentScreen = MenuScreen.main;

  void changeMenuScreen(MenuScreen screen) {
    currentScreen = screen;
  }

  Widget showScreen(MenuScreen screen) {
    switch (screen) {
      case MenuScreen.main:
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

      case MenuScreen.playerSetup:
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

      case MenuScreen.winScreen:
        {
          return WinScreen(
              data: this.data,
              homeCallBack: homeCallBack,
              menuCallBack: (MenuScreen screen) {
                setState(() {
                  changeMenuScreen(screen);
                });
              });
        }
        break;

      default:
        {
          return (Text('current screen: $currentScreen'));
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
