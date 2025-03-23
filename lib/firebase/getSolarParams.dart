import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'dart:convert'; // Import JSON encoding
import '../models/DateWiseParams.dart';
import '../models/SolarParams.dart';

Future<List<DateWiseParams>> getSolarParams() async {
  final DatabaseReference database = FirebaseDatabase.instance.ref();
  List<DateWiseParams> allParams = [];

  try {
    // Get reference to SolarData
    Query solarDataRef = database.child('SolarData');

    // Fetch data
    DataSnapshot dateSnapshot = await solarDataRef.get();

    if (dateSnapshot.value != null && dateSnapshot.value is Map<dynamic, dynamic>) {
      Map<dynamic, dynamic> dates = dateSnapshot.value as Map<dynamic, dynamic>;

      dates.forEach((dateKey, dateData) {
        if (dateData is Map<dynamic, dynamic>) {
          List<SolarParams> paramsForDate = [];

          dateData.forEach((docId, content) {
            if (content is Map) {
              try {
                SolarParams param = SolarParams(
                  temperature: (content['temperature'] ?? 0.0).toDouble(),
                  time: content['time']?.toString() ?? '',
                  humidity: (content['humidity'] ?? 0.0).toDouble(),
                  voltage: (content['voltage'] ?? 0.0).toDouble(),
                );
                paramsForDate.add(param);
              } catch (e) {
                if (kDebugMode) {
                  print("Error parsing SolarParams for $docId: $e");
                }
              }
            }
          });

          if (paramsForDate.isNotEmpty) {
            try {
              DateTime date = DateFormat('dd-MM-yyyy').parse(dateKey);
              DateWiseParams dateWiseParam = DateWiseParams(
                date: date.toIso8601String(), // Use ISO format for consistency
                params: paramsForDate,
              );
              allParams.add(dateWiseParam);
            } catch (e) {
              if (kDebugMode) {
                print("Error parsing date for $dateKey: $e");
              }
            }
          }
        }
      });
    }

    // Sort allParams by date and time in descending order
    allParams.sort((a, b) {
      DateTime dateA = DateTime.parse(a.date);
      DateTime dateB = DateTime.parse(b.date);
      if (dateA != dateB) {
        return dateB.compareTo(dateA);
      } else {
        return b.params.first.time.compareTo(a.params.first.time);
      }
    });

    if (kDebugMode) {
      // Use JSON encoding for better readability
      print("AllParams JSON:\n${JsonEncoder.withIndent('  ').convert(allParams.map((param) => param.toJson()).toList())}");
    }

    return allParams;
  } catch (e) {
    if (kDebugMode) {
      print('Error fetching solar parameters: $e');
    }
    return [];
  }
}
