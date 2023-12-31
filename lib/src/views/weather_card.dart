import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/src/models/weather.dart';
import 'package:weather_app/src/services/weather_service.dart';


class WeatherCard extends StatelessWidget {
  final String names;
  const WeatherCard({super.key, required this.names});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Weather"),
      ),
      body:  Consumer<WeatherService>(
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
                return Padding(
                  padding: EdgeInsets.all(10),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height / 1.8,
                    width: MediaQuery.of(context).size.width,
                    child: Card(
                    color: Colors.blueAccent,
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 20),
                          Text(weather.name,
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                              decoration: TextDecoration.none,
                            ),
                          ),
                          Text(
                            weather.main.toString(),
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
                  ),)
                );

              }
            },
          );
        },
      ),
    );
  }
}
