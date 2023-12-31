import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/src/models/theme_mode.dart';
import 'package:weather_app/src/services/weather_service.dart';
import 'package:weather_app/src/views/home_page.dart';
import 'package:weather_app/src/views/settings_page.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => WeatherService()),
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, _) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Weather App',
            theme: ThemeData.light(),
            darkTheme: ThemeData.dark(),
            themeMode:
                themeProvider.isDarkMode ? ThemeMode.dark : ThemeMode.light,
            home: HomePage(),
            routes: {
              '/settings': (context) => SettingsPage(),
            },
          );
        },
      ),
    );
  }
}
