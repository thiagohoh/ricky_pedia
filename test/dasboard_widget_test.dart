import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ricky_pedia/components/card_options.dart';
import 'package:ricky_pedia/components/full_card.dart';
import 'package:ricky_pedia/pages/dashboard.dart';

import 'helpers.dart';

void main() {
  testWidgets('Should display dashboard', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: Dashboard()));

    final images = find.byType(Image);
    expect(images, findsWidgets);
  });

  testWidgets('Should display card options', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: Dashboard()));

    final cardOption = find.byType(CardOptions);
    expect(cardOption, findsOneWidget);
  });

  testWidgets('Should display character option', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: Dashboard()));

    final cardOptionCharacters = find.widgetWithText(CardOptions, 'Characters');
    expect(cardOptionCharacters, findsOneWidget);
  });

  testWidgets('Should display locations option', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: Dashboard()));

    await tester.dragUntilVisible(find.widgetWithText(FullCard, 'Locations'),
        find.byType(GridView), const Offset(0, -110));

    final fullCard = find.byWidgetPredicate(
        (Widget widget) => fullCardMatcher(widget, 'Locations'));

    expect(fullCard, findsOneWidget);
  });
}

