//Welcome screen for when user started the app.
import 'package:flutter/material.dart';

typedef MenuCallBack = void Function(bool isActive);

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
                  height: 100,
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
                      child: Text('One Player'),
                      onPressed: () {
                        print('One player selected');
                        menuCallback(true);
                      },
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
                )
              ],
            ))));
  }
}
