part of 'weather_focast_data_bloc.dart';

abstract class WeatherFocastDataState extends Equatable {
  const WeatherFocastDataState();

  @override
  List<Object> get props => [];
}

class WeatherFocastDataInitial extends WeatherFocastDataState {}

class WeatherFocastDataLoading extends WeatherFocastDataState {}

class WeatherFocastDataLoaded extends WeatherFocastDataState {
  const WeatherFocastDataLoaded({required this.foreCastData});
  final List<ForeCastEntity> foreCastData;
}

class WeatherFocastDataError extends WeatherFocastDataState {
  const WeatherFocastDataError({required this.errorMessage});
  final String errorMessage;
}
