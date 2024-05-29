import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:uza_point/common/datasource/weather_datasource.dart';
import 'package:uza_point/common/exceptions/exceptions.dart';
import 'package:uza_point/di/di.dart';
import 'package:uza_point/features/getCurrentWeather/Domain/entity/current_weather_entity.dart';
import 'package:uza_point/features/getCurrentWeather/Domain/repository/current_weather_domain_repo.dart';

@Injectable(as: GetCurrentWeatherData)
class GetCurrentWeatherDataImpl implements GetCurrentWeatherData {
  @override
  Future<Either<String, CurrentWeatherEntity>> getCurrentWeather(
      {String? cityName}) async {
    try {
      final getWeatherData = await getIt<GetCurrentWeather>()
          .getCurrentWeather(cityName: cityName);

      return right(getWeatherData);
    } on RequestException catch (e) {
      return left(e.message);
    } on NetworkException catch (e) {
      return left(e.message);
    } catch (e, stackTrace) {
      print(e);
      print(stackTrace);
      return left('An unknown error occurred. Try again later');
    }
  }
}
