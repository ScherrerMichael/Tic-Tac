import 'package:flutter/material.dart';
import './data.dart';
import './menu.dart';

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
