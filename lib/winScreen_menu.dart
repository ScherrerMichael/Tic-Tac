import 'package:flutter/material.dart';
import './data.dart';
import './menu.dart';

// Player winning screen
class WinScreen extends StatelessWidget {
  final GameData data;

  const WinScreen(
      {@required this.homeCallBack,
      @required this.menuCallBack,
      @required this.data});

  final HomeCallBack homeCallBack;
  final MenuCallBack menuCallBack;

  Widget build(BuildContext buildcontext) {
    return (Text('${data.currentPlayerTurn} wins!'));
  }
}
