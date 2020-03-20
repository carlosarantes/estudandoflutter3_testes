import 'package:estudando_flutter2/dao/contact_dao.dart';
import 'package:estudando_flutter2/http/webclients/transaction_webclient.dart';
import 'package:mockito/mockito.dart';

class MockContactDao extends Mock implements ContactDao {}

class MockTransactionWebClient extends Mock implements TransactionWebClient {}