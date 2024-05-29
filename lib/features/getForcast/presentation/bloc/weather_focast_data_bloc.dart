import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:uza_point/di/di.dart';
import 'package:uza_point/features/getForcast/domain/entities/forecast_enity.dart';
import 'package:uza_point/features/getForcast/domain/usecases/forcastusecase.dart';

part 'weather_focast_data_event.dart';
part 'weather_focast_data_state.dart';

@Injectable()
class WeatherFocastDataBloc
    extends Bloc<WeatherFocastDataEvent, WeatherFocastDataState> {
  WeatherFocastDataBloc() : super(WeatherFocastDataInitial()) {
    on<GetForecastData>((event, emit) async {
      emit(WeatherFocastDataLoading());
      final getWeatherForeCastDataUseCase = await getIt<ForeCastUseCase>()
          .getForeCastWeatherData(cityName: event.cityName);

      getWeatherForeCastDataUseCase.fold(
          (failure) => emit(WeatherFocastDataError(errorMessage: failure)),
          (weatherForeCastDataData) {
        emit(WeatherFocastDataLoaded(foreCastData: weatherForeCastDataData));
      });
    });
  }
}
