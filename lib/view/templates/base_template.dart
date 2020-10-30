import 'package:atelo_desktop/atelo_version/atelo_version.dart';
import 'package:atelo_desktop/controller/operation_system/operation_system_controller.dart';
import 'package:atelo_desktop/controller/screen_controller/screen_controller.dart';
import 'package:atelo_desktop/localizations/atelo_localizations.dart';
import 'package:atelo_desktop/view/organisms/sidebar/sidebar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BaseTemplate extends StatefulWidget {
  String newVersion = "Not Exist";
  @override
  _BaseTemplateState createState() => _BaseTemplateState();
}

class _BaseTemplateState extends State<BaseTemplate> {
  bool isLoading = true;
  bool flutterExist = false;

  @override
  Widget build(BuildContext context) {
    // bool newVersion = false;

    // ateloVersion.checkUpdate().then((result) => {
    //       setState(() {
    //         newVersion = result;
    //       }),
    //     });
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(flex: 1, child: Sidebar()),
        Expanded(
          flex: 4,
          child: Column(
            children: [
              Container(
                height: 0.6,
                color: Color(0xFF1C2834),
              ),
              Flexible(
                flex: 20,
                child: Container(
                  padding: EdgeInsets.only(left: 25, right: 25, bottom: 25, top: 15),
                  color: Colors.white,
                  child: Consumer<ScreenController>(
                    builder: (context, managerContainer, widget) {
                      return managerContainer.screen;
                    },
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                //fit: FlexFit.tight,
                child: Column(
                  children: [
                    Visibility(
                      visible: widget.newVersion == "${AteloLocalizations.of(context).newVersionAtelo}" ||
                          widget.newVersion == "${AteloLocalizations.of(context).ateloVersionError}",
                      child: Container(
                        color: Colors.white,
                        alignment: Alignment.center,
                        child: Text(
                          widget.newVersion,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color(0xFF263545), fontFamily: "Montserrat", fontWeight: FontWeight.w700, fontSize: 16),
                        ),
                      ),
                    ),
                    Container(
                      color: Colors.white,
                      alignment: Alignment.center,
                      child: Text(
                        "Licença MIT",
                        textAlign: TextAlign.center,
                        style:
                            TextStyle(color: Colors.black, fontFamily: "Montserrat", fontWeight: FontWeight.w600, fontSize: 12),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  void initState() {
    OperationSystemController operationSystemController = Provider.of<OperationSystemController>(context, listen: false);
    AteloVersion ateloVersion = AteloVersion(operationSystemController);
    ateloVersion.checkUpdate(context).then((result) => {
          setState(() {
            widget.newVersion = result;
          }),
        });
    super.initState();
  }
}
