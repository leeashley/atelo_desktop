import 'package:flutter/material.dart';

class LogView extends StatefulWidget {
  final Widget logWidget;

  const LogView({Key key, this.logWidget}) : super(key: key);
  @override
  _LogViewState createState() => _LogViewState();
}

class _LogViewState extends State<LogView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minHeight: 170, minWidth: double.maxFinite),
      decoration: BoxDecoration(
        color: Color(0xFF02589B),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(40),
            child: widget.logWidget,
          ),
        ],
      ),
    );
  }
}
