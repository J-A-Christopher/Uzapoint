import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:weather_icons/weather_icons.dart';

class DefaultSkeleton extends StatelessWidget {
  const DefaultSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
        child: ListView.builder(
            itemCount: 20,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  leading: const CircleAvatar(
                    child: Icon(WeatherIcons.alien),
                  ),
                  title: Text(BoneMock.name),
                  subtitle: Text(BoneMock.subtitle),
                ),
              );
            }));
  }
}
