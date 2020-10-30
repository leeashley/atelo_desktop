import 'package:atelo_desktop/localizations/atelo_localizations.dart';
import 'package:atelo_desktop/view/atoms/diagnostic_log_temp/diagnostic_log.dart';
import 'package:atelo_desktop/view/atoms/divider_title/text_divider.dart';
import 'package:flutter/material.dart';

class DiagnosticLog extends StatefulWidget {
  @override
  _DiagnosticLogState createState() => _DiagnosticLogState();
}

class _DiagnosticLogState extends State<DiagnosticLog> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DividerTitle(text: "${AteloLocalizations.of(context).yourFlutter.toUpperCase()}", dividerColor: Color(0xFF2BB7F6)),
        DiagnosticLogView(),
      ],
    );
  }
}
