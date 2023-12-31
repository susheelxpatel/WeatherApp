import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:weather_app/src/models/weather.dart';


class WeatherService with ChangeNotifier {
  final String apiKey = '372023e1efe6254807699d8f5a21c619';
  final String apiUrl = 'http://api.openweathermap.org/data/2.5/weather';

  Future<WeatherModel?> getWeather(String city) async {
    try {
      var request = http.Request(
          'GET', Uri.parse('$apiUrl?q=$city&appid=$apiKey&units=metric'));
      StreamedResponse streamedResponse =
          await request.send().timeout(const Duration(seconds: 30));

      if (streamedResponse.statusCode == 200) {
        final response = await Response.fromStream(streamedResponse);
        return WeatherModel.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to load weather data');
      }
    } on SocketException catch (e) {
      throw Exception('Network error: $e');
    } on FormatException catch (e) {
      throw Exception('Invalid response format: $e');
    } catch (e) {
      throw Exception('An unexpected error occurred: $e');
    } finally {}
  }
}
