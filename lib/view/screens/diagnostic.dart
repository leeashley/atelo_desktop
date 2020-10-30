import 'package:atelo_desktop/view/templates/diagnostic_template.dart';
import 'package:flutter/material.dart';

class Diagnostic extends StatefulWidget {
  @override
  _DiagnosticState createState() => _DiagnosticState();
}

class _DiagnosticState extends State<Diagnostic> {
  @override
  Widget build(BuildContext context) {
    return DiagnosticTemplate();
  }
}
