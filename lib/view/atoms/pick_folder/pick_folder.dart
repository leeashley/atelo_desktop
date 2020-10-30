import 'package:atelo_desktop/controller/operation_system/operation_system_controller.dart';
import 'package:file_chooser/file_chooser.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

class PickFolder extends StatefulWidget {
  final BuildContext parentContext;

  const PickFolder({Key key, this.parentContext}) : super(key: key);
  @override
  _PickFolderState createState() => _PickFolderState();
}

class _PickFolderState extends State<PickFolder> {
  @override
  Widget build(BuildContext context) {
    OperationSystemController operationSystemController = Provider.of<OperationSystemController>(context);
    return Stack(
      alignment: AlignmentDirectional.centerEnd,
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 10),
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(width: 2, color: Color(0xFF2BB7F6)),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                textAlign: TextAlign.start,
                text: TextSpan(
                  text: operationSystemController.operationSystem.installationSelectedPath,
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Color(0xFF72D1FC),
            borderRadius: BorderRadius.only(topRight: Radius.circular(8), bottomRight: Radius.circular(8)),
          ),
          child: IconButton(
            icon: Icon(MdiIcons.folderOutline),
            onPressed: () async {
              print("CLICOU EM INSTALAR O FLUTTER");
              FileChooserResult fileChooserResult = await showSavePanel(suggestedFileName: "none");
              await operationSystemController.setSelectedPathForInstallation(fileChooserResult, widget.parentContext);
            },
          ),
        ),
      ],
    );
  }
}
