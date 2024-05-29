import 'package:equatable/equatable.dart';
import 'package:uza_point/features/getForcast/data/models/get_forecast_model.dart';

class ForeCastEntity extends Equatable {
  
  final String? dt_txt;
  final MainWeatherForeCast? mainWeather;
  final WeatherItem? weather;
  final Clouds? clouds;
  final Wind? wind;
  const ForeCastEntity(
      {this.clouds, this.dt_txt, this.mainWeather, this.weather, this.wind});

  @override
  List<Object?> get props => [dt_txt, mainWeather, weather, clouds, wind];
}
