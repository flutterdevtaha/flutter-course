import 'package:weather_task_app/app/modules/home/models/clouds.dart';
import 'package:weather_task_app/app/modules/home/models/coord.dart';
import 'package:weather_task_app/app/modules/home/models/main_weather.dart';
import 'package:weather_task_app/app/modules/home/models/sys.dart';
import 'package:weather_task_app/app/modules/home/models/weather.dart';
import 'package:weather_task_app/app/modules/home/models/wind.dart';

class CurrentWeatherData {
  final Coord? coord;
  final List<Weather>? weather;
  final String? base;
  final MainWeather? main;
  final int? visibility;
  final Wind? wind;
  final Clouds? clouds;
  final int? dt;
  final Sys? sys;
  final int? timezone;
  final int? id;
  final String? name;
  final int? cod;

  CurrentWeatherData({
    this.coord,
    this.weather,
    this.base,
    this.main,
    this.visibility,
    this.wind,
    this.clouds,
    this.dt,
    this.sys,
    this.timezone,
    this.id,
    this.name,
    this.cod,
  });

  factory CurrentWeatherData.fromJson(dynamic json) {
    if (json == null) {
      return CurrentWeatherData();
    }
    return CurrentWeatherData(
      coord: Coord.fromJson(json['coord']),
      weather: (json['weather'] as List).map((weather) {
        return Weather.fromJson(weather);
      }).toList(),
      base: json['base'],
      main: MainWeather.fromJson(json['main']),
      visibility: json['visibility'],
      wind: Wind.fromJson(json['wind']),
      clouds: Clouds.fromJson(json['clouds']),
      dt: json['dt'],
      sys: Sys.fromJson(json['sys']),
      timezone: json['timezone'],
      id: json['id'],
      name: json['name'],
      cod: json['cod'],
    );
  }
}
