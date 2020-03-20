import 'package:estudando_flutter2/dao/contact_dao.dart';
import 'package:estudando_flutter2/http/webclients/transaction_webclient.dart';
import 'package:estudando_flutter2/screens/dashboard.dart';
import 'package:estudando_flutter2/widgets/app_dependencies.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(ByteBankApp(contactDao: ContactDao(), 
                     transactionWebClient: TransactionWebClient(), ));
} 

class ByteBankApp extends StatelessWidget {


  final ContactDao contactDao;
  final TransactionWebClient transactionWebClient;

  ByteBankApp({@required this.contactDao, @required this.transactionWebClient});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AppDependencies(
              transactionWebClient: transactionWebClient,
              contactDao: contactDao,
              child: MaterialApp(
                      theme: ThemeData(
                                primaryColor: Colors.green[900],
                                accentColor: Colors.blueAccent[700], 
                                buttonTheme: ButtonThemeData(
                                    buttonColor: Colors.blueAccent[700],
                                    textTheme: ButtonTextTheme.primary,
                                ),
                      ),
                      home: Dashboard() /*Dashboard()*/,
                    ),
    );
  }
}


