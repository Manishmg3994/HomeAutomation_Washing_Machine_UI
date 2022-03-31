import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:awsome_project/screens/main/main_screen.dart';
import 'package:awsome_project/view_models/main_view_model.dart';
import 'package:awsome_project/view_models/service_locator.dart';
import 'package:awsome_project/view_models/settings_view_model.dart';
import 'package:awsome_project/view_models/theme_view_model.dart';
import 'package:awsome_project/view_models/timer_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  ServiceLocator.init();

  runApp( const MyApp());
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: [SystemUiOverlay.bottom]);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => ServiceLocator.get<ThemeViewModel>()),
        ChangeNotifierProvider(
            create: (_) => ServiceLocator.get<SettingsViewModel>()),
        ChangeNotifierProvider(
            create: (_) => ServiceLocator.get<MainViewModel>()),
        ChangeNotifierProvider(
            create: (_) => ServiceLocator.get<TimerViewModel>()),
      ],
      child: const MaterialApp(
        title: 'Smart Washing Machine',
        debugShowCheckedModeBanner: false,
        home: MainScreen(),
      ),
    );
  }
}
