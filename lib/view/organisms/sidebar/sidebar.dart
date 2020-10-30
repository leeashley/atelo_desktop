import 'package:atelo_desktop/view/atoms/logo/logo.dart';
import 'package:atelo_desktop/view/molecules/navegation/navegation.dart';
import 'package:atelo_desktop/view/molecules/navegation_footer/navegation_footer.dart';
import 'package:flutter/material.dart';

class Sidebar extends StatefulWidget {
  const Sidebar({Key key}) : super(key: key);

  @override
  _SidebarState createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Logo(),
        ),
        Expanded(
          flex: 5,
          child: Navegation(),
        ),
        Expanded(
          flex: 2,
          child: NavegationFooter(),
        ),
      ],
    ); //);
  }
}
