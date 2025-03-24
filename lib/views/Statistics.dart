import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:solar/components/paramLineChart.dart';
import 'package:solar/components/parameterBox.dart';
import 'package:solar/models/SolarParams.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:solar/firebase/getSolarParams.dart';
import 'package:solar/models/DateWiseParams.dart';

class Statistics extends StatefulWidget {
  const Statistics({super.key});

  @override
  State<Statistics> createState() => _StatisticsState();
}

class _StatisticsState extends State<Statistics> {
  List<DateWiseParams> _allParams = [];
  String? _selectedDate;

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    List<DateWiseParams> data = await getSolarParams();
    setState(() {
      _allParams = data;
      if (_allParams.isNotEmpty) {
        _selectedDate = _allParams.first.date;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    List<SolarParams> selectedParams = [];
    if (_selectedDate != null) {
      selectedParams = _allParams
          .firstWhere((element) => element.date == _selectedDate)
          .params;
      // Sort the params by time in descending order
      selectedParams.sort((a, b) => b.time.compareTo(a.time));
    }

    // Calculate the average IV value
    double avgIV = 0.0;
    if (selectedParams.isNotEmpty) {
      avgIV = selectedParams
          .map((e) => 10 / e.voltage)
          .reduce((a, b) => a + b) / selectedParams.length;
    }

    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: height,
          width: width,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Daily Averages",
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                ),
                if (_allParams.isNotEmpty)
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20, right: 10),
                      child: Container(
                        width: width * 0.95,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.green[900],
                        ),
                        child: DropdownButton<String>(
                          value: _selectedDate,
                          isExpanded: true,
                          hint: Text('Select Date'),
                          style: TextStyle(color: Colors.white),
                          dropdownColor: Colors.green[900],
                          items: _allParams.map((DateWiseParams dateWiseParam) {
                            return DropdownMenuItem<String>(
                              value: dateWiseParam.date,
                              child: Text(
                                DateFormat('dd-MM-yyyy').format(
                                  DateTime.parse(dateWiseParam.date),
                                ),
                              ),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedDate = newValue;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                Gap(20),
                if (_allParams.isNotEmpty)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ParameterBox(
                        height: height * 0.15,
                        width: width * 0.28,
                        icon: Icon(Icons.electric_bolt, color: Colors.amber),
                        parameterValue: '${avgIV.toStringAsFixed(2)} A',
                      ),
                      ParameterBox(
                        height: height * 0.15,
                        width: width * 0.28,
                        icon: Icon(Icons.thermostat, color: Colors.red),
                        parameterValue:
                            '${(selectedParams.map((e) => e.temperature).reduce((a, b) => a + b) / selectedParams.length).toStringAsFixed(2)} °C',
                      ),
                      ParameterBox(
                        height: height * 0.15,
                        width: width * 0.28,
                        icon: Icon(
                          Icons.electric_meter_rounded,
                          color: Colors.blue,
                        ),
                        parameterValue:
                            '${(selectedParams.map((e) => e.voltage).reduce((a, b) => a + b) / selectedParams.length).toStringAsFixed(2)} V',
                      ),
                    ],
                  ),
                Divider(
                  color: Colors.green[900],
                  endIndent: 20,
                  indent: 20,
                  thickness: 2,
                ),
                if (selectedParams.isNotEmpty)
                  SizedBox(
                    height: height * 0.5,
                    width: width,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ParamLineChart(
                        selectedParams: selectedParams,
                        title: "Voltage vs Time",
                        xTitle: "Time",
                        yTitle: "Voltage",
                        yDataType: 'voltage',
                      ),
                    ),
                  ),
                if (selectedParams.isNotEmpty)
                  SizedBox(
                    height: height * 0.5,
                    width: width,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ParamLineChart(
                        selectedParams: selectedParams,
                        title: "Temperature vs Time",
                        xTitle: "Time",
                        yTitle: "Temperature",
                        yDataType: 'temperature',
                      ),
                    ),
                  ),
                if (selectedParams.isNotEmpty)
                  SizedBox(
                    height: height * 0.5,
                    width: width,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ParamLineChart(
                        selectedParams: selectedParams,
                        title: "Humidity vs Time",
                        xTitle: "Time",
                        yTitle: "Humidity",
                        yDataType: 'humidity',
                      ),
                    ),
                  ),
                if (selectedParams.isNotEmpty)
                  SizedBox(
                    height: height * 0.5,
                    width: width,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ParamLineChart(
                        selectedParams: selectedParams,
                        title: "IV vs Time",
                        xTitle: "Time",
                        yTitle: "IV",
                        yDataType: 'iv',
                      ),
                    ),
                  ),
                Gap(20), // Add a gap to avoid blocking the bottom part of the graph
              ],
            ),
          ),
        ),
      ),
    );
  }
}
