import 'package:flutter/material.dart';
import 'package:solar/models/SolarParams.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ParamLineChart extends StatelessWidget {
  final String title;
  final String xTitle;
  final String yTitle;
  final List<SolarParams> selectedParams;
  final String yDataType;

  ParamLineChart({
    super.key,
    required this.title,
    required this.xTitle,
    required this.yTitle,
    required this.selectedParams,
    required this.yDataType,
  });

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      primaryXAxis: CategoryAxis(
        title: AxisTitle(text: xTitle),
      ),
      primaryYAxis: NumericAxis(
        title: AxisTitle(text: yTitle),
        // Make the y-axis scrollable
        enableAutoIntervalOnZooming: true,
      ),
      title: ChartTitle(text: title),
      legend: Legend(isVisible: true),
      tooltipBehavior: TooltipBehavior(enable: true),
      zoomPanBehavior: ZoomPanBehavior(
        enablePanning: true,
        enablePinching: true,
        zoomMode: ZoomMode.y,
      ),
      series: <CartesianSeries>[
        LineSeries<SolarParams, String>(
          dataSource: selectedParams,
          xValueMapper: (SolarParams params, _) => params.time,
          yValueMapper: (SolarParams params, _) {
            switch (yDataType) {
              case 'voltage':
                return params.voltage;
              case 'temperature':
                return params.temperature;
              case 'humidity':
                return params.humidity;
              case 'iv':
                return 10 / params.voltage;
              default:
                return 0.0;
            }
          },
          name: yTitle,
          dataLabelSettings: DataLabelSettings(isVisible: true),
        ),
      ],
    );
  }
}
