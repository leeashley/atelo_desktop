import 'package:flutter/material.dart';

class FlatButtonStyled extends StatelessWidget {
  final double buttonMinWidth;
  final double buttonHeight;
  final Color hoverColor;
  final ShapeBorder shape;
  final Color buttonColor;
  final IconData icon;
  final double iconSize;
  final String textButton;
  final double fontSize;
  final FontWeight fontWeight;
  final Color fontColor;
  final Function tapFunction;
  final Widget rowWidget;

  const FlatButtonStyled({
    Key key,
    this.buttonMinWidth = 100,
    this.buttonHeight = 45,
    this.hoverColor = Colors.lightBlue,
    @required this.shape,
    this.buttonColor = Colors.blueAccent,
    this.icon,
    this.iconSize = 18,
    @required this.textButton,
    this.fontSize = 15,
    this.fontWeight = FontWeight.w500,
    this.fontColor = Colors.black,
    this.tapFunction,
    this.rowWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: buttonMinWidth,
      height: buttonHeight,
      child: FlatButton(
        autofocus: false,
        hoverColor: Colors.transparent,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        disabledColor: Color(0xFFC9C9C9),
        onPressed: tapFunction,
        shape: shape,
        color: buttonColor,
        child: Row(
          children: [
            rowWidget != null ? rowWidget : Container(),
            RichText(
              text: TextSpan(
                  text: textButton,
                  style: TextStyle(fontSize: fontSize, fontWeight: fontWeight, color: fontColor, fontFamily: "Montserrat")),
            ),
          ],
        ),
      ),
    );
  }
}
