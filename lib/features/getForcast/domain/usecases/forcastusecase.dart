import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:uza_point/di/di.dart';
import 'package:uza_point/features/getForcast/domain/entities/forecast_enity.dart';
import 'package:uza_point/features/getForcast/domain/repository/getforecast_repo.dart';

@Injectable()
class ForeCastUseCase {
  Future<Either<String, List<ForeCastEntity>>> getForeCastWeatherData(
      {String? cityName}) async {
    final forecastData =
        await getIt<GetForecast>().getForeCast(cityName: cityName);
    return forecastData;
  }
}
