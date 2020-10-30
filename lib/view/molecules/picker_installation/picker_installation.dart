import 'package:atelo_desktop/controller/operation_system/operation_system_controller.dart';
import 'package:atelo_desktop/view/atoms/flat_button_icon_styled/flat_button_icon_styled.dart';
import 'package:atelo_desktop/view/atoms/pick_folder/pick_folder.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

class PickerInstallation extends StatefulWidget {
  final BuildContext buildContext;
  const PickerInstallation({Key key, this.buildContext}) : super(key: key);
  @override
  _PickerInstallationState createState() => _PickerInstallationState();
}

class _PickerInstallationState extends State<PickerInstallation> {
  @override
  Widget build(BuildContext context) {
    OperationSystemController operationSystemController = Provider.of<OperationSystemController>(context);
    return Container(
      child: Column(
        children: [
          RichText(
            text: TextSpan(
              text: "Flutter não encontrado, deseja instalar?",
              style: TextStyle(
                  color: Colors.black, fontFamily: "Montserrat", fontSize: 14, fontWeight: FontWeight.w600, letterSpacing: 1),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 20),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 4,
                child: PickFolder(
                  parentContext: widget.buildContext,
                ),
              ),
              Flexible(
                flex: 2,
                child: FlatButtonIconStyled(
                  buttonMinWidth: 200,
                  icon: MdiIcons.arrowDownCircleOutline,
                  iconSize: 24,
                  buttonColor: Color(0xFF72D1FC),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  textButton: "INSTALAR",
                  fontWeight: FontWeight.w300,
                  fontSize: 17,
                  tapFunction: operationSystemController.operationSystem.installationSelectedPath != "Escolha o diretório."
                      ? () async {
                          await operationSystemController.startInstallationFlutter(widget.buildContext);
                        }
                      : null,
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  // @override
  // void dispose() {
  //   downloadFlutterStream.close();
  //   super.dispose();
  // }
}
