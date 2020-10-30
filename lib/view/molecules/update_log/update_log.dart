import 'package:atelo_desktop/controller/operation_system/operation_system_controller.dart';
import 'package:atelo_desktop/view/atoms/log_view/log_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UpdateLog extends StatefulWidget {
  final String logLine;

  const UpdateLog({Key key, this.logLine}) : super(key: key);
  @override
  _UpdateLogState createState() => _UpdateLogState();
}

class _UpdateLogState extends State<UpdateLog> {
  @override
  Widget build(BuildContext context) {
    OperationSystemController operationSystemController = Provider.of<OperationSystemController>(context);
    return LogView(
      logWidget: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              text: widget.logLine,
              style: TextStyle(fontFamily: "Montserrat", color: Colors.white, fontWeight: FontWeight.w400, fontSize: 16),
              children: <TextSpan>[
                TextSpan(
                    text: operationSystemController.operationSystem.updatedFlutter ? "   OK" : "",
                    style: TextStyle(
                        fontFamily: "Montserrat",
                        color: operationSystemController.operationSystem.updatedFlutter ? Colors.greenAccent : Colors.redAccent,
                        fontWeight: FontWeight.bold,
                        fontSize: 18)),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    Provider.of<OperationSystemController>(context, listen: false).operationSystem.updatedFlutter = false;
    super.initState();
  }
}
