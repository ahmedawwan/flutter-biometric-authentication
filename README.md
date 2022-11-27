# flutter_fingerprint_authentication

Basically the idea is to store the user login information upon registration or login in a `secure storage`, and whenever the session expires or user logs out, we can access that information using local authentication and authenticate the user to the server.

## Required Packages

<li>local_auth</li>
<li>flutter_secure_storage</li>

Add the above two packages in your `pubspec.yaml`

```yaml
dependencies:
  local_auth: latest
  flutter_secure_storage: latest
```

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

### Permissions

Update your project’s AndroidManifest.xml file to include the USE_BIOMETRIC permissions:

```xml
<manifest xmlns:android="http://schemas.android.com/apk/res/android"
          package="com.example.app">
  <uses-permission android:name="android.permission.USE_BIOMETRIC"/>
<manifest>
```



