import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:uza_point/delegate.dart';
import 'package:uza_point/next.dart';
import 'package:uza_point/today.dart';
import 'package:uza_point/tomorrow_weather.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
                      const Positioned(
                        top: 30,
                        left: 30,
                        child: Text(
                          'Nairobi, Kenya',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                      Positioned(
                        top: 110,
                        left: 30,
                        child: Row(
                          children: [
                            RichText(
                              text: TextSpan(
                                  text: '3',
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayLarge
                                      ?.copyWith(color: Colors.white),
                                  children: const [TextSpan(text: '\u00B0')]),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            RichText(
                              text: TextSpan(
                                  text: 'Feels Like: -2',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(color: Colors.white),
                                  children: const [TextSpan(text: '\u00B0')]),
                            ),
                            const SizedBox(
                              width: 95,
                            ),
                            Column(
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
                            )
                          ],
                        ),
                      ),
                      Positioned(
                        top: 320,
                        left: 50,
                        child: Row(
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
                        ),
                      ),
                    ],
                  ),
                  title: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 30.0),
                        child: Text(
                          'Nairobi, Kenya',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
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
          body: const TabBarView(
            children: [
              TodayWeather(),
              TemperatureTrends(),
              Next7DaysWeather(),
            ],
          ),
        ),
      ),
    );
  }
}
