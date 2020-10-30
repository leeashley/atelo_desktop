import 'package:atelo_desktop/controller/operation_system/operation_system_controller.dart';
import 'package:atelo_desktop/localizations/atelo_localizations.dart';
import 'package:atelo_desktop/view/atoms/flat_button_icon_styled/flat_button_icon_styled.dart';
import 'package:atelo_desktop/view/atoms/progress_indicator/progress_indicator.dart';
import 'package:atelo_desktop/view/atoms/screen_title/text_icon_horizontal.dart';
import 'package:atelo_desktop/view/molecules/diagnostic_log/diagnostic_log.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DiagnosticTemplate extends StatefulWidget {
  @override
  _DiagnosticTemplateState createState() => _DiagnosticTemplateState();
}

class _DiagnosticTemplateState extends State<DiagnosticTemplate> {
  @override
  Widget build(BuildContext context) {
    OperationSystemController operationSystemController = Provider.of<OperationSystemController>(context);
    return Column(
      children: [
        ScreenTitle(
          icon: Icons.arrow_right,
          iconSize: 50,
          text: "${AteloLocalizations.of(context).diagnostic}",
          fontFamily: "Montserrat",
          fontSize: 20,
          fontWeight: FontWeight.w600,
          letterSpacing: 2,
          color: Colors.black,
        ),
        Container(
          margin: EdgeInsets.only(top: 10, bottom: 10),
          child: Container(
              alignment: Alignment.topLeft,
              child: RichText(
                textAlign: TextAlign.justify,
                text: TextSpan(
                  text: "${AteloLocalizations.of(context).diagnosticDescription}",
                  style: TextStyle(
                    fontFamily: "Montserrat",
                    fontSize: 15,
                    fontWeight: FontWeight.w200,
                    color: Color(0xFF000000),
                  ),
                ),
              )),
        ),
        Container(
          padding: EdgeInsets.only(top: 20),
          alignment: Alignment.center,
          child: Column(
            children: [
              DiagnosticLog(),
              Padding(
                padding: EdgeInsets.only(top: 10, bottom: 10),
              ),
              Visibility(
                  visible: operationSystemController.operationSystem.startDiagnostic,
                  child: CustomProgressIndicator(padding: 10, valueColor: AlwaysStoppedAnimation(Color(0xFF2BB7F6)))),
              FlatButtonIconStyled(
                  icon: Icons.play_arrow,
                  shape: null,
                  buttonMinWidth: 200,
                  textButton: "${AteloLocalizations.of(context).executeButton}",
                  fontSize: 17,
                  fontWeight: FontWeight.w300,
                  buttonColor: Color(0xFF2BB7F6),
                  tapFunction: operationSystemController.operationSystem.startDiagnostic
                      ? null
                      : () {
                          operationSystemController.diagnosticFlutter();
                        }),
            ],
          ),
        ),
      ],
    );
  }

  @override
  void initState() {
    Provider.of<OperationSystemController>(context, listen: false).operationSystem.startDiagnostic = false;
    Provider.of<OperationSystemController>(context, listen: false).operationSystem.endDiagnostic = false;
    super.initState();
  }
}
