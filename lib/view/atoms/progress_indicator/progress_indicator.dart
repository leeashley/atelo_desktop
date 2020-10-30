import 'package:flutter/material.dart';

class CustomProgressIndicator extends StatelessWidget {
  final double minHeight;
  final Color backgroundColor;
  final double borderRadius;
  final Animation<Color> valueColor;
  final double padding;
  final String textToLoading;

  const CustomProgressIndicator(
      {Key key,
      this.minHeight = 20,
      this.backgroundColor = Colors.blue,
      this.valueColor,
      this.padding = 25,
      this.borderRadius = 10,
      this.textToLoading = ""})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(borderRadius),
            child: LinearProgressIndicator(
              minHeight: minHeight,
              backgroundColor: backgroundColor,
              valueColor: valueColor,
            ),
          ),
          Visibility(
            visible: textToLoading.isNotEmpty,
            child: Container(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                textToLoading,
                style:
                    TextStyle(color: Colors.black, fontFamily: "Montserrat", letterSpacing: 1, fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ),
          )
        ],
      ),
    );
  }
}
