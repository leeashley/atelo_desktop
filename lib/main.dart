import 'package:atelo_desktop/controller/screen_controller/screen_controller.dart';
import 'package:atelo_desktop/localizations/atelo_localizations_delegate.dart';
import 'package:atelo_desktop/view/templates/base_template.dart';
import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'controller/operation_system/operation_system_controller.dart';
import 'controller/screen_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ScreenController>(
          create: (_) => ScreenController(),
        ),
        ChangeNotifierProvider<ScreenListController>(
          create: (_) => ScreenListController(),
        ),
        ChangeNotifierProvider<OperationSystemController>(create: (_) => OperationSystemController()),
      ],
      child: MaterialApp(
        title: 'Atelo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          disabledColor: Color(0xFF9C9B9B),
          fontFamily: 'Montserrat',
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        localizationsDelegates: [
          const AteloLocalizationsDelegate(),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          Locale('pt', 'BR'),
          Locale('en', 'US'),
        ],
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    DesktopWindow.setWindowSize(Size(1200, 830)).then((value) => {
          DesktopWindow.setMinWindowSize(Size(1200, 830)).then((value) => {
                setState(() {}),
              })
        });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BaseTemplate(),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
