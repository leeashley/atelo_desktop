import 'package:atelo_desktop/localizations/atelo_localizations.dart';
import 'package:atelo_desktop/view/screens/overview.dart';
import 'package:atelo_desktop/view/templates/channel_template.dart';
import 'package:atelo_desktop/view/templates/diagnostic_template.dart';
import 'package:atelo_desktop/view/templates/update_template.dart';
import 'package:flutter/material.dart';

class Screens extends StatelessWidget {
  final String sideBarOptions;

  const Screens({Key key, this.sideBarOptions}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    if (sideBarOptions == "${AteloLocalizations.of(context).overview}") {
      return Overview();
    } else if (sideBarOptions == "${AteloLocalizations.of(context).diagnostic}") {
      return DiagnosticTemplate();
    } else if (sideBarOptions == "${AteloLocalizations.of(context).update}") {
      return UpdateTemplate();
    } else if (sideBarOptions == "${AteloLocalizations.of(context).channelChange}") {
      return ChannelTemplate();
    } else {
      return Container(
        child: Center(
          child: Text("Não foi possível identificar a opção escolhida"),
        ),
      );
    }
  }
}
