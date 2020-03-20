import 'package:estudando_flutter2/main.dart';
import 'package:estudando_flutter2/models/contact.dart';
import 'package:estudando_flutter2/screens/contact_form.dart';
import 'package:estudando_flutter2/screens/contacts_list.dart';
import 'package:estudando_flutter2/screens/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import '../matchers/matchers.dart';
import '../mocks/mocks.dart';
import 'actions.dart';

void main() {

  testWidgets('Shouldsave contact', (tester) async {
      final mockContactDao = MockContactDao();
      await tester.pumpWidget(ByteBankApp( contactDao: mockContactDao, ));

      final dashboard = find.byType(Dashboard);
      expect(dashboard, findsOneWidget);
      
      await clickOnTheTransferFeatureItem(tester);

      await tester.pumpAndSettle();

      final contactsList = find.byType(ContactsList);
      expect(contactsList, findsOneWidget);

      verify(mockContactDao.findAll()).called(1);



      final fabNewContact = find.widgetWithIcon(FloatingActionButton, Icons.add);
      expect(fabNewContact, findsOneWidget);

      await tester.tap(fabNewContact);
      await tester.pumpAndSettle();

      final contactForm = find.byType(ContactForm);
      expect(contactForm, findsOneWidget);


      final nameTextField = find.byWidgetPredicate( (widget) {
        return textFieldMatcher(widget, 'Full name');
      });
      expect(nameTextField, findsOneWidget);
      await tester.enterText(nameTextField, 'Doido');


      final accountNumberTextField = find.byWidgetPredicate( (widget) {
        return textFieldMatcher(widget, 'Account Number');
      });
      expect(accountNumberTextField, findsOneWidget);
      await tester.enterText(accountNumberTextField, '1234');


      final createButton = find.widgetWithText(RaisedButton, 'Create');
      expect(createButton, findsOneWidget);

      await tester.tap(createButton);
      await tester.pumpAndSettle();

      verify(mockContactDao.save( Contact(0, 'Doido', 12345), ));

      final contactsListBack = find.byType(ContactsList);
      expect(contactsListBack, findsOneWidget);

      verify(mockContactDao.findAll());

  });
}