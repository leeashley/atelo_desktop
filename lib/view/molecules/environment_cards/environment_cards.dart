import 'package:atelo_desktop/controller/operation_system/operation_system_controller.dart';
import 'package:atelo_desktop/localizations/atelo_localizations.dart';
import 'package:atelo_desktop/view/atoms/environment_card/environment_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EnvironmentCards extends StatefulWidget {
  @override
  _EnvironmentCardsState createState() => _EnvironmentCardsState();
}

class _EnvironmentCardsState extends State<EnvironmentCards> {
  @override
  Widget build(BuildContext context) {
    OperationSystemController operationSystemController = Provider.of<OperationSystemController>(context);
    return Container(
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: EnvironmentCard(
              cardHeight: 105,
              cardColor: Color(0xFF263545),
              cardElevation: 0,
              cardColorShadow: Colors.black,
              image: AssetImage('assets/logo_flutter.png'),
              imageWidth: 34,
              textTitle: "${AteloLocalizations.of(context).flutter}",
              titleTextColor: Colors.black,
              titleFontFamily: "Montserrat",
              titleColor: Colors.white,
              titleFontSize: 22,
              titleFontWeight: FontWeight.w600,
              textContent: operationSystemController.operationSystem.flutterProperties.flutterVersion.trim(),
              contentFontFamily: "Montserrat",
              contentFontSize: 15,
              contentTextColor: Colors.white,
              contentFontWeight: FontWeight.w600,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 10),
          ),
          Expanded(
            flex: 1,
            child: EnvironmentCard(
              cardHeight: 105,
              cardColor: Color(0xFF263545),
              cardElevation: 0,
              cardColorShadow: Colors.black,
              image: AssetImage('assets/logo_dart.png'),
              imageWidth: 38,
              textTitle: "${AteloLocalizations.of(context).dart}",
              titleTextColor: Colors.black,
              titleFontFamily: "Montserrat",
              titleColor: Colors.white,
              titleFontSize: 22,
              titleFontWeight: FontWeight.w600,
              textContent: operationSystemController.operationSystem.flutterProperties.dartVersion.trim(),
              contentFontFamily: "Montserrat",
              contentFontSize: 15,
              contentTextColor: Colors.white,
              contentFontWeight: FontWeight.w600,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 10),
          ),
          Expanded(
            flex: 1,
            child: EnvironmentCard(
              cardHeight: 105,
              cardColor: Color(0xFF263545),
              cardElevation: 0,
              cardColorShadow: Colors.black,
              image: AssetImage('assets/channel.png'),
              //imageHeight: 50,
              imageWidth: 31,
              textTitle: "${AteloLocalizations.of(context).channel}",
              titleTextColor: Colors.black,
              titleFontFamily: "Montserrat",
              titleColor: Colors.white,
              titleFontSize: 22,
              titleFontWeight: FontWeight.w600,
              textContent: operationSystemController.operationSystem.flutterProperties.flutterChannel.trim(),
              contentFontFamily: "Montserrat",
              contentFontSize: 15,
              contentTextColor: Colors.white,
              contentFontWeight: FontWeight.w600,
            ),
          )
        ],
      ),
    );
  }
}
