import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:weather_icons/weather_icons.dart';

class GridLoader extends StatelessWidget {
  const GridLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      child: GridView(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2 / 1,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
        children: List.generate(
            10,
            (index) => Card(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 10, right: 10, top: 20, bottom: 10),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              BoneMock.title,
                            ),
                            Text(BoneMock.subtitle),
                          ],
                        )
                      ],
                    ),
                  ),
                )),
      ),
    );
  }
}
