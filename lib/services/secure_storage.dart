import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  final storage = const FlutterSecureStorage();

  final String _email = 'email';
  final String _password = 'password';

  clearStorage() => storage.deleteAll();

  Future setEmail(String email) async =>
    await storage.write(key: _email, value: email);
  

  Future<String?> getEmail() async =>
     await storage.read(key: _email);
  

  Future setPassword(String password) async {
    await storage.write(key: _password, value: password);
  }

  Future<String?> getPassword() async =>
   await storage.read(key: _password);
  
}