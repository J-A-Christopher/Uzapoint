import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:uza_point/di/di.dart';
import 'package:uza_point/features/getCurrentWeather/Domain/entity/current_weather_entity.dart';
import 'package:uza_point/features/getCurrentWeather/Domain/repository/current_weather_domain_repo.dart';

@Injectable()
class GetCurrentWeatherUseCase {
  Future<Either<String, CurrentWeatherEntity>> getWeatherData(
      {String? cityName}) async {
    final getCartData = await getIt<GetCurrentWeatherData>()
        .getCurrentWeather(cityName: cityName);
    return getCartData;
  }
}
