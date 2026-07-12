import 'package:flutter_test/flutter_test.dart';
import 'package:easy_store/app.dart';
import 'package:easy_store/core/services/storage_service.dart';

void main() {
  testWidgets('App should render', (WidgetTester tester) async {
    final storageService = StorageService();
    await storageService.init();
    
    await tester.pumpWidget(EasyStoreApp(storageService: storageService));
    expect(find.text('Easy Store'), findsOneWidget);
  });
}
