// import 'package:weather_task_app/app/modules/home/models/clouds.dart';
import 'package:weather_task_app/app/modules/home/models/coord.dart';
import 'package:weather_task_app/app/modules/home/models/main_weather.dart';
// import 'package:weather_task_app/app/modules/home/models/sys.dart';
import 'package:weather_task_app/app/modules/home/models/weather.dart';
// import 'package:weather_task_app/app/modules/home/models/wind.dart';

class FiveDaysData {
  String? cod;
  int? message;
  int? cnt;
  List<WeatherData>? list;
  City? city;

  FiveDaysData({this.cod, this.message, this.cnt, this.list, this.city});

  factory FiveDaysData.fromJson(dynamic json) {
    if (json == null) {
      return FiveDaysData();
    }
    return FiveDaysData(
      cod: json['cod'],
      message: json['message'],
      cnt: json['cnt'],
      list: (json['list'] as List).map((weatherData) {
        return WeatherData.fromJson(weatherData);
      }).toList(),
      city: City.fromJson(json['city']),
    );
  }
}

class WeatherData {
  // int? dt;
  MainWeather? main;
  List<Weather>? weather;
  // Clouds? clouds;
  // Wind? wind;
  // int? visibility;
  // int? pop;
  // Sys? sys;
  String? dtTxt;

  WeatherData(
      {
        // this.dt,
      this.main,
      this.weather,
      // this.clouds,
      // this.wind,
      // this.visibility,
      // this.pop,
      // this.sys,
      this.dtTxt});

  factory WeatherData.fromJson(dynamic json) {
    if (json == null) {
      return WeatherData();
    }
    return WeatherData(
      // dt: json['dt'],
      main: (json['main'] != null ? MainWeather.fromJson(json['main']) : null),
      weather: (json['weather'] as List).map((weather) {
        return Weather.fromJson(weather);
      }).toList(),
      // clouds: Clouds.fromJson(json['clouds']),
      // wind: Wind.fromJson(json['wind']),
      // visibility: json['visibility'],
      // pop: json['pop'],
      // sys: Sys.fromJson(json['sys']),
      dtTxt: json['dt_txt'],
    );
  }
}

class City {
  int? id;
  String? name;
  Coord? coord;
  String? country;
  int? population;
  int? timezone;
  int? sunrise;
  int? sunset;

  City({
    this.id,
    this.name,
    this.coord,
    this.country,
    this.population,
    this.timezone,
    this.sunrise,
    this.sunset,
  });

  factory City.fromJson(dynamic json) {
    if (json == null) {
      return City();
    }
    return City(
      id: json['id'],
      name: json['name'],
      coord: json['coord'] != null ? Coord.fromJson(json['coord']) : null,
      country: json['country'],
      population: json['population'],
      timezone: json['timezone'],
      sunrise: json['sunrise'],
      sunset: json['sunset'],
    );
  }
}
