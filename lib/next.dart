import 'package:flutter/material.dart';

class Next7DaysWeather extends StatefulWidget {
  const Next7DaysWeather({super.key});

  @override
  State<Next7DaysWeather> createState() => _Next7DayWeatherState();
}

class _Next7DayWeatherState extends State<Next7DaysWeather> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: List.generate(
            20,
            (index) => Card(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 15.0, left: 8, right: 8, bottom: 15),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Thursday, Jun, 19',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(fontWeight: FontWeight.bold)),
                            const Text('Cloudy')
                          ],
                        ),
                        const Spacer(),
                        const Column(
                          children: [Text('3\u00B0'), Text('-2\u00B0')],
                        ),
                        const Text('|'),
                        Image.asset(
                          'assets/cloud&sun.png',
                          height: 35,
                        ),
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              'See more',
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color:
                                      Theme.of(context).colorScheme.secondary),
                            ))
                      ],
                    ),
                  ),
                )),
      ),
    );
  }
}
