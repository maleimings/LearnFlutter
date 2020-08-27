import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:learnFlutter/styles.dart';
import 'package:learnFlutter/utils/flutter_ui_utils.dart' as UiUtils;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
      .then((_) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        fontFamily: "Cabin",
        primaryColor: AppColor.midnightSky,
        accentColor: AppColor.midnightCloud,
        primaryTextTheme: Theme.of(context).textTheme.apply(
          bodyColor: AppColor.textColorDark,
          displayColor: AppColor.textColorDark,
        ),
        textTheme: Theme.of(context).textTheme.apply(
          bodyColor: AppColor.textColorDark,
          displayColor: AppColor.textColorDark,
        ),
        backgroundColor: Colors.black45,
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'A Flutter App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  bool _reversed = false;
  List<UniqueKey> _buttonKeys = [UniqueKey(), UniqueKey()];

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
      swap();
    });
  }

  void swap() {
    setState(() {
      _reversed = !_reversed;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.

    final incrementButton = FancyButton(
      child: Text(
          "Increment",
        style: TextStyle(color: Colors.white),
      ),
      onPressed: _incrementCounter,
      key: _buttonKeys.first,
    );

    final decrementButton = FancyButton(
      child: Text(
        "decrement",
        style: TextStyle(color: Colors.white),
      ),
      onPressed: _decrementCounter,
      key: _buttonKeys.last,
    );

    List<Widget> _buttons = <Widget>[incrementButton, decrementButton];
    if (_reversed) {
      _buttons = _buttons.reversed.toList();
    }

    final appBar = PreferredSize(child: Text(widget.title),
        preferredSize: Size.fromHeight(UiUtils.getAppBarHeight(context)));
    return Scaffold(
      appBar: appBar,
      body: Stack(
        children: [
          Positioned(
            child: Text("Stack top"),
            top: 100.0,
            left: 100.0,
          ),
          Positioned(
            child: Text("Stack next"),
            top: 120.0,
            left: 100.0,
          ),
        ],
      ),

    );
  }
}

class FancyButton extends StatefulWidget {
  final VoidCallback onPressed;
  final Widget child;

  const FancyButton({Key key, this.onPressed, this.child}) : super(key: key);

  @override
  _FancyButtonState createState() => _FancyButtonState();
}

class _FancyButtonState extends State<FancyButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
        child:widget.child,
        color: _getColors(),
        onPressed: widget.onPressed,
      )
    );
  }

  Color _getColors() {
    return _buttonColors.putIfAbsent(this, () => colors[next(0, 5)]);
  }

  Map<_FancyButtonState, Color> _buttonColors = {};

  final _random = Random();

  int next(int min, int max) => min + _random.nextInt(max - min);

  List<Color> colors = [
    Colors.blue,
    Colors.green,
    Colors.orange,
    Colors.purple,
    Colors.amber,
    Colors.lightBlue,
  ];
}
