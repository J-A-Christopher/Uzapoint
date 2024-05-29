part of 'get_current_weather_bloc.dart';

abstract class GetCurrentWeatherEvent extends Equatable {
  const GetCurrentWeatherEvent();

  @override
  List<Object> get props => [];
}

class GetWeatherDataEvent extends GetCurrentWeatherEvent {
  const GetWeatherDataEvent({this.cityName});
  final String? cityName;
}
