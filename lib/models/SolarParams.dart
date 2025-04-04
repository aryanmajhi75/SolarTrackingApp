import 'dart:convert';

import 'package:flutter/foundation.dart';

class SolarParams {
  double temperature;
  String time;
  double humidity;
  double voltage;

  SolarParams({
    required this.temperature,
    required this.time,
    required this.humidity,
    required this.voltage,
  });

  // Factory method to create a SolarParams object from a JSON map
  factory SolarParams.fromJson(Map<String, dynamic> json) {
    return SolarParams(
      temperature: json['temperature'].toDouble(),
      time: json['time'],
      humidity: json['humidity'].toDouble(),
      voltage: json['voltage'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'temperature': temperature,
      'time': time,
      'humidity': humidity,
      'voltage': voltage,
    };
  }

  static SolarParams fromJsonString(String jsonString) {
    final Map<String, dynamic> jsonData = json.decode(jsonString);

    if(kDebugMode) {
      print('JSON Data: $jsonData');
    }

    return SolarParams.fromJson(jsonData);
  }

  String toJsonString() {
    final Map<String, dynamic> jsonData = toJson();

    if(kDebugMode) {
      print('JSON Data: $jsonData');
    }

    return json.encode(jsonData);
  }
}