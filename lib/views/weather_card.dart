import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/services/weather_service.dart';

class WeatherCard extends StatelessWidget {
  final String names;
  const WeatherCard({super.key, required this.names});

  @override
  Widget build(BuildContext context) {
    return Consumer<WeatherService>(
      builder: (context, weatherService, _) {
        return FutureBuilder<WeatherModel?>(
          future: weatherService.getWeather(names),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData) {
              return const Center(child: Text('No data available'));
            } else {
              final weather = snapshot.data!;
              return Container(
                padding: EdgeInsets.only(
                    left: 20.0, right: 20.0, top: 50.0, bottom: 300.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.white,
                ),
                child: Card(
                  color: Colors.blueAccent,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),
                        Text(
                          '${weather.name}',
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            decoration: TextDecoration.none,
                          ),
                        ),
                        Text(
                          '${weather.main}',
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            decoration: TextDecoration.none,
                          ),
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${weather.main.temp}°C',
                              textAlign: TextAlign.start,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 60,
                                // fontStyle: FontStyle.italic,
                                decoration: TextDecoration.none,
                              ),
                            ),
                            Icon(
                              Icons.wb_sunny_rounded,
                              color: Colors.amberAccent,
                              size: 80,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Icon(
                              Icons.cloudy_snowing,
                              color: Colors.white,
                              size: 80,
                            ),
                          ],
                        ),
                        Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Icon(
                              Icons.light_mode,
                              color: Colors.white,
                              size: 40,
                            ),
                            Icon(
                              Icons.dark_mode,
                              color: Colors.white,
                              size: 40,
                            ),
                            Icon(
                              Icons.sunny_snowing,
                              color: Colors.white,
                              size: 40,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }
          },
        );
      },
    );
  }
}
