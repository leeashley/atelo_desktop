import 'package:atelo_desktop/controller/operation_system/operation_system_controller.dart';
import 'package:atelo_desktop/localizations/atelo_localizations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DiagnosticLogView extends StatefulWidget {
  @override
  _DiagnosticLogViewState createState() => _DiagnosticLogViewState();
}

class _DiagnosticLogViewState extends State<DiagnosticLogView> {
  @override
  Widget build(BuildContext context) {
    OperationSystemController operationSystemController = Provider.of<OperationSystemController>(context);
    return Container(
      margin: EdgeInsets.only(left: 0, right: 0),
      constraints: BoxConstraints(minHeight: 150, minWidth: double.maxFinite),
      decoration: BoxDecoration(
        color: Color(0xFF02589B),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Visibility(
                  visible: !operationSystemController.operationSystem.startDiagnostic &&
                      !operationSystemController.operationSystem.endDiagnostic,
                  child: Text(
                    "${AteloLocalizations.of(context).diagnosticLogPlaceholder}",
                    style: TextStyle(color: Colors.white, fontSize: 14, fontFamily: "Montserrat"),
                  ),
                ),
                StreamBuilder(
                  stream: operationSystemController.diagnosticStream.stream,
                  builder: (BuildContext context, AsyncSnapshot<String> snaptshot) {
                    return Visibility(
                      visible: (snaptshot.data == "startDiagnostic" || snaptshot.data == null) &&
                          operationSystemController.operationSystem.startDiagnostic,
                      replacement: Text(
                        snaptshot.data != null ? snaptshot.data : "",
                        style: TextStyle(color: Colors.white, fontSize: 14, fontFamily: "Montserrat"),
                      ),
                      child: Text(
                        "${AteloLocalizations.of(context).waitDiagnosis}",
                        style: TextStyle(color: Colors.white, fontSize: 14, fontFamily: "Montserrat"),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
