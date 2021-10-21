import 'package:weather_task_app/app/modules/home/models/current_weather_data.dart';
import 'package:weather_task_app/app/modules/home/models/fivedaysdata.dart';
import 'package:weather_task_app/app/modules/home/providers/api_provider.dart';

class WeatherService {
  final String city;
  String baseUrl = 'https://api.openweathermap.org/data/2.5';
  String apiKey = 'appid=b7975588e7aa62e0cb79cd1eb4049b48';
  WeatherService({required this.city});

  void getCurrentWeatherData({
    Function()? beforeSend,
    Function(CurrentWeatherData currentWeatherData)? onSuccess,
    Function(dynamic error)? onError,
  }) {
    final url = '$baseUrl/weather?q=$city&lang=en&$apiKey';
    ApiProvider(url: url, payload: null).get(
      beforeSend: () => {
        if (beforeSend != null)
          {
            beforeSend(),
          }
      },
      onSuccess: (data) => {
        onSuccess!(
          CurrentWeatherData.fromJson(data),
        ),
      },
      onError: (error) => {
        if (onError != null)
          {
            print('error = $error'),
            onError(error),
          }
      },
    );
  }

  void fiveDaysForcastData({
    Function()? beforeSend,
    Function(List<WeatherData> fiveDaysData)? onSuccess,
    Function(dynamic error)? onError,
  }) {
    final url = '$baseUrl/forecast?q=$city&lang=en&$apiKey';
    print('url = $url');
    ApiProvider(url: url, payload: null).get(
      beforeSend: () => {},
      onSuccess: (data) => {
        print('success'),
        onSuccess!((data['list'] as List)
            .map((t) => WeatherData.fromJson(t))
            .toList()),
      },
      onError: (error) => {
        print('error = $error'),
      },
    );
  }
}
