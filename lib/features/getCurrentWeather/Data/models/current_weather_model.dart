import 'package:equatable/equatable.dart';
import 'package:uza_point/features/getCurrentWeather/Domain/entity/current_weather_entity.dart';

class CurrentWeatherModel extends CurrentWeatherEntity with EquatableMixin {
  @override
  final WeatherItem? weatherData;
  @override
  final MainWeather? mainWeatherData;
  @override
  final Wind? windData;
  @override
  final Clouds? clouds;
  @override
  final Sys? sysData;
  @override
  final String? cityName;
  @override
  final int? visibility;
  @override
  final int? dt;
  @override
  final RainIn1HR? chance;
  CurrentWeatherModel(
      {this.cityName,
      this.chance,
      this.dt,
      this.visibility,
      this.clouds,
      this.mainWeatherData,
      this.sysData,
      this.weatherData,
      this.windData});
  factory CurrentWeatherModel.fromJson(Map<String, dynamic> data) {
    return CurrentWeatherModel(
      cityName: data['name'],
      clouds: Clouds.fromJson(data['clouds']),
      mainWeatherData: MainWeather.fromJson(data['main']),
      sysData: Sys.fromJson(data['sys']),
      weatherData: WeatherItem.fromJson(List<dynamic>.from(data['weather'])),
      windData: Wind.fromJson(data['wind']),
      dt: data['dt'],
      visibility: data['visibility'],
    );
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

class MainWeather {
  final dynamic temp;
  final dynamic feelsLike;
  final dynamic tempMin;
  final dynamic tempMax;
  final dynamic pressure;
  final dynamic humidity;
  final dynamic seaLevel;
  final dynamic groundLevel;
  MainWeather(
      {this.feelsLike,
      this.groundLevel,
      this.seaLevel,
      this.humidity,
      this.pressure,
      this.temp,
      this.tempMax,
      this.tempMin});
  factory MainWeather.fromJson(Map<String, dynamic> data) {
    return MainWeather(
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

class Wind {
  final dynamic windSpeed;
  final dynamic windGust;
  Wind({this.windSpeed, this.windGust});

  factory Wind.fromJson(Map<String, dynamic> data) {
    return Wind(windSpeed: data['speed'], windGust: data['gust']);
  }
}

class RainIn1HR {
  final double? chance;

  RainIn1HR({this.chance});

  factory RainIn1HR.fromJson(Map<String, dynamic> data) {
    return RainIn1HR(chance: data['1h']);
  }
}

class Clouds {
  final int? all;
  Clouds({this.all});

  factory Clouds.fromJson(Map<String, dynamic> data) {
    return Clouds(all: data['all']);
  }
}

class Sys {
  final String? country;
  final int? sunrise;
  final int? sunset;
  Sys({this.country, this.sunrise, this.sunset});

  factory Sys.fromJson(Map<String, dynamic> data) {
    return Sys(
        country: data['country'],
        sunrise: data['sunrise'],
        sunset: data['sunset']);
  }
}
