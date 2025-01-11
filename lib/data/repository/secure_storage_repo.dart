import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageRepo {
  final storage = const FlutterSecureStorage();

  Future<String?> read(String key) async => await storage.read(key: key);

  Future<Map<String, String>> readAll() async => await storage.readAll();

  Future<void> delete(String key) async => await storage.delete(key: key);

  Future<void> deleteAll() async => await storage.deleteAll();

  Future<void> write(String key, String? value) async =>
      await storage.write(key: key, value: value);
}
