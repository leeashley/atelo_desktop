import 'package:atelo_desktop/view/atoms/flat_button_icon_styled/flat_button_icon_styled.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ExceptionWindowCustom {
  final BuildContext context;

  ExceptionWindowCustom(this.context);

  Future<void> showMyDialog(
      {String title, String messageError = "Não foi possível capturar o erro", Function closeButtonFunction}) async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            elevation: 5.0,
            title: Text(
              title,
              style: TextStyle(color: Color(0xFF2BB7F6), fontWeight: FontWeight.w700, fontFamily: "Montserrat", fontSize: 16),
            ),
            content: Text(
              messageError,
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontFamily: "Montserrat", fontSize: 16),
            ),
            actions: [
              FlatButtonIconStyled(
                textButton: "Fechar.",
                icon: MdiIcons.close,
                buttonColor: Color(0xFF2BB7F6),
                tapFunction: closeButtonFunction,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ],
          );
        });
  }
}
