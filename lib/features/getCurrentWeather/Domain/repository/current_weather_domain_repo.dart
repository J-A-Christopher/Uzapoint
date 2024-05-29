import 'package:dartz/dartz.dart';
import 'package:uza_point/features/getCurrentWeather/Domain/entity/current_weather_entity.dart';

abstract class GetCurrentWeatherData {
  Future<Either<String, CurrentWeatherEntity>> getCurrentWeather({String? cityName});
}
