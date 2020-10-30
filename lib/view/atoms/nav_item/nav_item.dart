import 'package:atelo_desktop/controller/screen_controller/screen_controller.dart';
import 'package:atelo_desktop/controller/screen_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NavegationItem extends StatefulWidget {
  final int indexItem;
  final String title;
  final Icon icon;
  final bool enable;

  const NavegationItem({
    Key key,
    this.indexItem,
    this.icon,
    @required this.title,
    @required this.enable,
  }) : super(key: key);
  @override
  _NavegationItemState createState() => _NavegationItemState();
}

class _NavegationItemState extends State<NavegationItem> {
  @override
  Widget build(BuildContext context) {
    ScreenController screenController = Provider.of<ScreenController>(context);
    ScreenListController screenListController = Provider.of<ScreenListController>(context);
    return Container(
      child: ListTileTheme(
        textColor: Color(0xFFFFFFFF),
        iconColor: Color(0xFFFFFFFF),
        child: ListTile(
          contentPadding: EdgeInsets.zero,
          leading: widget.icon,
          title: Text(
            widget.title,
            style: TextStyle(fontSize: 15, fontFamily: 'Montserrat', fontWeight: FontWeight.w600),
            textAlign: TextAlign.left,
          ),
          onTap: () {
            screenController.goToScreen(widget.title);
            screenListController.setCurrentScreen(widget.title);
          },
          enabled: widget.enable,
        ),
      ),
    );
  }
}
