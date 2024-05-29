import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:uza_point/common/widgets/loader.dart';
import 'package:uza_point/features/getForcast/presentation/bloc/weather_focast_data_bloc.dart';

class Next7DaysWeather extends StatefulWidget {
  final String? cityName;
  const Next7DaysWeather({super.key, this.cityName});

  @override
  State<Next7DaysWeather> createState() => _Next7DayWeatherState();
}

class _Next7DayWeatherState extends State<Next7DaysWeather> {
  @override
  void initState() {
    super.initState();
    context
        .read<WeatherFocastDataBloc>()
        .add(GetForecastData(cityName: widget.cityName));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: BlocListener<WeatherFocastDataBloc, WeatherFocastDataState>(
        listener: (context, state) {
          if (state is WeatherFocastDataError) {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    backgroundColor: Theme.of(context).colorScheme.error,
                    title: const Text(
                      'An Error Occured',
                      style: TextStyle(color: Colors.white),
                    ),
                    content: Text(state.errorMessage,
                        style: const TextStyle(color: Colors.white)),
                    actions: [
                      TextButton(
                          onPressed: () {
                            context
                                .read<WeatherFocastDataBloc>()
                                .add(const GetForecastData());
                            context.pop();
                          },
                          child: const Text('Retry')),
                      TextButton(
                          onPressed: () {
                            context.pop();
                          },
                          child: const Text('Quit'))
                    ],
                  );
                });
          }
        },
        child: BlocBuilder<WeatherFocastDataBloc, WeatherFocastDataState>(
          builder: (context, state) {
            if (state is WeatherFocastDataLoading) {
            
              return const DefaultSkeleton();
            }
            if (state is WeatherFocastDataLoaded) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  final focastData = state.foreCastData[index];
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 15.0, left: 8, right: 8, bottom: 15),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('${focastData.dt_txt}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(fontWeight: FontWeight.bold)),
                              Text(
                                  '${focastData.weather?.weatherData.first.description}')
                            ],
                          ),
                          const Spacer(),
                          Column(
                            children: [
                              Text('${focastData.mainWeather?.temp}\u00B0'),
                              Text('${focastData.mainWeather?.tempMin}\u00B0')
                            ],
                          ),
                          const Text('|'),
                          CachedNetworkImage(
                            placeholder: (context, url) => const Center(
                              child: CircularProgressIndicator(),
                            ),
                            imageUrl:
                                'https://openweathermap.org/img/wn/${focastData.weather?.weatherData.first.icon}@2x.png',
                            height: 60,
                          ),
                          TextButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: const Text(
                                          'Other Data',
                                        ),
                                        content: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 78.0),
                                              child: CachedNetworkImage(
                                                placeholder: (context, url) =>
                                                    const Center(
                                                  child:
                                                      CircularProgressIndicator(),
                                                ),
                                                imageUrl:
                                                    'https://openweathermap.org/img/wn/${focastData.weather?.weatherData.first.icon}@2x.png',
                                                height: 60,
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 78.0),
                                              child: Text(
                                                '${focastData.weather?.weatherData.first.description}',
                                                style: const TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                                'WindSpeed:  ${focastData.wind?.windSpeed} km/h'),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                                'Windgust:  ${focastData.wind?.windGust} km/h'),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                                'Feels Like:  ${focastData.mainWeather?.feelsLike} °C'),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                                'Humidity:  ${focastData.mainWeather?.humidity} %'),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                                'Pressure:  ${focastData.mainWeather?.pressure} hPa'),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                                'Ground Level:  ${focastData.mainWeather?.seaLevel} m'),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                                'Sea Level:  ${focastData.mainWeather?.groundLevel} m')
                                          ],
                                        ),
                                        actions: [
                                          TextButton(
                                              onPressed: () {
                                                context.pop();
                                              },
                                              child: const Text('Close'))
                                        ],
                                      );
                                    });
                              },
                              child: Text(
                                'See more',
                                style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondary),
                              ))
                        ],
                      ),
                    ),
                  );
                },
                itemCount: state.foreCastData.length,
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
