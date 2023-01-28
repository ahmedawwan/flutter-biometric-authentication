# flutter_biometric_authentication

Basically the idea is to store the user login information upon registration or login in a `secure storage`, and whenever the session expires or user logs out, we can access that information using local authentication and authenticate the user to the server.

---

## Required Packages

<li>local_auth</li>
<li>flutter_secure_storage</li>


Add the above two packages in your `pubspec.yaml`

```yaml
dependencies:
  local_auth: latest
  flutter_secure_storage: latest
```

---

## Android Integration

`local_auth` requires SDK 16+

### Activity Changes

Note that `local_auth` requires the use of a `FragmentActivity` instead of an Activity. To update your application:

<li>If you are using FlutterActivity directly, change it to FlutterFragmentActivity in your AndroidManifest.xml.</li>
<li>If you are using a custom activity, update your MainActivity.java:</li>

```java
import io.flutter.embedding.android.FlutterFragmentActivity;
  public class MainActivity extends FlutterFragmentActivity {
      // ...
  }
```

or MainActivity.kt:

```kotlin
import io.flutter.embedding.android.FlutterFragmentActivity
class MainActivity: FlutterFragmentActivity() {
      // ...
  }
```

---

### Permissions

Update your project’s AndroidManifest.xml file to include the USE_BIOMETRIC permissions:

```xml
<manifest xmlns:android="http://schemas.android.com/apk/res/android"
          package="com.example.app">
  <uses-permission android:name="android.permission.USE_BIOMETRIC"/>
<manifest>
```

---

## Creating a SecureStorage class

Create a SecureStorage class to set and get the user login information (email and password) securely.

```dart
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
    Future setPassword(String password) async =>
        await storage.write(key: _password, value: password);
    Future<String?> getPassword() async =>
        await storage.read(key: _password);
}
```

### Saving login information

```dart
Future<void> _saveUser(String email, String password) async {
    SecureStorage storage = SecureStorage();
    storage.setEmail(email);
    storage.setPassword(password);
}
```

---

## Logging in the user using touch ID

I’ll be using firebase for authentication but you can use any Authentication provider of your choice.

```dart
Future<void> authenticateUserWithTouchID() async {
    final localAuthentication = LocalAuthentication();
    bool isAuthorized = false;
    try {
        isAuthorized = await localAuthentication.authenticate(
        localizedReason: "Please authenticate to continue",
        options: const AuthenticationOptions(biometricOnly: true),
        );
    } catch (exception) {
    log(exception.toString());
    }
    if (isAuthorized) {
        SecureStorage storage = SecureStorage();
        String? email = await storage.getEmail();
        String? password = await storage.getPassword();
        if (email != null && password != null && email.isNotEmpty && password.isNotEmpty) {
            //login here
            await firebaseAuth.signInWithEmailAndPassword( email: email, password: password);
        } else {
            log('Something went wrong');
        }
    } else {
            log('Not matched');
    }
}
```




