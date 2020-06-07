import 'package:flutter/material.dart';
import 'package:nubank/pages/home/widgets/first_card.dart';
import 'package:nubank/pages/home/widgets/secont_card.dart';

import 'card_app.dart';

class PageViewApp extends StatelessWidget {
  final double top;
  final ValueChanged<int> onChanged;
  final GestureDragUpdateCallback onPanUpdate;
  final bool showMenu;
  const PageViewApp({Key key, this.top, this.onChanged, this.onPanUpdate, this.showMenu}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: Duration(milliseconds: 300),
      top: top,
      curve: Curves.easeOut,
      height: MediaQuery.of(context).size.height * .45,
      left: 0,
      right: 0,
      child: GestureDetector(
        onPanUpdate: onPanUpdate, //evento de clicar no item e mover
        child: PageView(
          onPageChanged: onChanged,
          physics: showMenu ? NeverScrollableScrollPhysics() :BouncingScrollPhysics(),
          children: <Widget>[
            CardApp(child: FirstCard(),),
            CardApp(child: SecontCard(),),
            CardApp(child: FirstCard(),),
          ],
        ),
      ),
    );
  }
}
