import 'dart:convert';

import 'package:estudando_flutter2/http/webclient.dart';
import 'package:estudando_flutter2/models/transaction.dart';
import 'package:http/http.dart';

class TransactionWebClient {


  Future<List<Transaction>> findAll() async {

    final Response response = await client.get(baseUrl);
    final List<dynamic> decodedJson = jsonDecode(response.body);
    return decodedJson.map( (dynamic json) => Transaction.fromJson(json)).toList();
  }

  Future<Transaction> save(Transaction transaction, String password) async {
    
    final String transactionJson = jsonEncode(transaction.toJson());

    await Future.delayed(Duration(seconds: 10)  );

    final Response response = await client.post(baseUrl, 
                                      headers: { 'Content-type' : 'application/json',
                                                'password'  : password }, 
                                                body: transactionJson);

    if (response.statusCode == 200) {
      return Transaction.fromJson(jsonDecode(response.body)); 
    }

    throw HttpException(_getMessage(response.statusCode));
  }

  static final Map<int, String> _statusCodeResponses = {
    400 : 'Deu merda',
    401 : 'Poe a senha seu corno',
    409 : 'Voce já fez isso doidão...'
  };

  String _getMessage(int statusCode) {

    if (_statusCodeResponses.containsKey(statusCode)) {
      return _statusCodeResponses[statusCode];
    }

    return 'Deu merda mano';
  }
}



class HttpException implements Exception {
  final String message;

  HttpException(this.message);
}