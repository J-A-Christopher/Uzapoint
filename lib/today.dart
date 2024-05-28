import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

class TodayWeather extends StatelessWidget {
  const TodayWeather({super.key});

  @override
  Widget build(BuildContext context) {
    final sizedObject = MediaQuery.of(context).size;
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
      child: ListView(
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
                                CircleAvatar(child: Icon(weatherIcons[index]))
                              ],
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  weatherOptions[index],
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(fontWeight: FontWeight.bold),
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
                          value:
                              0.7, // Represents the progress value from 0 to 1

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
                          value:
                              0.5, // Represents the progress value from 0 to 1

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
                          value: (50 /
                              1000), // Represents the progress value from 0 to 1

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
                              child: Center(child: Icon(WeatherIcons.sunrise)))
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
                              child: Center(child: Icon(WeatherIcons.sunset)))
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
      ),
    );
  }
}
