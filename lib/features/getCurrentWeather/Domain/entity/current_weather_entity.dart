import 'package:equatable/equatable.dart';
import 'package:uza_point/features/getCurrentWeather/Data/models/current_weather_model.dart';

class CurrentWeatherEntity extends Equatable {
  final WeatherItem? weatherData;
  final MainWeather? mainWeatherData;
  final Wind? windData;
  final Clouds? clouds;
  final Sys? sysData;
  final String? cityName;
  final int? visibility;
  final int? dt;
  final RainIn1HR? chance;
  const CurrentWeatherEntity(
      {this.cityName,
      this.chance,
      this.clouds,
      this.mainWeatherData,
      this.sysData,
      this.weatherData,
      this.windData,
      this.dt,
      this.visibility});

  @override
  List<Object?> get props => [
        weatherData,
        mainWeatherData,
        windData,
        clouds,
        sysData,
        cityName,
        dt,
        visibility,
        chance
      ];
}
