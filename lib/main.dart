import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'app.dart';
import 'core/services/storage_service.dart';
import 'core/providers/locale_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  final storageService = StorageService();
  await storageService.init();
  
  runApp(
    ProviderScope(
      overrides: [],
      child: EasyStoreApp(storageService: storageService),
    ),
  );
}

final localeProvider = ChangeNotifierProvider<LocaleProvider>((ref) {
  return LocaleProvider();
});
