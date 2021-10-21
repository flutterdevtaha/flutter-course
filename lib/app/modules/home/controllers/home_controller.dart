import 'package:get/get.dart';
import 'package:weather_task_app/app/modules/home/models/current_weather_data.dart';
import 'package:weather_task_app/app/modules/home/models/fivedaysdata.dart';
import 'package:weather_task_app/app/modules/home/service/weather_service.dart';

class HomeController extends GetxController {
  String? city;
  String? searchText;
  CurrentWeatherData currentWeatherData = CurrentWeatherData();
  List<WeatherData> fiveDaysData = [];
  HomeController({required this.city});

  void getCurrentWeatherData() {
    WeatherService(city: '$city').getCurrentWeatherData(
      onSuccess: (data) {
        print('data = ${data.name}');
        print('data = ${data.base}');
        print('data = ${data.clouds?.all}');
        print('data = ${data.cod}');
        print('data = ${data.coord?.lat}');
        print('data = ${data.dt}');
        print('data = ${data.id}');
        print('data = ${data.main?.temp}');
        print('data = ${data.sys?.country}');
        print('data = ${data.timezone}');
        print('data = ${data.visibility}');
        print('data = ${data.weather?[0].main}');
        print('data = ${data.wind?.deg}');
        currentWeatherData = data;
        update();
      },
      onError: (error) => {
        print(error),
        update(),
      },
    );
  }

  void onChanged(enteredCity) {
    print('city = $city');
    city = enteredCity;
    update();
  }

  void getFiveDaysData() {
    WeatherService(city: '$city').fiveDaysForcastData(
      onSuccess: (data) {
        fiveDaysData = data;

        update();
      },
      onError: (error) => {
        print(error),
        update(),
      },
    );
  }

  @override
  // ignore: unnecessary_overrides
  void onInit() {
    getCurrentWeatherData();
    getFiveDaysData();
    super.onInit();
  }

  @override
  // ignore: unnecessary_overrides
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
