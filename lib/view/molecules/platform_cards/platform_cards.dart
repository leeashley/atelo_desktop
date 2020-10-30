import 'package:atelo_desktop/localizations/atelo_localizations.dart';
import 'package:atelo_desktop/model/platform_properties.dart';
import 'package:atelo_desktop/view/atoms/platform_card/platform_card.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class PlatformCards extends StatefulWidget {
  @override
  _PlatformCardsState createState() => _PlatformCardsState();
}

class _PlatformCardsState extends State<PlatformCards> {
  IconData settingIconSystem(String systemName) {
    switch (systemName) {
      case "windows":
        {
          return MdiIcons.microsoftWindows;
        }
        break;
      case "macos":
        {
          return MdiIcons.apple;
        }
        break;
      case "linux":
        {
          return MdiIcons.linux;
        }
        break;
      default:
        {
          return MdiIcons.alert;
        }
    }
  }

  @override
  Widget build(BuildContext context) {
    PlatformProperties platformProperties = PlatformProperties();
    platformProperties.locale = Localizations.localeOf(context).toString();
    IconData iconData = settingIconSystem(platformProperties.name);

    return Container(
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: PlatformCard(
              cardHeight: 105,
              cardColor: Color(0xFF263545),
              cardElevation: 0,
              cardColorShadow: Colors.black,
              icon: iconData,
              iconSize: 40,
              imageWidth: 34,
              textTitle: "${AteloLocalizations.of(context).operationSystem}",
              titleTextColor: Colors.black,
              titleFontFamily: "Montserrat",
              titleColor: Colors.white,
              titleFontSize: 20,
              titleFontWeight: FontWeight.w600,
              textContent: platformProperties.name.toUpperCase(),
              contentFontFamily: "Montserrat",
              contentFontSize: 17,
              contentTextColor: Colors.white,
              contentFontWeight: FontWeight.w600,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 10),
          ),
          Expanded(
            flex: 1,
            child: PlatformCard(
              cardHeight: 105,
              cardColor: Color(0xFF263545),
              cardElevation: 0,
              cardColorShadow: Colors.black,
              icon: MdiIcons.network,
              iconSize: 40,
              imageWidth: 38,
              textTitle: "${AteloLocalizations.of(context).hostname}",
              titleTextColor: Colors.black,
              titleFontFamily: "Montserrat",
              titleColor: Colors.white,
              titleFontSize: 20,
              titleFontWeight: FontWeight.w600,
              textContent: platformProperties.hostName,
              contentFontFamily: "Montserrat",
              contentFontSize: 17,
              contentTextColor: Colors.white,
              contentFontWeight: FontWeight.w600,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 10),
          ),
          Expanded(
            flex: 1,
            child: PlatformCard(
              cardHeight: 105,
              cardColor: Color(0xFF263545),
              cardElevation: 0,
              cardColorShadow: Colors.black,
              icon: MdiIcons.googleTranslate,
              iconSize: 40,
              imageWidth: 31,
              textTitle: "${AteloLocalizations.of(context).localeText}",
              titleTextColor: Colors.black,
              titleFontFamily: "Montserrat",
              titleColor: Colors.white,
              titleFontSize: 20,
              titleFontWeight: FontWeight.w600,
              textContent: platformProperties.locale.toUpperCase(),
              contentFontFamily: "Montserrat",
              contentFontSize: 17,
              contentTextColor: Colors.white,
              contentFontWeight: FontWeight.w600,
            ),
          )
        ],
      ),
    );
  }
}
