import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ricky_pedia/components/character_card.dart';
import 'package:ricky_pedia/components/full_card.dart';
import 'package:ricky_pedia/pages/dashboard.dart';

import 'helpers.dart';

void main(){
  testWidgets('Should display locations option', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: Dashboard()));

    final fullCard = find.byWidgetPredicate(
            (Widget widget) => fullCardMatcher(widget, 'Characters'));

    expect(fullCard, findsOneWidget);
    await tester.tap(fullCard);

  });
}