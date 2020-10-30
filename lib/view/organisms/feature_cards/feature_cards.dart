import 'package:atelo_desktop/localizations/atelo_localizations.dart';
import 'package:atelo_desktop/view/molecules/feature_card/feature_card.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class FeatureCards extends StatefulWidget {
  @override
  _FeatureCardsState createState() => _FeatureCardsState();
}

class _FeatureCardsState extends State<FeatureCards> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: FeatureCard(
              cardHeight: 160,
              cardElevation: 3,
              icon: MdiIcons.laptopWindows,
              iconSize: 30,
              titleColor: Colors.black,
              textTitle: "${AteloLocalizations.of(context).flutterInstallation}",
              titleFontFamily: "Montserrat",
              titleTextColor: Colors.black,
              titleFontSize: 13,
              titleFontWeight: FontWeight.w600,
              textContent: "${AteloLocalizations.of(context).flutterInstallationDescription}",
              contentFontFamily: "Montserrat",
              contentFontSize: 13,
              contentTextColor: Colors.black,
              contentFontWeight: FontWeight.w400,
              contentTextAlign: TextAlign.justify,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 10),
          ),
          Expanded(
            flex: 1,
            child: FeatureCard(
              cardHeight: 160,
              cardElevation: 3,
              icon: Icons.settings,
              iconSize: 30,
              titleColor: Colors.black,
              textTitle: "${AteloLocalizations.of(context).environmentVariable}",
              titleFontFamily: "Montserrat",
              titleTextColor: Colors.black,
              titleFontSize: 13,
              titleFontWeight: FontWeight.w600,
              textContent: "${AteloLocalizations.of(context).environmentVariableDescription}",
              contentFontFamily: "Montserrat",
              contentFontSize: 13,
              contentTextColor: Colors.black,
              contentFontWeight: FontWeight.w400,
              contentTextAlign: TextAlign.justify,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 10),
          ),
          Expanded(
            flex: 1,
            child: FeatureCard(
              cardHeight: 160,
              cardElevation: 3,
              icon: Icons.person,
              iconSize: 30,
              titleColor: Colors.black,
              textTitle: "${AteloLocalizations.of(context).user}",
              titleFontFamily: "Montserrat",
              titleTextColor: Colors.black,
              titleFontSize: 13,
              titleFontWeight: FontWeight.w600,
              textContent: "${AteloLocalizations.of(context).userDescription}",
              contentFontFamily: "Montserrat",
              contentFontSize: 13,
              contentTextColor: Colors.black,
              contentFontWeight: FontWeight.w400,
              contentTextAlign: TextAlign.justify,
            ),
          )
        ],
      ),
    );
  }
}
