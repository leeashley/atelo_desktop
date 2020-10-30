import 'package:atelo_desktop/assets/custom_icons.dart';
import 'package:atelo_desktop/localizations/atelo_localizations.dart';
import 'package:atelo_desktop/view/atoms/flat_button_icon_styled/flat_button_icon_styled.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class NavegationFooter extends StatelessWidget {
  openAteloSite() async {
    const url =
        "https://www.paypal.com/donate?token=h7Ry0XnoMVi91q0tK0kyegneJwoqtZg5PJ8WQbDzrbRMbv-NeNvl7Ew0VInxP4yeXxDfusPyhIeoKwE8";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print("Can't open the site: $url");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Color(0xFF1C2834), border: Border.all(width: 0, color: Color(0xFF1C2834))),
      child: Center(
          child: Column(
        children: [
          FlatButtonIconStyled(
            textButton: "${AteloLocalizations.of(context).donate.toUpperCase()}",
            buttonColor: Color(0xFF2BB7F6),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            icon: CustomIcons.attach_money,
            tapFunction: () {
              openAteloSite();
            },
          ),
          Padding(padding: EdgeInsets.only(top: 15)),
          RichText(
            text: TextSpan(
                text: "atelo.unicobit.com",
                style: TextStyle(fontWeight: FontWeight.w400, color: Colors.white, fontSize: 16, letterSpacing: 2)),
          ),
          Padding(padding: EdgeInsets.only(top: 15)),
          RichText(
            text: TextSpan(
                text: "${AteloLocalizations.of(context).ateloVersion} 0.1.0",
                style: TextStyle(fontWeight: FontWeight.w400, color: Colors.white, fontSize: 15, letterSpacing: 1)),
          )
        ],
      )),
    );
  }
}
