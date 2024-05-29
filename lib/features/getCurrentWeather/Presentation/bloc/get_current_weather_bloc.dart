import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:uza_point/di/di.dart';
import 'package:uza_point/features/getCurrentWeather/Domain/entity/current_weather_entity.dart';
import 'package:uza_point/features/getCurrentWeather/Domain/usecases/getcurrent_weather.dart';

part 'get_current_weather_event.dart';
part 'get_current_weather_state.dart';

@Injectable()
class GetCurrentWeatherBloc
    extends Bloc<GetCurrentWeatherEvent, GetCurrentWeatherState> {
  GetCurrentWeatherBloc() : super(GetCurrentWeatherInitial()) {
    on<GetWeatherDataEvent>((event, emit) async {
      emit(GetCurrentWeatherLoading());
      final getWeatherDataUseCase = await getIt<GetCurrentWeatherUseCase>()
          .getWeatherData(cityName: event.cityName);

      getWeatherDataUseCase.fold(
          (failure) => emit(GetCurrentWeatherError(errorMessage: failure)),
          (weatherData) {
        emit(GetCurrentWeatherLoaded(weatherData: weatherData));
      });
    });
  }
}
