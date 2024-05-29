// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:uza_point/common/datasource/weather_datasource.dart' as _i11;
import 'package:uza_point/features/getCurrentWeather/Data/repository/weather_data_repo.dart'
    as _i10;
import 'package:uza_point/features/getCurrentWeather/Domain/repository/current_weather_domain_repo.dart'
    as _i9;
import 'package:uza_point/features/getCurrentWeather/Domain/usecases/getcurrent_weather.dart'
    as _i4;
import 'package:uza_point/features/getCurrentWeather/Presentation/bloc/get_current_weather_bloc.dart'
    as _i3;
import 'package:uza_point/features/getForcast/data/repository/get_forecast_data.dart'
    as _i8;
import 'package:uza_point/features/getForcast/domain/repository/getforecast_repo.dart'
    as _i7;
import 'package:uza_point/features/getForcast/domain/usecases/forcastusecase.dart'
    as _i6;
import 'package:uza_point/features/getForcast/presentation/bloc/weather_focast_data_bloc.dart'
    as _i5;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.GetCurrentWeatherBloc>(() => _i3.GetCurrentWeatherBloc());
    gh.factory<_i4.GetCurrentWeatherUseCase>(
        () => _i4.GetCurrentWeatherUseCase());
    gh.factory<_i5.WeatherFocastDataBloc>(() => _i5.WeatherFocastDataBloc());
    gh.factory<_i6.ForeCastUseCase>(() => _i6.ForeCastUseCase());
    gh.factory<_i7.GetForecast>(() => _i8.GetForecastImpl());
    gh.factory<_i9.GetCurrentWeatherData>(
        () => _i10.GetCurrentWeatherDataImpl());
    gh.factory<_i11.GetCurrentWeather>(() => _i11.GetCurrentWeatherImpl());
    return this;
  }
}
