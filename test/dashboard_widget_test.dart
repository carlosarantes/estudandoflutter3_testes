// import 'package:estudando_flutter2/main.dart';
import 'package:estudando_flutter2/screens/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  
  testWidgets('Should display the main image when the dashboard is opened.', (WidgetTester tester) async { 
    await tester.pumpWidget(
      MaterialApp(
        home: Dashboard(),
      ),
    );

    final mainImage = find.byType(Image);
    expect(mainImage, findsNothing);
  });

  testWidgets('Should display the transfer feature when the Dashboard is opened.', (tester) async {
    await tester.pumpWidget(MaterialApp(home: Dashboard(), ));
    final iconTransfferFeatureItem = find.widgetWithIcon(FeatureItem, Icons.add);
    expect(iconTransfferFeatureItem, findsOneWidget);

    final nameTransferFeatureItem = find.widgetWithText(FeatureItem, 'Transfer');
    expect(nameTransferFeatureItem, findsOneWidget);

  });
}