import 'package:dogs_demo_provider/features/dog_list/pages/dog_list_page.dart';
import 'package:dogs_demo_provider/features/dog_list/providers/dog_list_provider.dart';
import 'package:dogs_demo_provider/features/dog_list/widgets/dog_card.widget.dart';
import 'package:dogs_demo_provider/features/dog_list/widgets/dog_detail.widget.dart';
import 'package:dogs_demo_provider/services/dog_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

import '../mocks/dog_service_mock.dart';

void main() {
  group('Dog list page test', () {
    late Widget dogListWidget;
    late DogListProvider dogListProvider;
    late DogServiceMock dogServiceMock;

    setUpAll(() {
      GetIt.instance;

      dogServiceMock = DogServiceMock();
      GetIt.I.registerFactory<DogService>(() => dogServiceMock);

      dogListProvider = DogListProvider();
      dogListProvider.getDogList();

      dogListWidget = ChangeNotifierProvider.value(
        value: dogListProvider,
        child: const MaterialApp(home: Scaffold(body: DogListPage())),
      );
    });

    testWidgets('display list', (WidgetTester tester) async {
      await tester.pumpWidget(dogListWidget);
      await tester.pump();

      final cards = find.byType(DogCard);
      expect(cards, findsWidgets);
    });

    testWidgets('display detail', (WidgetTester tester) async {
      await tester.pumpWidget(dogListWidget);
      await tester.pump();

      final cards = find.byType(DogCard);
      await tester.tap(cards.first);

      await tester.pump();
      expect(find.byType(DogDetail), findsOneWidget);
    });
  });
}
