import 'package:flutter/material.dart';

class FeatureCard extends StatefulWidget {
  final double cardHeight;
  final double cardWidth;
  final double cardElevation;
  final Color cardColorShadow;
  final IconData icon;
  final double iconSize;
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

  const FeatureCard(
      {Key key,
      this.cardHeight,
      this.cardElevation,
      this.cardColorShadow,
      @required this.icon,
      this.iconSize,
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
      this.cardWidth})
      : super(key: key);

  @override
  _FeatureCardState createState() => _FeatureCardState();
}

class _FeatureCardState extends State<FeatureCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.cardHeight,
      width: widget.cardWidth,
      child: Card(
        elevation: widget.cardElevation,
        shadowColor: widget.cardColorShadow,
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Icon(
                widget.icon,
                size: widget.iconSize,
              ),
              Padding(padding: EdgeInsets.only(bottom: 10)),
              Title(
                color: widget.titleColor,
                child: RichText(
                  text: TextSpan(
                      text: widget.textTitle,
                      style: TextStyle(
                          fontFamily: widget.titleFontFamily,
                          color: widget.titleTextColor,
                          fontSize: widget.titleFontSize,
                          fontWeight: widget.titleFontWeight)),
                ),
              ),
              Padding(padding: EdgeInsets.only(bottom: 10)),
              RichText(
                textAlign: widget.contentTextAlign,
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
      ),
    );
  }
}
