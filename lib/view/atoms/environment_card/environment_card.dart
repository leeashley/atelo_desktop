import 'package:flutter/material.dart';

class EnvironmentCard extends StatefulWidget {
  final double cardHeight;
  final double cardWidth;
  final Color cardColor;
  final double cardElevation;
  final Color cardColorShadow;
  final AssetImage image;
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

  const EnvironmentCard(
      {Key key,
      this.cardHeight,
      this.cardWidth,
      this.cardColor,
      this.cardElevation,
      this.cardColorShadow,
      @required this.image,
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
      this.titleColor})
      : super(key: key);

  @override
  _EnvironmentCardState createState() => _EnvironmentCardState();
}

class _EnvironmentCardState extends State<EnvironmentCard> {
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: widget.image,
                    width: widget.imageWidth,
                  ),
                ],
              ),
            ),
            Padding(padding: EdgeInsets.only(right: 10, left: 10)),
            Flexible(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
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
                  Padding(padding: EdgeInsets.only(bottom: 10)),
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
