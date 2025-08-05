import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';
import 'Feature/Home/view/screen/overlay_wrapper.dart';
import 'core/function/window_option.dart';
import 'core/helper/shared_pref.dart';
import 'core/service/service_locator.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();
  WindowOptionFunction.windowOption();
  await AppSharedPrefs.init();
  setupGetIt();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      home: const OverlayWrapper(),
    );
  }
}
