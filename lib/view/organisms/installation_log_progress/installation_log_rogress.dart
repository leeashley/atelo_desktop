import 'package:atelo_desktop/controller/operation_system/operation_system_controller.dart';
import 'package:atelo_desktop/view/atoms/flat_button_icon_styled/flat_button_icon_styled.dart';
import 'package:atelo_desktop/view/atoms/progress_indicator/progress_indicator.dart';
import 'package:atelo_desktop/view/molecules/installation_log/installation_log.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

class InstallationLogProgress extends StatefulWidget {
  final BuildContext context;
  const InstallationLogProgress({Key key, this.context}) : super(key: key);
  @override
  _ProgressLogState createState() => _ProgressLogState();
}

class _ProgressLogState extends State<InstallationLogProgress> {
  @override
  Widget build(BuildContext context) {
    OperationSystemController operationSystemController = Provider.of<OperationSystemController>(context);
    return Container(
      child: Visibility(
        visible: !operationSystemController.errorInstallation,
        child: Column(
          children: [
            InstallationLog(
              buildContext: widget.context,
            ),
            Visibility(
              visible: operationSystemController.operationSystem.installFinish,
              replacement: Visibility(
                child: Container(
                  width: 820,
                  child: Column(
                    children: [
                      CustomProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(Color(0xFF2BB7F6)),
                        textToLoading: "Instalando o Flutter...",
                      ),
                    ],
                  ),
                ),
              ),
              child: Container(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: Text(
                        "Instalação finalizada com sucesso!",
                        style: TextStyle(color: Colors.black, letterSpacing: 1, fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                    ),
                    FlatButtonIconStyled(
                      textButton: "Carregar Ambiente",
                      icon: MdiIcons.reload,
                      buttonColor: Color(0xFF2BB7F6),
                      tapFunction: () {
                        operationSystemController.loadFlutterProperties(widget.context);
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
