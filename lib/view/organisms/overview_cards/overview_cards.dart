import 'package:atelo_desktop/localizations/atelo_localizations.dart';
import 'package:atelo_desktop/view/atoms/divider_title/text_divider.dart';
import 'package:atelo_desktop/view/molecules/environment_cards/environment_cards.dart';
import 'package:atelo_desktop/view/molecules/platform_cards/platform_cards.dart';
import 'package:flutter/material.dart';

class OverviewCards extends StatefulWidget {
  @override
  _OverviewCardsState createState() => _OverviewCardsState();
}

class _OverviewCardsState extends State<OverviewCards> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: Column(
        children: [
          DividerTitle(text: "${AteloLocalizations.of(context).yourEnvironment}", dividerColor: Color(0xFF2BB7F6)),
          EnvironmentCards(),
          DividerTitle(text: "${AteloLocalizations.of(context).yourPlatform}", dividerColor: Color(0xFF2BB7F6)),
          PlatformCards(),
        ],
      ),
    );
  }
}
