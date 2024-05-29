part of 'get_current_weather_bloc.dart';

abstract class GetCurrentWeatherState extends Equatable {
  const GetCurrentWeatherState();

  @override
  List<Object> get props => [];
}

class GetCurrentWeatherInitial extends GetCurrentWeatherState {}

class GetCurrentWeatherLoading extends GetCurrentWeatherState {}

class GetCurrentWeatherLoaded extends GetCurrentWeatherState {
  const GetCurrentWeatherLoaded({required this.weatherData});
  final CurrentWeatherEntity weatherData;
}

class GetCurrentWeatherError extends GetCurrentWeatherState {
  const GetCurrentWeatherError({required this.errorMessage});
  final String errorMessage;
}
