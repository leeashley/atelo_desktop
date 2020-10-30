import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Color(0xFF1C2834), border: Border.all(width: 0, color: Color(0xFF1C2834))),
      padding: EdgeInsets.only(top: 20),
      //color: Color(0xFF1C2834),
      child: Center(
        child: RichText(
          text: TextSpan(children: [
            WidgetSpan(
                child: Image(
              image: AssetImage('assets/atelo_logo_desktop.png'),
              width: 30,
            )),
            WidgetSpan(child: Padding(padding: EdgeInsets.only(right: 10))),
            TextSpan(
                text: "ATELO",
                style: TextStyle(letterSpacing: 3, fontFamily: 'Montserrat', fontWeight: FontWeight.bold, fontSize: 30)),
          ]),
        ),
      ),
    );
  }
}
