import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:uza_point/common/widgets/line_chart.dart';
import 'package:uza_point/common/widgets/price_point.dart';
import 'package:uza_point/features/getForcast/presentation/bloc/weather_focast_data_bloc.dart';

class TemperatureTrends extends StatefulWidget {
  final String? cityName;
  const TemperatureTrends({super.key, this.cityName});

  @override
  State<TemperatureTrends> createState() => _TemperatureTrendsState();
}

class _TemperatureTrendsState extends State<TemperatureTrends> {
  @override
  void initState() {
    super.initState();
    print('City${widget.cityName}');
    context
        .read<WeatherFocastDataBloc>()
        .add(GetForecastData(cityName: widget.cityName));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30.0, bottom: 30),
            child: Text(
              'Maximum Temperature Trends Within 3 Hours.',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          BlocListener<WeatherFocastDataBloc, WeatherFocastDataState>(
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
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is WeatherFocastDataLoaded) {
                  final maxTempValues = state.foreCastData
                      .map((focastDataElement) =>
                          focastDataElement.mainWeather?.tempMax)
                      .take(10)
                      .whereType<double>()
                      .toList();
                
                  final convertedValues =
                      maxTempValues.asMap().entries.map((entry) {
                    final index =
                        entry.key.toDouble();
                    final value = entry.value;
                    return PricePoint(x: index, y: value);
                  }).toList();
                  return LineChartWidget(
                    points: convertedValues,
                  );
                }
                return const SizedBox();
              },
            ),
          ),
        ],
      ),
    );
  }
}
