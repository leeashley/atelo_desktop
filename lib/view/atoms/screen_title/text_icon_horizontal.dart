import 'package:flutter/material.dart';

class ScreenTitle extends StatefulWidget {
  final String text;
  final IconData icon;
  final double iconSize;
  final String fontFamily;
  final TextAlign textAlign;
  final double fontSize;
  final FontWeight fontWeight;
  final double letterSpacing;
  final Color color;

  const ScreenTitle(
      {Key key,
      @required this.text,
      @required this.icon,
      this.iconSize = 30,
      this.fontFamily = "Arial",
      this.fontSize = 14,
      this.fontWeight = FontWeight.w600,
      this.letterSpacing = 2,
      this.color = Colors.black,
      this.textAlign = TextAlign.justify})
      : super(key: key);

  @override
  _ScreenTitleState createState() => _ScreenTitleState();
}

class _ScreenTitleState extends State<ScreenTitle> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      //margin: EdgeInsets.only(top: 0),
      //padding: EdgeInsets.only(left: 0),
      child: Row(children: [
        Icon(
          widget.icon,
          size: widget.iconSize,
        ),
        RichText(
          textAlign: widget.textAlign,
          text: TextSpan(
            text: widget.text,
            style: TextStyle(
                fontFamily: widget.fontFamily,
                fontSize: widget.fontSize,
                fontWeight: widget.fontWeight,
                letterSpacing: widget.letterSpacing,
                color: widget.color),
          ),
        ),
      ]),
    );
  }
}
