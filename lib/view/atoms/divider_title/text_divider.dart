import 'package:flutter/material.dart';

class DividerTitle extends StatefulWidget {
  final String text;
  final String fontFamily;
  final double fontSize;
  final TextAlign textAlign;
  final FontWeight fontWeight;
  final double letterSpacing;
  final Color textColor;
  final double indent;
  final double endIndent;
  final double thickness;
  final Color dividerColor;

  const DividerTitle(
      {Key key,
      @required this.text,
      this.fontFamily = "Montserrat",
      this.fontSize = 16,
      this.fontWeight = FontWeight.w600,
      this.letterSpacing = 2,
      this.textColor = Colors.black,
      this.indent = 12,
      this.endIndent = 5,
      this.thickness = 2,
      @required this.dividerColor,
      this.textAlign = TextAlign.justify})
      : super(key: key);

  @override
  _DividerTitleState createState() => _DividerTitleState();
}

class _DividerTitleState extends State<DividerTitle> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(children: [
        Padding(padding: EdgeInsets.only(top: 50, left: 0)),
        RichText(
          textAlign: widget.textAlign,
          text: TextSpan(
            text: widget.text,
            style: TextStyle(
                fontFamily: widget.fontFamily,
                fontSize: widget.fontSize,
                fontWeight: widget.fontWeight,
                letterSpacing: widget.letterSpacing,
                color: widget.textColor),
          ),
        ),
        Flexible(
          child: Divider(
            indent: widget.indent,
            endIndent: widget.endIndent,
            thickness: widget.thickness,
            color: widget.dividerColor,
          ),
        ),
      ]),
    );
  }
}
