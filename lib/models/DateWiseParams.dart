import 'package:solar/models/SolarParams.dart';

class DateWiseParams {
  final String date;
  final List<SolarParams> params;

  DateWiseParams({
    required this.date,
    required this.params,
  });

  // Convert from JSON
  factory DateWiseParams.fromJson(Map<String, dynamic> json) {
    return DateWiseParams(
      date: json['date'],
      params: (json['params'] as List)
          .map((param) => SolarParams.fromJson(param))
          .toList(),
    );
  }

  // Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'date': date,
      'params': params.map((param) => param.toJson()).toList(),
    };
  }
}