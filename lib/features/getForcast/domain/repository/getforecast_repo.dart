import 'package:dartz/dartz.dart';
import 'package:uza_point/features/getForcast/domain/entities/forecast_enity.dart';

abstract class GetForecast {
  Future<Either<String,List<ForeCastEntity>>> getForeCast({String? cityName});
}
