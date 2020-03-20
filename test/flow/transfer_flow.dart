import 'package:estudando_flutter2/components/transaction_auth_dialog.dart';
import 'package:estudando_flutter2/dao/contact_dao.dart';
import 'package:estudando_flutter2/main.dart';
import 'package:estudando_flutter2/models/contact.dart';
import 'package:estudando_flutter2/screens/contacts_list.dart';
import 'package:estudando_flutter2/screens/dashboard.dart';
import 'package:estudando_flutter2/screens/transaction_form.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter/material.dart';
import '../matchers/matchers.dart';
import '../mocks/mocks.dart';
import 'actions.dart';

void main() {
  testWidgets('Should Transfer to a contact', (tester) async {
      final mockContactDao = MockContactDao();
      final mockTransactionWebClient = MockTransactionWebClient();

      await tester.pumpWidget(ByteBankApp( 
                                  transactionWebClient: mockTransactionWebClient, 
                                  contactDao: mockContactDao, ));

      final dashboard = find.byType(Dashboard);
      expect(dashboard, findsOneWidget);



      when(mockContactDao.findAll()).thenAnswer((invocation) async {
          return [Contact(0, 'Doido', 12345)];
      });



      await clickOnTheTransferFeatureItem(tester);

      await tester.pumpAndSettle();


      final contactsList = find.byType(ContactsList);
      expect(contactsList, findsOneWidget);

      verify(mockContactDao.findAll()).called(1);

      final contactItem = find.byWidgetPredicate((widget) {
        
        if(widget is ContactItem) {
            return widget.contact.name == 'Doido' && widget.contact.accountNumber == 12345;
        }
        return false;
      });
      expect(contactItem, findsOneWidget);

      await tester.tap(contactItem);
      await tester.pumpAndSettle();

      final transactionForm = find.byType(TransactionForm);
      expect(transactionForm, findsOneWidget);

      final contactName = find.text('Alex');
      expect(contactName, findsOneWidget);

      final contactAccountNumber = find.text('1234');
      expect(contactAccountNumber, findsOneWidget);

      final textFieldValue = find.byWidgetPredicate((widget){
        return textFieldByLabelTextMatcher(widget, 'Value');
      });
      expect(textFieldValue, findsOneWidget);
      await tester.enterText(textFieldValue, '123');

      final transferButton = find.widgetWithText(RaisedButton, 'Transfer');
      expect(transferButton, findsOneWidget);
      await tester.tap(transferButton);
      await tester.pumpAndSettle();

      final transactionAuthDialog = find.byType(TransactionAuthDialog);
      expect(transactionAuthDialog, findsOneWidget);

  });
}

