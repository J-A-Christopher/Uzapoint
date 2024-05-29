import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';
import 'package:uza_point/common/constants/constants.dart';
import 'package:uza_point/common/exceptions/exceptions.dart';
import 'package:uza_point/features/getCurrentWeather/Data/models/current_weather_model.dart';
import 'package:dio/dio.dart';
import 'package:uza_point/features/getForcast/data/models/get_forecast_model.dart';

abstract class GetCurrentWeather {
  Future<CurrentWeatherModel> getCurrentWeather({String? cityName});
  Future<List<GetForeCastModel>> getWeatherForeCast({String? cityName});
}

@Injectable(as: GetCurrentWeather)
class GetCurrentWeatherImpl implements GetCurrentWeather {
  final dio = Dio();
  @override
  Future<CurrentWeatherModel> getCurrentWeather({String? cityName}) async {
    String city = cityName ?? 'Nairobi';
    try {
      final weatherResult = await dio.get(
          '$baseUrl/weather?q=$city&units=metric&appid=${dotenv.env['API_KEY']}');
      return CurrentWeatherModel.fromJson(weatherResult.data);
    } on DioException catch (e) {
      if (e.response != null) {
        final requestMessage = e.response!.data['message'];
        throw RequestException(requestMessage);
      } else {
        //When device is offline
        String? errorMessage = e.message;

        int colonIndex = errorMessage!.indexOf(':');
        String extractedPart =
            "${errorMessage.substring(0, colonIndex).trim()} are you online?";

        throw NetworkException(extractedPart);
      }
    }
  }

  @override
  Future<List<GetForeCastModel>> getWeatherForeCast({String? cityName}) async {
    String city = cityName ?? 'Nairobi';
    try {
      final weatherForecast = await dio.get(
          '$baseUrl/forecast?q=$city&units=metric&appid=${dotenv.env['API_KEY']}');
      final listOfForeCasts = weatherForecast.data['list'] as List<dynamic>;
      final returnedItemList = listOfForeCasts
          .map((foreCastData) => GetForeCastModel.fromJson(foreCastData))
          .toList();

      return returnedItemList;
    } on DioException catch (e) {
      if (e.response != null) {
        final requestMessage = e.response!.data['message'];
        throw RequestException(requestMessage);
      } else {
        //When device is offline
        String? errorMessage = e.message;

        int colonIndex = errorMessage!.indexOf(':');
        String extractedPart =
            "${errorMessage.substring(0, colonIndex).trim()} are you online?";

        throw NetworkException(extractedPart);
      }
    }
  }
}
