import 'dart:io';

import 'package:atelo_desktop/controller/operation_system/operation_system_controller.dart';
import 'package:atelo_desktop/localizations/atelo_localizations.dart';
import 'package:atelo_desktop/view/atoms/divider_title/text_divider.dart';
import 'package:atelo_desktop/view/atoms/expection_window/exception_window.dart';
import 'package:atelo_desktop/view/atoms/flat_button_icon_styled/flat_button_icon_styled.dart';
import 'package:atelo_desktop/view/atoms/flat_button_styled/flat_button_styled.dart';
import 'package:atelo_desktop/view/atoms/progress_indicator/progress_indicator.dart';
import 'package:atelo_desktop/view/atoms/screen_title/text_icon_horizontal.dart';
import 'package:atelo_desktop/view/molecules/update_log/update_log.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

class UpdateTemplate extends StatefulWidget {
  @override
  _UpdateTemplateState createState() => _UpdateTemplateState();
}

class _UpdateTemplateState extends State<UpdateTemplate> {
  var _buttonFunction;
  // Auto Update Feature Removed -  "atelo": "disable"
  Map<String, String> buttons = {"flutter": "disable"};
  bool _startUpdate = false;
  bool _updateComplete = false;

  executeButtonFunction(OperationSystemController operationSystemController, String executionType) async {
    setState(() {
      _startUpdate = true;
      _updateComplete = false;
    });
    String result = await _buttonFunction(context);
    ExceptionWindowCustom exceptionWindowCustom = ExceptionWindowCustom(context);
    if (result == "success" && executionType == "updateFlutter") {
      operationSystemController.operationSystem.updatedFlutter = true;
      operationSystemController.notifyListeners();
      setState(() {
        _startUpdate = false;
        _updateComplete = true;
      });
      Future.delayed(Duration(milliseconds: 250)).then((value) => {
            operationSystemController.operationSystem.updatedFlutter = false,
          });
    } else if (result == "success" && executionType == "updateAtelo") {
      setState(() {
        _startUpdate = false;
        _updateComplete = true;
      });
      exceptionWindowCustom.showMyDialog(
          title: "${AteloLocalizations.of(context).ateloUpdate}",
          messageError: "${AteloLocalizations.of(context).ateloUpdatedSuccessfully}",
          closeButtonFunction: () {
            exit(0);
          });
    } else {
      setState(() {
        _startUpdate = false;
      });
      exceptionWindowCustom.showMyDialog(
        title: "${AteloLocalizations.of(context).ateloUpdateError}",
        messageError: result,
        closeButtonFunction: () {
          Navigator.of(context).pop();
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    OperationSystemController operationSystemController = Provider.of<OperationSystemController>(context);
    //AutoUpdate autoUpdate = AutoUpdate(operationSystemController);
    return Column(
      children: [
        ScreenTitle(
          icon: Icons.arrow_right,
          iconSize: 50,
          text: "${AteloLocalizations.of(context).update}",
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
                  text: "${AteloLocalizations.of(context).updateDescription}",
                  style: TextStyle(
                    fontFamily: "Montserrat",
                    fontSize: 14,
                    fontWeight: FontWeight.w200,
                    color: Color(0xFF000000),
                  ),
                ),
              )),
        ),
        DividerTitle(text: "${AteloLocalizations.of(context).selectToUpdate.toUpperCase()}", dividerColor: Color(0xFF2BB7F6)),
        Padding(
          padding: const EdgeInsets.all(30),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                buttons.length,
                (index) => Stack(
                  alignment: AlignmentDirectional.topEnd,
                  children: [
                    FlatButtonStyled(
                      rowWidget: Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Image(
                          image: buttons.keys.toList()[index] == "flutter"
                              ? AssetImage('assets/logo_flutter.png')
                              : AssetImage('assets/atelo_logo_desktop.png'),
                          width: 30,
                        ),
                      ),
                      tapFunction: buttons.values.toList()[index] == "active"
                          ? () {}
                          : () {
                              if (buttons.keys.toList()[index] == "flutter") {
                                setState(() {
                                  _buttonFunction = operationSystemController.updateFlutter;
                                  buttons.update('flutter', (value) => value = "active");
                                  //buttons.update('atelo', (value) => value = "disable");
                                  _updateComplete = false;
                                });
                              } else if (buttons.keys.toList()[index] == "atelo") {
                                setState(() {
                                  //_buttonFunction = autoUpdate.updateAtelo;
                                  buttons.update('atelo', (value) => value = "active");
                                  buttons.update('flutter', (value) => value = "disable");
                                  _updateComplete = false;
                                });
                              }
                            },
                      buttonHeight: 70,
                      buttonMinWidth: 220,
                      buttonColor: buttons.values.toList()[index] == "active" ? Color(0xFF263545) : Color(0xFFF3F3F3),
                      shape: null,
                      textButton: buttons.keys.toList()[index].toUpperCase(),
                      fontColor: buttons.values.toList()[index] == "active" ? Colors.white : Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                    Visibility(
                      visible: buttons.values.toList()[index] == "active",
                      child: Container(
                          color: Color(0xFF2BB7F6),
                          padding: EdgeInsets.all(5),
                          child: Icon(
                            Icons.check,
                            size: 18,
                            color: Colors.white,
                          )),
                    ),
                  ],
                ),
              )),
        ),
        Visibility(
          visible: _startUpdate || _updateComplete,
          child: UpdateLog(
            logLine: _buttonFunction == operationSystemController.updateFlutter
                ? "${AteloLocalizations.of(context).updatingFlutter}"
                : "${AteloLocalizations.of(context).updatingAtelo}",
          ),
        ),
        Visibility(
            visible: _startUpdate,
            child: CustomProgressIndicator(padding: 50, valueColor: AlwaysStoppedAnimation(Color(0xFF2BB7F6)))),
        Visibility(
          visible: !_updateComplete,
          child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: FlatButtonIconStyled(
              icon: MdiIcons.cloudDownloadOutline,
              textButton: "${AteloLocalizations.of(context).update}",
              buttonMinWidth: 200,
              fontWeight: FontWeight.w500,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              buttonColor: Color(0xFF2BB7F6),
              tapFunction: _buttonFunction != null && _startUpdate == false
                  ? () async {
                      await executeButtonFunction(operationSystemController,
                          _buttonFunction == operationSystemController.updateFlutter ? "updateFlutter" : "updateAtelo");
                    }
                  : null,
            ),
          ),
        ),
        Visibility(
          visible: _updateComplete,
          child: Padding(
            padding: const EdgeInsets.only(top: 25.0),
            child: Text(
              "${AteloLocalizations.of(context).updateSuccessfully}",
              style: TextStyle(color: Colors.black),
            ),
          ),
        )
      ],
    );
  }
}
