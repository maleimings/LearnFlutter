
import 'package:flutter/material.dart';
import 'package:learnFlutter/models/app_settings.dart';

class ForecastPage extends StatefulWidget {
  final PopupMenuButton menu;
  final Widget settingsButton;
  final AppSettings settings;
  
  const ForecastPage({Key key, this.menu, this.settingsButton, @required this.settings}) : super(key: key);
  
  @override
  _ForecastPageState createState() => _ForecastPageState();
}

class _ForecastPageState extends State<ForecastPage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}