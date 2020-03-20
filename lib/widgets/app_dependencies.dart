import 'package:estudando_flutter2/dao/contact_dao.dart';
import 'package:estudando_flutter2/http/webclients/transaction_webclient.dart';
import 'package:flutter/material.dart';

class AppDependencies extends InheritedWidget {

  final ContactDao contactDao;
  final TransactionWebClient transactionWebClient;

  AppDependencies({@required this.contactDao, 
                   @required this.transactionWebClient, 
                   @required Widget child,}) : super(child : child);

  static AppDependencies of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppDependencies>();
  }

  @override
  bool updateShouldNotify(AppDependencies oldWidget) {
    return contactDao != oldWidget.contactDao || 
              transactionWebClient != oldWidget.transactionWebClient;
  }
  
}