import 'dart:io';

import 'package:atelo_desktop/controller/operation_system/operation_system_controller.dart';
import 'package:atelo_desktop/localizations/atelo_localizations.dart';
import 'package:atelo_desktop/view/atoms/progress_indicator/progress_indicator.dart';
import 'package:atelo_desktop/view/molecules/picker_installation/picker_installation.dart';
import 'package:atelo_desktop/view/organisms/feature_cards/feature_cards.dart';
import 'package:atelo_desktop/view/organisms/installation_log_progress/installation_log_rogress.dart';
import 'package:atelo_desktop/view/organisms/overview_cards/overview_cards.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OverviewTemplate extends StatefulWidget {
  @override
  _OverviewTemplateState createState() => _OverviewTemplateState();
}

class _OverviewTemplateState extends State<OverviewTemplate> {
  bool isLoading = true;
  bool flutterExist = false;

  @override
  Widget build(BuildContext context) {
    OperationSystemController operationSystemController = Provider.of<OperationSystemController>(context);
    return Column(
      children: [
        FeatureCards(),
        Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Container(
              padding: EdgeInsets.only(top: 20),
              child: operationSystemController.isLoading
                  ? CustomProgressIndicator(
                      padding: 150,
                      valueColor: AlwaysStoppedAnimation(Color(0xFF2BB7F6)),
                      textToLoading: "${AteloLocalizations.of(context).checkingEnvironment}",
                    )
                  : operationSystemController.operationSystem.flutterProperties.flutterExist
                      ? OverviewCards()
                      : operationSystemController.operationSystem.startInstallation
                          ? InstallationLogProgress(
                              context: context,
                            )
                          : PickerInstallation(
                              buildContext: context,
                            ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    Platform.environment;
    Provider.of<OperationSystemController>(context, listen: false).loadFlutterProperties(context);
  }
}
