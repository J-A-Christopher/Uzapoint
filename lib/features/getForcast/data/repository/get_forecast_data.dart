import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:uza_point/common/datasource/weather_datasource.dart';
import 'package:uza_point/common/exceptions/exceptions.dart';
import 'package:uza_point/di/di.dart';
import 'package:uza_point/features/getForcast/domain/entities/forecast_enity.dart';
import 'package:uza_point/features/getForcast/domain/repository/getforecast_repo.dart';

@Injectable(as: GetForecast)
class GetForecastImpl implements GetForecast {
  @override
  Future<Either<String, List<ForeCastEntity>>> getForeCast(
      {String? cityName}) async {
    try {
      final getWeatherForeCast = await getIt<GetCurrentWeather>()
          .getWeatherForeCast(cityName: cityName);
      return right(getWeatherForeCast);
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
