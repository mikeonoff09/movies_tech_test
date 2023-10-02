import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movies_tech_test/main.dart';
import 'package:movies_tech_test/module.dart';

void main() {
  testWidgets('Tap on search', (tester) async {
    // Load app widget.
    await tester.pumpWidget(ModularApp(
      module: AppModule(),
      child: const MainApp(),
    ));

    await tester.pumpAndSettle();

    expect(find.byKey(const Key("home_book_0")), findsOneWidget);
    expect(find.byKey(const Key("home_book_1")), findsOneWidget);
    expect(find.byKey(const Key("home_book_2")), findsOneWidget);
    expect(find.byKey(const Key("home_book_3")), findsOneWidget);
    // should scroll first
    // expect(find.byKey(const Key("home_book_4")), findsOneWidget);
    // expect(find.byKey(const Key("home_book_5")), findsOneWidget);

    final Finder fab = find.byKey(const Key("home_book_1"));

    await tester.tap(fab);

    await tester.pumpAndSettle();

    await tester.tap(find.byIcon(Icons.arrow_back));

    await tester.pumpAndSettle();

    await tester.tap(find.byIcon(Icons.search));

    await tester.pumpAndSettle();

    await tester.enterText(find.byType(TextField), 'linux');

    await tester.pumpAndSettle();

    await tester.tap(find.byIcon(Icons.search));

    await tester.tap(find.byIcon(Icons.arrow_back));
  });
}
