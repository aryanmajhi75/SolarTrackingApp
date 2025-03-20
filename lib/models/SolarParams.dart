import 'dart:convert';

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

  // Method to convert a SolarParams object to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'temperature': temperature,
      'time': time,
      'humidity': humidity,
      'voltage': voltage,
    };
  }

  // Method to convert a JSON string to a SolarParams object
  static SolarParams fromJsonString(String jsonString) {
    final Map<String, dynamic> jsonData = json.decode(jsonString);
    return SolarParams.fromJson(jsonData);
  }

  // Method to convert a SolarParams object to a JSON string
  String toJsonString() {
    final Map<String, dynamic> jsonData = toJson();
    return json.encode(jsonData);
  }
}