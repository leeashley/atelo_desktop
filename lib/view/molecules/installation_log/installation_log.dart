import 'package:atelo_desktop/controller/operation_system/operation_system_controller.dart';
import 'package:atelo_desktop/view/atoms/expection_window/exception_window.dart';
import 'package:atelo_desktop/view/atoms/log_view/log_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InstallationLog extends StatefulWidget {
  final BuildContext buildContext;

  const InstallationLog({Key key, this.buildContext}) : super(key: key);
  @override
  _InstallationLogState createState() => _InstallationLogState();
}

class _InstallationLogState extends State<InstallationLog> {
  @override
  Widget build(BuildContext context) {
    OperationSystemController operationSystemController = Provider.of<OperationSystemController>(context);
    return LogView(
      logWidget: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          StreamBuilder(
              stream: operationSystemController.downloadStream.stream,
              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                return Visibility(
                  visible: operationSystemController.operationSystem.startInstallation,
                  child: RichText(
                    text: TextSpan(
                      text: "- ${operationSystemController.operationSystem.logTextDownloadFlutter}",
                      style: TextStyle(fontFamily: "Montserrat", color: Colors.white, fontWeight: FontWeight.w400, fontSize: 16),
                      children: <TextSpan>[
                        TextSpan(
                          text: snapshot.data != null ? "   ${snapshot.data}" : " O download já vai iniciar",
                          style: TextStyle(
                              fontFamily: "Montserrat",
                              color: operationSystemController.operationSystem.downloadedFlutter ? Colors.green : Colors.yellow,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                );
              }),
          Visibility(
            visible: operationSystemController.operationSystem.downloadedFlutter,
            child: LayoutBuilder(
              builder: (context, constraints) {
                if (!operationSystemController.operationSystem.settingEnvironmentFlutter) {
                  Future.delayed(Duration(seconds: 2)).then((value) => {
                        Provider.of<OperationSystemController>(context, listen: false).setEnvironment(widget.buildContext),
                      });
                }
                return RichText(
                  text: TextSpan(
                    text: "- Configurando a variável de ambiente...",
                    style: TextStyle(fontFamily: "Montserrat", color: Colors.white, fontWeight: FontWeight.w400, fontSize: 16),
                    children: <TextSpan>[
                      TextSpan(
                          text: operationSystemController.operationSystem.settingEnvironmentFlutter ? "   OK" : "",
                          style: TextStyle(
                              fontFamily: "Montserrat",
                              color: operationSystemController.operationSystem.settingEnvironmentFlutter
                                  ? Colors.greenAccent
                                  : Colors.redAccent,
                              fontWeight: FontWeight.bold,
                              fontSize: 18)),
                    ],
                  ),
                );
              },
            ),
          ),
          Visibility(
            visible: operationSystemController.operationSystem.settingEnvironmentFlutter,
            child: LayoutBuilder(
              builder: (context, constraints) {
                if (!operationSystemController.operationSystem.updatedFlutter) {
                  ExceptionWindowCustom exceptionWindowCustom = ExceptionWindowCustom(widget.buildContext);
                  Provider.of<OperationSystemController>(context, listen: false)
                      .updateFlutter(widget.buildContext)
                      .then((result) => {
                            if (result == "success")
                              {
                                operationSystemController.operationSystem.updatedFlutter = true,
                                operationSystemController.operationSystem.installFinish = true,
                                operationSystemController.notifyListeners(),
                              }
                            else
                              {
                                operationSystemController.operationSystem.startInstallation = false,
                                operationSystemController.operationSystem.settingEnvironmentFlutter = false,
                                operationSystemController.operationSystem.downloadedFlutter = false,
                                operationSystemController.errorInstallation = true,
                                operationSystemController.notifyListeners(),
                                exceptionWindowCustom.showMyDialog(
                                  title: "Error na instalação do Flutter.",
                                  messageError: result,
                                  closeButtonFunction: () {
                                    Navigator.of(widget.buildContext).pop();
                                  },
                                ),
                              }
                          });
                }
                return RichText(
                  text: TextSpan(
                    text: "- Atualizando o Flutter...",
                    style: TextStyle(fontFamily: "Montserrat", color: Colors.white, fontWeight: FontWeight.w400, fontSize: 16),
                    children: <TextSpan>[
                      TextSpan(
                          text: operationSystemController.operationSystem.updatedFlutter ? "   OK" : "",
                          style: TextStyle(
                              fontFamily: "Montserrat",
                              color: operationSystemController.operationSystem.updatedFlutter
                                  ? Colors.greenAccent
                                  : Colors.redAccent,
                              fontWeight: FontWeight.bold,
                              fontSize: 18)),
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
