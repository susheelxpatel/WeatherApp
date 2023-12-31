class WeatherModel {
  WeatherModel({
    required this.main,
    required this.name,
  });
  late final Main main;
  late final String name;

  WeatherModel.fromJson(Map<String, dynamic> json) {
    main = Main.fromJson(json['main']);
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['main'] = main.toJson();
    data['name'] = name;
    return data;
  }
}

class Main {
  Main({
    required this.temp,
  });
  late final double temp;

  Main.fromJson(Map<String, dynamic> json) {
    temp = json['temp'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['temp'] = temp;
    return data;
  }
}
