import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:solar/components/parameterBox.dart';
import 'package:solar/firebase/getSolarParams.dart';
import 'package:solar/models/DateWiseParams.dart';

class LiveData extends StatefulWidget {
  const LiveData({super.key});

  @override
  State<LiveData> createState() => _LiveDataState();
}

class _LiveDataState extends State<LiveData> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(
            top: 20,
            bottom: 10,
            left: 10,
            right: 10,
          ),
          child: StreamBuilder<List<DateWiseParams>>(
            stream: Stream.fromFuture(getSolarParams()),
            builder: (context, snapshot) {
              if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                final firstData = snapshot.data!.first;
                final allData = snapshot.data!;

                // Sort the params of firstData by time in descending order
                firstData.params.sort((a, b) => b.time.compareTo(a.time));

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Gap(20),
                    Center(
                      child: Container(
                        height: height * 0.25,
                        width: width * 0.8,
                        decoration: BoxDecoration(
                          color: Colors.green[900],
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Gap(20),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 20),
                                      child: Text(
                                        DateFormat('dd-MM-yyyy').format(DateTime.parse(firstData.date)),
                                        style: Theme.of(context).textTheme.displaySmall,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 20),
                                      child: Text(
                                        firstData.params.first.time,
                                        style: Theme.of(context).textTheme.displaySmall,
                                      ),
                                    ),
                                  ],
                                ),
                                Gap(10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    ParameterBox(
                                      height: height * 0.1,
                                      width: width * 0.2,
                                      icon: Icon(Icons.water_drop_rounded),
                                      parameterValue: firstData.params.first.humidity.toString(),
                                    ),
                                    ParameterBox(
                                      height: height * 0.1,
                                      width: width * 0.2,
                                      icon: Icon(Icons.thermostat_rounded),
                                      parameterValue: firstData.params.first.temperature.toString(),
                                    ),
                                    ParameterBox(
                                      height: height * 0.1,
                                      width: width * 0.2,
                                      icon: Icon(Icons.electric_bolt_rounded),
                                      parameterValue: firstData.params.first.voltage.toString(),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Gap(10),
                    Expanded(
                      child: SizedBox(
                        height: height * 0.5,
                        child: ListView.builder(
                          itemCount: allData.length,
                          itemBuilder: (context, index) {
                            final data = allData[index];
                            // Sort the params by time in descending order
                            data.params.sort((a, b) => b.time.compareTo(a.time));
                            return ListTile(
                              title: Text(
                                "Date: ${DateFormat('dd-MM-yyyy').format(DateTime.parse(data.date))}",
                                style: Theme.of(context).textTheme.displaySmall,
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: data.params.map((param) {
                                  return Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Time: ${param.time}",
                                        style: Theme.of(context).textTheme.labelMedium,
                                      ),
                                      Text(
                                        "Temperature: ${param.temperature}",
                                        style: Theme.of(context).textTheme.labelMedium,
                                      ),
                                      Text(
                                        "Humidity: ${param.humidity}",
                                        style: Theme.of(context).textTheme.labelMedium,
                                      ),
                                      Text(
                                        "Voltage: ${param.voltage}",
                                        style: Theme.of(context).textTheme.labelMedium,
                                      ),
                                      Divider(),
                                    ],
                                  );
                                }).toList(),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                );
              }
              return Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ),
    );
  }
}
