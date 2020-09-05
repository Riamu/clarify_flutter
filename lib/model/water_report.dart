import 'package:clarify_flutter/model/contaminant_report.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class WaterReport {
  final String id;
  final Timestamp timestamp;
  final double arsenic;
  final double lead;
  final double bacteria;
  final int overallStatus;
  static List<String> months = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December",
  ];

  const WaterReport(
      {this.id,
      this.timestamp,
      this.arsenic,
      this.lead,
      this.bacteria,
      this.overallStatus});

  WaterReport.fromMap(Map<String, dynamic> data, String id)
      : this(
            id: id,
            timestamp: data['date'],
            arsenic: data['arsenic_content'],
            lead: data['lead_content'],
            bacteria: data['bacterial_content'],
            overallStatus: data['overall_status']);

  @override
  String toString() {
    return "WaterReport(id:$id)\n"
        "Overall Quality: $overallStatus\n"
        "Date: $timestamp\n"
        "\ttime: $timestamp\n"
        "\tarsenic: $arsenic\n"
        "\tlead: $lead\n"
        "\tbacteria: $bacteria\n";
  }

  String getFormattedDate() {
    String month = months[timestamp.toDate().month - 1];
    String day = timestamp.toDate().day.toString();
    return month + " " + day + ", " + timestamp.toDate().year.toString();
  }

  String getOverallStatusString() {
    switch (overallStatus) {
      case 0:
        return "Water quality is great!";
        break;
      case 1:
        return "Water quality could be better.";
      case 2:
        return "Your water requires immediate attention!";
      default:
        return "Unknown water quality.";
    }
  }

  Color getStatusColor() {
    switch (overallStatus) {
      case 0:
        return Colors.green;
        break;
      case 1:
        return Colors.yellow;
        break;
      case 2:
        return Colors.red;
        break;
    }
  }

  Map<String, dynamic> toMap() {
    return {
      "date": timestamp,
      "arsenic_content": arsenic,
      "bacterial_content": bacteria,
      "lead_content": lead,
      "overall_status": overallStatus,
    };
  }

  ContaminantReport getArsenicReport() {
    return ContaminantReport(
        name: "Arsenic",
        unitAbbreviation: "mg/L",
        concentration: arsenic,
        // 0.01 mg/L
        upperBound: 0.01,
        lowerBound: 0.0);
  }

  ContaminantReport getLeadReport() {
    return ContaminantReport(
        name: "Lead",
        unitAbbreviation: "mg/L",
        concentration: lead,
        // 0.005 mg/L
        upperBound: 0.005,
        lowerBound: 0.0);
  }

  ContaminantReport getBacteriaReport() {
    return ContaminantReport(
        name: "Bacteria",
        unitAbbreviation: "CFU/100mL",
        concentration: bacteria,
        // 1 CFU / 100 mL
        upperBound: 1.0,
        lowerBound: 0.0);
  }
}
