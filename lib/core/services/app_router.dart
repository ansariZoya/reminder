
import 'package:flutter/material.dart';
import 'package:reminder_app/src/presentation/Screens/recycle_bin.dart';
import 'package:reminder_app/src/presentation/Screens/tab-screens.dart';

class AppRoute{
  Route? onGenerateRoute(RouteSettings routesettings){
    switch (routesettings.name){
      case RecycleBin.id:
      return MaterialPageRoute(builder: (_)=> RecycleBin());
      case Tabscreen.id:
      return MaterialPageRoute(builder: (_)=> Tabscreen());
      default:
      return null;
    }
  }

}