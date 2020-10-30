import 'package:atelo_desktop/controller/operation_system/operation_system_controller.dart';
import 'package:atelo_desktop/controller/screen_list.dart';
import 'package:atelo_desktop/localizations/atelo_localizations.dart';
import 'package:atelo_desktop/view/atoms/nav_item/nav_item.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

class Navegation extends StatefulWidget {
  @override
  _NavegationState createState() => _NavegationState();
}

class _NavegationState extends State<Navegation> {
  Color colorContainerItem;
  List<bool> _release = [true, true, true, true];
  List<Widget> _iconList = [
    Icon(MdiIcons.monitor, size: 26),
    Icon(MdiIcons.flaskEmptyOutline, size: 26),
    Icon(MdiIcons.sourceBranch, size: 26),
    Icon(MdiIcons.cloudDownloadOutline, size: 26)
  ];

  @override
  Widget build(BuildContext context) {
    ScreenListController screenListController = Provider.of<ScreenListController>(context);
    OperationSystemController operationSystemController = Provider.of<OperationSystemController>(context);
    List<String> _listLateral = [
      "${AteloLocalizations.of(context).overview}",
      "${AteloLocalizations.of(context).diagnostic}",
      "${AteloLocalizations.of(context).channelChange}",
      "${AteloLocalizations.of(context).update}",
    ];
    return Container(
      decoration: BoxDecoration(color: Color(0xFF1C2834), border: Border.all(width: 0, color: Color(0xFF1C2834))),
      padding: EdgeInsets.only(top: 60),
      child: ListView(
        shrinkWrap: true,
        children: List.generate(_listLateral.length, (index) {
          return Container(
            color: screenListController.currentScreen != null && screenListController.currentScreen == _listLateral[index]
                ? Color(0xFF263545)
                : Color(0xFF1C2834),
            padding: EdgeInsets.only(left: 40),
            child: NavegationItem(
                title: _listLateral[index],
                icon: _iconList[index],
                enable: operationSystemController.operationSystem.flutterProperties.flutterExist && _release[index],
                indexItem: index),
          );
        }),
      ),
    );
  }
}
