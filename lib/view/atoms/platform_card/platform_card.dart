import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class PlatformCard extends StatefulWidget {
  final double cardHeight;
  final double cardWidth;
  final Color cardColor;
  final double cardElevation;
  final Color cardColorShadow;
  final IconData icon;
  final double iconSize;
  final Color iconColor;
  final double imageWidth;
  final double imageHeight;
  final String textTitle;
  final Color titleColor;
  final String titleFontFamily;
  final double titleFontSize;
  final FontWeight titleFontWeight;
  final double titleLetterSpacing;
  final Color titleTextColor;
  final String textContent;
  final String contentFontFamily;
  final double contentFontSize;
  final FontWeight contentFontWeight;
  final double contentLetterSpacing;
  final Color contentTextColor;
  final TextAlign contentTextAlign;

  const PlatformCard(
      {Key key,
      this.cardHeight,
      this.cardWidth,
      this.cardColor,
      this.cardElevation,
      this.cardColorShadow,
      @required this.icon,
      this.imageWidth,
      this.imageHeight,
      @required this.textTitle,
      this.titleFontFamily,
      this.titleFontSize,
      this.titleFontWeight,
      this.titleLetterSpacing,
      this.titleTextColor,
      @required this.textContent,
      this.contentFontFamily,
      this.contentFontSize,
      this.contentFontWeight,
      this.contentLetterSpacing,
      this.contentTextColor,
      this.contentTextAlign,
      this.titleColor,
      this.iconSize = 20,
      this.iconColor = Colors.white})
      : super(key: key);

  @override
  _PlatformCardState createState() => _PlatformCardState();
}

class _PlatformCardState extends State<PlatformCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.cardHeight,
      width: widget.cardWidth,
      padding: EdgeInsets.all(0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
        color: widget.cardColor,
        elevation: widget.cardElevation,
        shadowColor: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Title(
                    color: widget.titleColor,
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                          text: widget.textTitle,
                          style: TextStyle(
                              fontFamily: widget.titleFontFamily,
                              color: widget.titleColor,
                              fontSize: widget.titleFontSize,
                              fontWeight: widget.titleFontWeight)),
                    ),
                  ),
                ],
              ),
            ),
            //Padding(padding: EdgeInsets.only(bottom: 10)),
            Padding(padding: EdgeInsets.only(bottom: 0)),
            Flexible(
              flex: 4,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    widget.icon,
                    color: widget.iconColor,
                    size: widget.iconSize,
                  ),
                  Padding(padding: EdgeInsets.only(right: 12)),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        text: widget.textContent,
                        style: TextStyle(
                            fontFamily: widget.contentFontFamily,
                            color: widget.contentTextColor,
                            fontSize: widget.contentFontSize,
                            fontWeight: widget.contentFontWeight)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
