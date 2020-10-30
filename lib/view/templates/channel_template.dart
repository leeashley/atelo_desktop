import 'package:atelo_desktop/controller/operation_system/operation_system_controller.dart';
import 'package:atelo_desktop/localizations/atelo_localizations.dart';
import 'package:atelo_desktop/view/atoms/divider_title/text_divider.dart';
import 'package:atelo_desktop/view/atoms/flat_button_styled/flat_button_styled.dart';
import 'package:atelo_desktop/view/atoms/progress_indicator/progress_indicator.dart';
import 'package:atelo_desktop/view/atoms/screen_title/text_icon_horizontal.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChannelTemplate extends StatefulWidget {
  @override
  _ChannelTemplateState createState() => _ChannelTemplateState();
}

class _ChannelTemplateState extends State<ChannelTemplate> {
  Map<String, String> channelsMap = {};

  @override
  Widget build(BuildContext context) {
    OperationSystemController operationSystemController = Provider.of<OperationSystemController>(context);
    return Column(
      children: [
        ScreenTitle(
          icon: Icons.arrow_right,
          iconSize: 50,
          text: "${AteloLocalizations.of(context).channel}",
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
                  text: "${AteloLocalizations.of(context).channelDescription}",
                  style: TextStyle(
                    fontFamily: "Montserrat",
                    fontSize: 14,
                    fontWeight: FontWeight.w200,
                    color: Color(0xFF000000),
                  ),
                ),
              )),
        ),
        DividerTitle(text: "${AteloLocalizations.of(context).flutterChannels.toUpperCase()}", dividerColor: Color(0xFF2BB7F6)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            channelsMap.length,
            (index) => Stack(
              alignment: AlignmentDirectional.topEnd,
              children: [
                FlatButtonStyled(
                  tapFunction: channelsMap.values.toList()[index] == "active"
                      ? () {}
                      : () async {
                          String resultSwitchChannel =
                              await operationSystemController.switchChannel(channelsMap.keys.toList()[index], context);
                          if (resultSwitchChannel == "success") {
                            for (String key in channelsMap.keys) {
                              if (channelsMap[key] == "active") {
                                channelsMap.update(key, (value) => value = "disable");
                                channelsMap.update(channelsMap.keys.toList()[index], (value) => value = "active");
                                break;
                              }
                            }
                            setState(() {
                              operationSystemController.isLoading = false;
                              //channelsMap.values.toList()[index] = "active";
                            });
                          }
                        },
                  buttonHeight: 70,
                  buttonMinWidth: 220,
                  buttonColor: channelsMap.values.toList()[index] == "active" ? Color(0xFF2BB7F6) : Color(0xFFC9C9C9),
                  shape: null,
                  textButton: channelsMap.keys.toList()[index],
                  fontWeight: FontWeight.w600,
                ),
                Visibility(
                  visible: channelsMap.values.toList()[index] == "active",
                  child: Container(
                      color: Color(0xFF02415E),
                      padding: EdgeInsets.all(5),
                      child: Icon(
                        Icons.check,
                        size: 18,
                        color: Colors.white,
                      )),
                ),
              ],
            ),
          ),
        ),
        Visibility(
            visible: operationSystemController.isLoading,
            child: Center(child: CustomProgressIndicator(padding: 50, valueColor: AlwaysStoppedAnimation(Color(0xFF2BB7F6))))),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    Provider.of<OperationSystemController>(context, listen: false).listChannels(context).then(
          (value) => {
            for (var index = 0; index < value.length; index++)
              {
                if (value[index].contains("*"))
                  {
                    channelsMap[value[index].replaceAll("*", "").trim().toUpperCase()] = "active",
                  }
                else
                  {
                    channelsMap[value[index].trim().toUpperCase()] = "disable",
                  }
              }
          },
        );
  }
}
