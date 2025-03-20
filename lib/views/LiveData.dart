import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:solar/components/parameterBox.dart';

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
            //   Text(
            //     "19-03-2025",
            //     style: Theme.of(context).textTheme.displayLarge,
            //   ),
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
                        spacing: 10,
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Text(
                                  "19-03-2025",
                                  style: Theme.of(context).textTheme.displaySmall,
                                ),
                              ),
                              Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Text(
                              "09:44",
                              style: Theme.of(context).textTheme.displaySmall,
                            ),
                          ),
                            ],
                          ),
                          Gap(10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            spacing: 10,
                            children: [
                              ParameterBox(
                                height: height * 0.1,
                                width: width * 0.2,
                                icon: Icon(Icons.water_drop_rounded),
                                parameterValue: "20",
                              ),
                              ParameterBox(
                                height: height * 0.1,
                                width: width * 0.2,
                                icon: Icon(Icons.thermostat_rounded),
                                parameterValue: "31.7",
                              ),
                              ParameterBox(
                                height: height * 0.1,
                                width: width * 0.2,
                                icon: Icon(Icons.electric_bolt_rounded),
                                parameterValue: "30",
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
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          "Voltage: 30",
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                        subtitle: Text(
                          "Temperature: 31.7",
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                        trailing: Text(
                          "Humidity: 20",
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
