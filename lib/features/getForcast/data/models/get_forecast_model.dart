import 'package:equatable/equatable.dart';
import 'package:uza_point/features/getForcast/domain/entities/forecast_enity.dart';

class GetForeCastModel extends ForeCastEntity with EquatableMixin {
  @override
  final String? dt_txt;
  @override
  final MainWeatherForeCast? mainWeather;
  @override
  final WeatherItem? weather;
  @override
  final Clouds? clouds;
  @override
  final Wind? wind;
  GetForeCastModel(
      {this.clouds, this.dt_txt, this.mainWeather, this.weather, this.wind});

  factory GetForeCastModel.fromJson(Map<String, dynamic> data) {
    return GetForeCastModel(
        clouds: Clouds.fromJson(data['clouds']),
        dt_txt: data['dt_txt'],
        mainWeather: MainWeatherForeCast.fromJson(data['main']),
        weather: WeatherItem.fromJson(List<dynamic>.from(data['weather'])),
        wind: Wind.fromJson(data['wind']));
  }
}

class MainWeatherForeCast {
  final dynamic temp;
  final dynamic feelsLike;
  final dynamic tempMin;
  final dynamic tempMax;
  final dynamic pressure;
  final dynamic humidity;
  final dynamic seaLevel;
  final dynamic groundLevel;
  MainWeatherForeCast(
      {this.feelsLike,
      this.groundLevel,
      this.seaLevel,
      this.humidity,
      this.pressure,
      this.temp,
      this.tempMax,
      this.tempMin});
  factory MainWeatherForeCast.fromJson(Map<String, dynamic> data) {
    return MainWeatherForeCast(
        feelsLike: data['feels_like'],
        humidity: data['humidity'],
        pressure: data['pressure'],
        temp: data['temp'],
        groundLevel: data['grnd_level'],
        seaLevel: data['sea_level'],
        tempMax: data['temp_max'],
        tempMin: data['temp_min']);
  }
}

class Weather {
  final int? id;
  final String? main;
  final String? description;
  final String? icon;
  Weather({this.description, this.id, this.main, this.icon});

  factory Weather.fromJson(Map<String, dynamic> data) {
    return Weather(
      description: data['description'],
      id: data['id'],
      main: data['main'],
      icon: data['icon'],
    );
  }
}

class WeatherItem {
  final List<Weather> weatherData;

  WeatherItem({required this.weatherData});

  factory WeatherItem.fromJson(List<dynamic> data) {
    return WeatherItem(
      weatherData: data.map((weatherD) => Weather.fromJson(weatherD)).toList(),
    );
  }
}

class Clouds {
  final int? all;
  Clouds({this.all});

  factory Clouds.fromJson(Map<String, dynamic> data) {
    return Clouds(all: data['all']);
  }
}

class Wind {
  final dynamic windSpeed;
  final dynamic windGust;
  Wind({this.windSpeed, this.windGust});

  factory Wind.fromJson(Map<String, dynamic> data) {
    return Wind(windSpeed: data['speed'], windGust: data['gust']);
  }
}
