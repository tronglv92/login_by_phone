import 'dart:async';
import 'dart:isolate';


import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appcenter_bundle/flutter_appcenter_bundle.dart';
import 'package:login_by_phone/utils/app_config.dart';

import 'package:login_by_phone/utils/app_theme.dart';


import 'my_app.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  AppConfig(env: Env.dev(), theme: AppTheme.origin());
  await AppCenter.startAsync(
    appSecretAndroid: '3ec2780e-24f8-4cde-a043-04aa7fc155b1',
    appSecretIOS: '2da3d93f-6b3f-48f9-920f-2d63ae3cd25a',
    enableDistribute: false,
  );
  await AppCenter.configureDistributeDebugAsync(enabled: false);
  await Firebase.initializeApp();
  // Initialize Crash report
  await FirebaseCrashlytics.instance
      .setCrashlyticsCollectionEnabled(true);
  // Pass all uncaught errors from the framework to Crashlytics.
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;

  // Errors outside of Flutter
  Isolate.current.addErrorListener(RawReceivePort((List<dynamic> pair) async {
    final List<dynamic> errorAndStacktrace = pair;
    await FirebaseCrashlytics.instance.recordError(
      errorAndStacktrace.first,
      errorAndStacktrace.last as StackTrace,
    );
  }).sendPort);

  // Zoned Errors
  runZonedGuarded<Future<void>>(() async {
    await myMain();
  }, FirebaseCrashlytics.instance.recordError);

}
