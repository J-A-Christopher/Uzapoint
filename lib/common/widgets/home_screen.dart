import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:uza_point/common/widgets/delegate.dart';
import 'package:uza_point/features/getCurrentWeather/Presentation/bloc/get_current_weather_bloc.dart';
import 'package:uza_point/features/getForcast/presentation/bloc/weather_focast_data_bloc.dart';
import 'package:uza_point/features/getForcast/presentation/screens/forecast.dart';
import 'package:uza_point/features/getCurrentWeather/Presentation/screens/today.dart';
import 'package:uza_point/features/getForcast/presentation/screens/tomorrow_weather.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<GetCurrentWeatherBloc>().add(const GetWeatherDataEvent());
  }

  final cityController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final sizedObject = MediaQuery.of(context).size;
    return Scaffold(
      body: DefaultTabController(
        length: 3,
        child: NestedScrollView(
          headerSliverBuilder: (context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                expandedHeight: sizedObject.height * 0.40,
                floating: false,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  background: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(45),
                          bottomLeft: Radius.circular(45),
                        ),
                        child: Image.asset(
                          'assets/image.png',
                          width: sizedObject.width,
                          fit: BoxFit.fill,
                        ),
                      ),
                      BlocBuilder<GetCurrentWeatherBloc,
                          GetCurrentWeatherState>(
                        builder: (context, state) {
                          if (state is GetCurrentWeatherLoaded) {
                            final country = state.weatherData.sysData?.country;
                            final city = state.weatherData.cityName;
                            return Positioned(
                              top: 30,
                              left: 30,
                              child: Text(
                                '$city, $country',
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            );
                          }
                          if (state is GetCurrentWeatherLoading) {
                            return const Positioned(
                                top: 30,
                                left: 30,
                                child: Text(
                                  'Loading Data...',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ));
                          }
                          return const Positioned(
                              top: 30,
                              left: 30,
                              child: Text(
                                'Search For A Place..',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ));
                        },
                      ),
                      Positioned(
                          right: 45,
                          top: 25,
                          child: IconButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: const Text('Search a city'),
                                        content: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            TextFormField(
                                                controller: cityController,
                                                decoration: InputDecoration(
                                                  contentPadding:
                                                      const EdgeInsets.all(5),
                                                  filled: true,
                                                  enabledBorder:
                                                      UnderlineInputBorder(
                                                          borderSide:
                                                              BorderSide.none,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10)),
                                                  hintText: 'City name',
                                                  hintStyle: Theme.of(context)
                                                      .textTheme
                                                      .bodySmall
                                                      ?.copyWith(fontSize: 15),
                                                ))
                                          ],
                                        ),
                                        actions: [
                                          TextButton(
                                              onPressed: () {
                                                context
                                                    .read<
                                                        GetCurrentWeatherBloc>()
                                                    .add(GetWeatherDataEvent(
                                                        cityName: cityController
                                                            .text));

                                                context.pop();
                                                return;
                                              },
                                              child: const Text('Search')),
                                          TextButton(
                                              onPressed: () {
                                                context.pop();
                                              },
                                              child: const Text('Cancel'))
                                        ],
                                      );
                                    });
                              },
                              icon: const Icon(
                                Icons.search,
                                color: Colors.white,
                                size: 30,
                              ))),
                      Positioned(
                        top: 110,
                        left: 30,
                        child: Row(
                          children: [
                            BlocBuilder<GetCurrentWeatherBloc,
                                GetCurrentWeatherState>(
                              builder: (context, state) {
                                if (state is GetCurrentWeatherLoaded) {
                                  final temp =
                                      state.weatherData.mainWeatherData?.temp;
                                  return RichText(
                                    text: TextSpan(
                                        text: '$temp',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge
                                            ?.copyWith(color: Colors.white),
                                        children: const [
                                          TextSpan(text: '\u00B0')
                                        ]),
                                  );
                                }
                                return RichText(
                                  text: TextSpan(
                                      text: '3',
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayLarge
                                          ?.copyWith(color: Colors.white),
                                      children: const [
                                        TextSpan(text: '\u00B0')
                                      ]),
                                );
                              },
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            BlocBuilder<GetCurrentWeatherBloc,
                                GetCurrentWeatherState>(
                              builder: (context, state) {
                                if (state is GetCurrentWeatherLoaded) {
                                  final feelsLike = state
                                      .weatherData.mainWeatherData?.feelsLike;

                                  return RichText(
                                    text: TextSpan(
                                        text: 'Feels Like: $feelsLike',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.copyWith(color: Colors.white),
                                        children: const [
                                          TextSpan(text: '\u00B0')
                                        ]),
                                  );
                                }
                                if (state is GetCurrentWeatherLoading) {
                                  return RichText(
                                    text: TextSpan(
                                        text: 'Loading...',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.copyWith(color: Colors.white),
                                        children: const [
                                          TextSpan(text: '\u00B0')
                                        ]),
                                  );
                                }
                                return RichText(
                                  text: TextSpan(
                                      text: 'Feels Like: ? ',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(color: Colors.white),
                                      children: const [
                                        TextSpan(text: '\u00B0')
                                      ]),
                                );
                              },
                            ),
                            const SizedBox(
                              width: 95,
                            ),
                            BlocBuilder<GetCurrentWeatherBloc,
                                GetCurrentWeatherState>(
                              builder: (context, state) {
                                if (state is GetCurrentWeatherLoaded) {
                                  final weatherDesc = state
                                      .weatherData
                                      .weatherData!
                                      .weatherData
                                      .first
                                      .description;
                                  final iconData = state.weatherData
                                      .weatherData!.weatherData.first.icon;
                                  return Column(
                                    children: [
                                      CachedNetworkImage(
                                        imageUrl:
                                            'https://openweathermap.org/img/wn/$iconData@2x.png',
                                        placeholder: (context, url) =>
                                            const CircularProgressIndicator(),
                                      ),
                                      //Image.asset('assets/cloud&sun.png'),
                                      Text(
                                        '$weatherDesc',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.copyWith(color: Colors.white),
                                      )
                                    ],
                                  );
                                }
                                return Column(
                                  children: [
                                    Image.asset('assets/cloud&sun.png'),
                                    Text(
                                      'Cloudy',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(color: Colors.white),
                                    )
                                  ],
                                );
                              },
                            )
                          ],
                        ),
                      ),
                      Positioned(
                        top: 320,
                        left: 50,
                        child: BlocBuilder<GetCurrentWeatherBloc,
                            GetCurrentWeatherState>(
                          builder: (context, state) {
                            if (state is GetCurrentWeatherLoading) {
                              return Row(
                                children: [
                                  Text('Loading data..',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(color: Colors.white)),
                                  const SizedBox(
                                    width: 150,
                                  ),
                                  Column(
                                    children: [
                                      Text('Day:3\u00B0',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium
                                              ?.copyWith(color: Colors.white)),
                                      Text('Night: -1\u00B0',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium
                                              ?.copyWith(color: Colors.white))
                                    ],
                                  )
                                ],
                              );
                            }

                            if (state is GetCurrentWeatherLoading) {
                              return Row(
                                children: [
                                  Text('Loading..',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(color: Colors.white)),
                                  const SizedBox(
                                    width: 150,
                                  ),
                                  Column(
                                    children: [
                                      Text('Day:Loading..\u00B0',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium
                                              ?.copyWith(color: Colors.white)),
                                      Text('Night: Loading..\u00B0',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium
                                              ?.copyWith(color: Colors.white))
                                    ],
                                  )
                                ],
                              );
                            }
                            if (state is GetCurrentWeatherLoaded) {
                              final dt = state.weatherData.dt;
                              final dateTime =
                                  DateTime.fromMillisecondsSinceEpoch(
                                      dt! * 1000);
                              final dayFormatter = DateFormat('dd MMM');
                              final dayFormattedDate =
                                  dayFormatter.format(dateTime);
                              final timeFormatter = DateFormat('HH:mm');
                              final formattedTime =
                                  timeFormatter.format(dateTime);
                              final maxTemp =
                                  state.weatherData.mainWeatherData?.temp;
                              final minTemp =
                                  state.weatherData.mainWeatherData?.tempMin;
                              return Row(
                                children: [
                                  Text('$dayFormattedDate, $formattedTime',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(color: Colors.white)),
                                  const SizedBox(
                                    width: 150,
                                  ),
                                  Column(
                                    children: [
                                      Text('Day: $maxTemp \u00B0',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium
                                              ?.copyWith(color: Colors.white)),
                                      Text('Night: $minTemp \u00B0',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium
                                              ?.copyWith(color: Colors.white))
                                    ],
                                  )
                                ],
                              );
                            }
                            return Row(
                              children: [
                                Text('January 18, 16:14',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(color: Colors.white)),
                                const SizedBox(
                                  width: 150,
                                ),
                                Column(
                                  children: [
                                    Text('Day:3\u00B0',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.copyWith(color: Colors.white)),
                                    Text('Night: -1\u00B0',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.copyWith(color: Colors.white))
                                  ],
                                )
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BlocBuilder<GetCurrentWeatherBloc,
                          GetCurrentWeatherState>(
                        builder: (context, state) {
                          if (state is GetCurrentWeatherLoaded) {
                            final country = state.weatherData.sysData?.country;
                            final city = state.weatherData.cityName;
                            return Padding(
                              padding: const EdgeInsets.only(top: 30.0),
                              child: Text(
                                '$city, $country',
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            );
                          }
                          return const Padding(
                            padding: EdgeInsets.only(top: 30.0),
                            child: Text(
                              'Nairobi, Kenya',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              SliverPersistentHeader(
                delegate: SliverAppBarDelegate(
                  tabBar: const TabBar(
                    tabs: [
                      Tab(text: 'Today'),
                      Tab(text: 'Temp. Trends'),
                      Tab(text: 'Forecast'),
                    ],
                  ),
                ),
                pinned: true,
              ),
            ];
          },
          body: TabBarView(
            children: [
              const TodayWeather(),
              TemperatureTrends(
                cityName: cityController.text,
              ),
              Next7DaysWeather(
                cityName: cityController.text,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
