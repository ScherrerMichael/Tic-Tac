//Welcome screen for when user started the app.
import 'package:flutter/material.dart';

typedef MenuCallBack = void Function(bool isActive);

class PlayerSelectBar extends StatelessWidget {
  const PlayerSelectBar({this.menuCallback});

  final MenuCallBack menuCallback;

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
            print('One player selected');
            menuCallback(false);
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
            menuCallback(true);
          },
        )
      ],
    ));
  }
}

class Menu extends StatelessWidget {
  const Menu({this.menuCallback});

  final MenuCallBack menuCallback;

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
                PlayerSelectBar(
                  menuCallback: menuCallback,
                )
              ],
            ))));
  }
}
