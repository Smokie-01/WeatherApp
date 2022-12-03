import 'package:climate/services/networking.dart';
import 'package:climate/services/location.dart';

// "https://api.openweathermap.org/data/2.5/weather?q=$query&appid=$queryparameter";

class WeatherModel {
  Future<dynamic> weatherByCityName(String cityName) async {
    final queryParameter = {
      'q': cityName,
      'appid': '5b9a5aec847d2f73df90019670ac7fef',
      'units': 'metric'
    };

    Networking network = Networking(
        uri: Uri.https(
            "api.openweathermap.org", 'data/2.5/weather', queryParameter));

    var weatherData = await network.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();

    await location.getCurrentLocation();

    final queryparameter = {
      'lat': '${location.latitude}',
      'lon': '${location.longitude}',
      'appid': '5b9a5aec847d2f73df90019670ac7fef',
      'units': 'metric'
    };

    Networking network = Networking(
        uri: (Uri.https(
            'api.openweathermap.org', 'data/2.5/weather', queryparameter)));

    var weatherData = await network.getData();

    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }
}
