part of 'weather_focast_data_bloc.dart';

abstract class WeatherFocastDataEvent extends Equatable {
  const WeatherFocastDataEvent();

  @override
  List<Object> get props => [];
}

class GetForecastData extends WeatherFocastDataEvent {
  const GetForecastData({this.cityName});
  final String? cityName;
}
