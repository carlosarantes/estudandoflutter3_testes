import 'package:estudando_flutter2/dao/contact_dao.dart';
import 'package:flutter/material.dart';

class AppDependencies extends InheritedWidget {

  final ContactDao contactDao;

  AppDependencies({@required this.contactDao, 
                   @required Widget child,}) : super(child : child);

  static AppDependencies of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppDependencies>();
  }

  @override
  bool updateShouldNotify(AppDependencies oldWidget) {
    return contactDao != oldWidget.contactDao;
  }
  
}