import 'package:flutter/material.dart';
import 'package:weather_app/views/weather_card.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  List<String> titles = [
    "Indore",
    "Bhopal",
    "Jabalpur",
    "Gwalior",
    "Ujjain",
    "Ratlam",
    "Dewas",
    "Rewa",
    "Satna",
    "Sagar",
    "Guna",
    "Vidisha"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App',
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 28,
              height: 1.4,
            )),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.settings,
              size: 30.0,
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/settings');
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: titles.length,
        itemBuilder: (context, index) {
          return Container(
            height: 130,
            margin:
                const EdgeInsets.only(bottom: 40, top: 10, left: 20, right: 20),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color(0xff467BFF),
                  Color(0xffaf75d0),
                ],
              ),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(60),
                bottomRight: Radius.circular(10),
                bottomLeft: Radius.circular(60),
              ),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(1.5, 4.5),
                  blurRadius: 20.0,
                  spreadRadius: 1,
                  color: const Color(0xffC661FF).withAlpha(150),
                ),
              ],
            ),
            child: ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (
                      context,
                    ) =>
                        WeatherCard(names: titles[index]),
                  ),
                );
              },
              title: Text(
                titles[index],
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 28,
                  height: 1.4,
                ),
              ),
              subtitle: const Icon(
                Icons.cloudy_snowing,
                color: Colors.white,
                size: 50.0,
              ),
              trailing: const Icon(
                Icons.wb_sunny_rounded,
                color: Colors.orangeAccent,
                size: 50.0,
              ),
            ),
          );
        },
      ),
    );
  }
}
