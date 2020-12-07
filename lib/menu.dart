//Welcome screen for when user started the app.
import 'package:flutter/material.dart';
import './data.dart';

enum MenuScreen { playerSelect, playerNames, playGame }
enum HomeScreen { welcome, icon, play }

typedef HomeCallBack = void Function(HomeScreen state);
typedef MenuCallBack = void Function(MenuScreen state);

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
        Text("Game Type"),
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
                homeCallBack(HomeScreen.icon);
                menuCallBack(MenuScreen.playerNames);
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
                // homeCallBack(HomeScreen.icon);
                menuCallBack(MenuScreen.playerNames);
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
              child: Icon(Icons.bluetooth),
              onPressed: () {
                print('One Player Selected');
                data.isMultiplayer = false;
                homeCallBack(HomeScreen.icon);
                menuCallBack(MenuScreen.playerNames);
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
                print('Two Player Selected');
                data.isMultiplayer = true;
                // homeCallBack(HomeScreen.icon);
                menuCallBack(MenuScreen.playerNames);
              },
            )
          ],
        )
      ],
    ));
  }
}

// Here The player will select thier icons from a scrollable list, then they may press play
class PlayerSetup extends StatefulWidget {
  final HomeCallBack homeCallBack;
  final MenuCallBack menuCallBack;
  final GameData data;

  PlayerSetup(
      {@required this.homeCallBack,
      @required this.menuCallBack,
      @required this.data});

  _PlayerSetupState createState() => _PlayerSetupState(
      homeCallBack: this.homeCallBack,
      menuCallBack: this.menuCallBack,
      data: this.data);
}

class _PlayerSetupState extends State<PlayerSetup> {
  final HomeCallBack homeCallBack;
  final MenuCallBack menuCallBack;
  final GameData data;

  _PlayerSetupState(
      {@required this.homeCallBack,
      @required this.menuCallBack,
      @required this.data});

  final List<String> stringList = ["X", "O"];

  // TODO: this is very bad, using this as an example for listview currently.
  final List<String> items = List<String>.generate(2, (i) => "Item $i");

  Widget build(BuildContext buildcontext) {
    return (Column(
      children: [
        Text("Player Customization"),
        SizedBox(
          height: 50,
        ),
        Container(
          width: 400,
          height: 400,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Player 1 Icon: ${data.playerOneIcon}"),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Expanded(
                  child: ListView.builder(
                      // exmaple list view!!!
                      clipBehavior: Clip.hardEdge,
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                  child: Text(stringList[index]),
                                  onPressed: () {
                                    data.playerOneIcon = stringList[index];
                                    setState(() {});
                                  }),
                            ],
                          ),
                        );
                      })),
              TextButton(
                child: Text("Confirm"),
                style: TextButton.styleFrom(
                  minimumSize: Size(100, 50),
                  primary: Colors.white,
                  backgroundColor: Colors.teal,
                  onSurface: Colors.grey,
                ),
                onPressed: () {
                  print("player 1 confirmed");
                  homeCallBack(HomeScreen.play);
                },
              )
            ],
          ),
        )
      ],
    ));
  }
}

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
