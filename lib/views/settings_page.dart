import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/theme_mode.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings',
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 28,
              height: 1.4,
            )),
      ),
      body: Consumer<ThemeProvider>(
        builder: (context, theme, _) {
          return Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Change your Theme Mode :",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  onPressed: () {
                    Provider.of<ThemeProvider>(context, listen: false)
                        .toggleThemeMode();
                  },
                  child: Wrap(
                    children: <Widget>[
                      Icon(
                        theme.isDarkMode ? Icons.light_mode : Icons.dark_mode,
                        color: theme.isDarkMode ? Colors.white : Colors.black,
                        size: 24.0,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        theme.isDarkMode ? 'Light Mode' : 'Dark Mode',
                        style: TextStyle(
                          color: theme.isDarkMode ? Colors.white : Colors.black,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
