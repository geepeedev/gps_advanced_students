import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gps_advanced_students/features/dashboard/data/source/local_data_source.dart';
import 'package:gps_advanced_students/firebase_options.dart';
import 'package:gps_advanced_students/godspath_app.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:window_manager/window_manager.dart';
// import 'package:gps_advanced_students/core/common/components/text.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Supabase.initialize(
  //   url: 'https://xyzcompany.supabase.co',
  //   anonKey: 'public-anon-key',
  // );
  LocalDataSource(preferencesAsync: SharedPreferencesAsync());
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await windowManager.ensureInitialized();

  WindowOptions windowOptions = const WindowOptions(
    titleBarStyle: TitleBarStyle.hidden,
    // fullScreen: true,
    minimumSize: Size(600, 500),
    center: true,
    backgroundColor: Colors.transparent,
    skipTaskbar: false,
    windowButtonVisibility: false,
  );

  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();

    await windowManager.focus();
    await windowManager.isResizable();
    await windowManager.setResizable(true);
  });
  runApp(const GodspathApp());
}
