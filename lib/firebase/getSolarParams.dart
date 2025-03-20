import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import '../models/DateWiseParams.dart';
import '../models/SolarParams.dart';

Future<List<DateWiseParams>> getSolarParams() async {
  final DatabaseReference database = FirebaseDatabase.instance.ref();
  List<DateWiseParams> allParams = [];

  try {
    // Get the reference to SolarData
    DatabaseReference solarDataRef = database.child('SolarData');

    // Get all dates
    DataSnapshot dateSnapshot = await solarDataRef.get();

    if (dateSnapshot.value != null) {
      Map<dynamic, dynamic> dates = dateSnapshot.value as Map<dynamic, dynamic>;

      // Iterate through each date
      dates.forEach((dateKey, dateData) {
        List<SolarParams> paramsForDate = [];

        // Convert the date data to Map
        Map<dynamic, dynamic> docData = dateData as Map<dynamic, dynamic>;

        // Iterate through each document in the date
        docData.forEach((docId, content) {
          // Convert the content to SolarParams
          if (content is Map) {
            SolarParams param = SolarParams(
              temperature: (content['temperature'] ?? 0.0).toDouble(),
              time: content['time']?.toString() ?? '',
              humidity: (content['humidity'] ?? 0.0).toDouble(),
              voltage: (content['voltage'] ?? 0.0).toDouble(),
            );
            paramsForDate.add(param);
          }
        });

        // Create DateWiseParams for this date
        if (paramsForDate.isNotEmpty) {
          DateTime date = DateTime.parse(dateKey);
          DateWiseParams dateWiseParam = DateWiseParams(
            date: date,
            params: paramsForDate,
          );
          allParams.add(dateWiseParam);
        }
      });
    }

    return allParams;
  } catch (e) {
    if (kDebugMode) {
      print('Error fetching solar parameters: $e');
    }
    return [];
  }
}