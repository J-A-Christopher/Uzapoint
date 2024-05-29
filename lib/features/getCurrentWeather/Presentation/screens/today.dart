import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:uza_point/common/widgets/grid_loader.dart';
import 'package:uza_point/features/getCurrentWeather/Presentation/bloc/get_current_weather_bloc.dart';
import 'package:weather_icons/weather_icons.dart';

class TodayWeather extends StatelessWidget {
  const TodayWeather({super.key});

  @override
  Widget build(BuildContext context) {
    final sizedObject = MediaQuery.of(context).size;
    String getValueForIndex(int index, GetCurrentWeatherLoaded state) {
      switch (index) {
        case 0:
          return '${state.weatherData.mainWeatherData?.tempMin?.round() ?? '0'} °C';
        case 1:
          return '${state.weatherData.mainWeatherData?.tempMax?.round() ?? '0'} °C';
        case 2:
          return '${state.weatherData.mainWeatherData?.pressure ?? '0'} hPa';
        case 3:
          return '${state.weatherData.mainWeatherData?.humidity ?? '0'} %';
        case 4:
          return '${state.weatherData.mainWeatherData?.seaLevel ?? '0'} m';
        case 5:
          return '${state.weatherData.mainWeatherData?.groundLevel ?? '0'} m';
        case 6:
          return '${state.weatherData.windData?.windSpeed?.round() ?? '0'} km/h';
        case 7:
          return '${state.weatherData.windData?.windGust?.round() ?? '0'} km/h';
        default:
          return '-';
      }
    }

    List<String> weatherOptions = [
      'Min-Temp',
      'Max-Temp',
      'Pressure',
      'Humidity',
      'Sea Level',
      'Ground-Level',
      'Wind-Speed',
      'Wind-gust'
    ];
    List<IconData> weatherIcons = [
      WeatherIcons.thermometer,
      WeatherIcons.thermometer,
      WeatherIcons.barometer,
      WeatherIcons.humidity,
      WeatherIcons.storm_showers,
      WeatherIcons.horizon,
      WeatherIcons.wind_beaufort_0,
      WeatherIcons.day_cloudy_gusts,
    ];
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: BlocListener<GetCurrentWeatherBloc, GetCurrentWeatherState>(
        listener: (context, state) {
          if (state is GetCurrentWeatherError) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
                state.errorMessage,
                style: const TextStyle(color: Colors.white),
              ),
              backgroundColor: Theme.of(context).colorScheme.error,
            ));
          }
        },
        child: BlocBuilder<GetCurrentWeatherBloc, GetCurrentWeatherState>(
          builder: (context, state) {
            if (state is GetCurrentWeatherLoading) {
              // return const Center(child: CircularProgressIndicator());
              return const GridLoader();
            }
            if (state is GetCurrentWeatherLoaded) {
              final visibilityData = state.weatherData.visibility;
              final progData = (visibilityData! / 10000);
              final cloudsData = state.weatherData.clouds?.all;
              final progCloudsData = (cloudsData! / 100);
              final sunRiseData = state.weatherData.sysData?.sunrise;
              final sunSetData = state.weatherData.sysData?.sunset;
              final dateTime =
                  DateTime.fromMillisecondsSinceEpoch(sunRiseData! * 1000);
              final dateTime2 =
                  DateTime.fromMillisecondsSinceEpoch(sunSetData! * 1000);
              final dayFormatter = DateFormat('dd MMM');
              final dayFormattedDate = dayFormatter.format(dateTime);

              final timeFormatter = DateFormat('HH:mm');
              final formattedTime = timeFormatter.format(dateTime);

              final dayFormatter2 = DateFormat('dd MMM');
              final dayFormattedDate2 = dayFormatter2.format(dateTime2);

              final timeFormatter2 = DateFormat('HH:mm');
              final formattedTime2 = timeFormatter2.format(dateTime2);

              return ListView(
                shrinkWrap: true,
                children: [
                  GridView(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 2 / 1,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10),
                    children: List.generate(
                        weatherOptions.length,
                        (index) => Card(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 10, right: 10, top: 20, bottom: 10),
                                child: Row(
                                  children: [
                                    Column(
                                      children: [
                                        CircleAvatar(
                                            child: Icon(weatherIcons[index]))
                                      ],
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          weatherOptions[index],
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge
                                              ?.copyWith(
                                                  fontWeight: FontWeight.bold),
                                        ),
                                        Text(getValueForIndex(index, state)),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            )),
                  ),
                  SizedBox(
                    height: sizedObject.height * 0.02,
                  ),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                            'Other Metrics',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Flexible(
                                  flex: 1, child: Text('Rain in 1hr')),
                              Flexible(
                                flex: 3,
                                child: LinearProgressIndicator(
                                  value: 0.0,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    Theme.of(context).colorScheme.primary,
                                  ),
                                ),
                              ),
                              const Flexible(flex: 1, child: Text('0'))
                            ],
                          ),
                          SizedBox(
                            height: sizedObject.height * 0.009,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Flexible(
                                  flex: 1, child: Text('Visibility')),
                              Flexible(
                                flex: 3,
                                child: LinearProgressIndicator(
                                  value: progData,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    Theme.of(context).colorScheme.primary,
                                  ),
                                ),
                              ),
                              Flexible(flex: 1, child: Text('$progData'))
                            ],
                          ),
                          SizedBox(
                            height: sizedObject.height * 0.009,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Flexible(flex: 1, child: Text('Clouds')),
                              Flexible(
                                flex: 3,
                                child: LinearProgressIndicator(
                                  value: progCloudsData,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    Theme.of(context).colorScheme.primary,
                                  ),
                                ),
                              ),
                              Flexible(flex: 1, child: Text('$progCloudsData'))
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: sizedObject.height * 0.02,
                  ),
                  Row(
                    children: [
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, top: 10, bottom: 10),
                          child: Row(
                            children: [
                              const Column(
                                children: [
                                  CircleAvatar(
                                      child: Center(
                                          child: Icon(WeatherIcons.sunrise)))
                                ],
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Sunrise',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.copyWith(fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: sizedObject.height * 0.009,
                                  ),
                                  Text('$dayFormattedDate, $formattedTime'),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: sizedObject.width * 0.15,
                      ),
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, top: 10, bottom: 10),
                          child: Row(
                            children: [
                              const Column(
                                children: [
                                  CircleAvatar(
                                      child: Center(
                                          child: Icon(WeatherIcons.sunset)))
                                ],
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Sunset',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.copyWith(fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: sizedObject.height * 0.009,
                                  ),
                                  Text('$dayFormattedDate2, $formattedTime2'),
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  )
                ],
              );
            }
            return ListView(
              children: [
                GridView(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 2 / 1,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10),
                  children: List.generate(
                      weatherOptions.length,
                      (index) => Card(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 10, right: 10, top: 20, bottom: 10),
                              child: Row(
                                children: [
                                  Column(
                                    children: [
                                      CircleAvatar(
                                          child: Icon(weatherIcons[index]))
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        weatherOptions[index],
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge
                                            ?.copyWith(
                                                fontWeight: FontWeight.bold),
                                      ),
                                      const Text('12 km/h'),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          )),
                ),
                SizedBox(
                  height: sizedObject.height * 0.02,
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(
                          'Other Metrics',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Flexible(flex: 1, child: Text('Rain in 1hr')),
                            Flexible(
                              flex: 3,
                              child: LinearProgressIndicator(
                                value: 0.7,
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  Theme.of(context).colorScheme.primary,
                                ),
                              ),
                            ),
                            const Flexible(flex: 1, child: Text('70%'))
                          ],
                        ),
                        SizedBox(
                          height: sizedObject.height * 0.009,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Flexible(flex: 1, child: Text('Visibility')),
                            Flexible(
                              flex: 3,
                              child: LinearProgressIndicator(
                                value: 0.5,
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  Theme.of(context).colorScheme.primary,
                                ),
                              ),
                            ),
                            const Flexible(flex: 1, child: Text('50%'))
                          ],
                        ),
                        SizedBox(
                          height: sizedObject.height * 0.009,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Flexible(flex: 1, child: Text('Clouds')),
                            Flexible(
                              flex: 3,
                              child: LinearProgressIndicator(
                                value: (50 / 1000),
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  Theme.of(context).colorScheme.primary,
                                ),
                              ),
                            ),
                            const Flexible(flex: 1, child: Text('20%'))
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: sizedObject.height * 0.02,
                ),
                Row(
                  children: [
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 10, right: 10, top: 10, bottom: 10),
                        child: Row(
                          children: [
                            const Column(
                              children: [
                                CircleAvatar(
                                    child: Center(
                                        child: Icon(WeatherIcons.sunrise)))
                              ],
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Sunrise',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: sizedObject.height * 0.009,
                                ),
                                const Text('Time: 4:50AM'),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 50,
                    ),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 10, right: 10, top: 10, bottom: 10),
                        child: Row(
                          children: [
                            const Column(
                              children: [
                                CircleAvatar(
                                    child: Center(
                                        child: Icon(WeatherIcons.sunset)))
                              ],
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Sunset',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: sizedObject.height * 0.009,
                                ),
                                const Text('Time: 4:50PM'),
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
