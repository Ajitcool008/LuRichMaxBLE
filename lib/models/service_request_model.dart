import 'package:cloud_firestore/cloud_firestore.dart';

class ServiceRequestModel {
  final String id;
  final String userId;
  final String title;
  final String description;
  final String location;
  final DateTime dateTime;
  final Map<String, dynamic> additionalDetails;
  final String status; // 'open', 'assigned', 'completed'

  ServiceRequestModel({
    required this.id,
    required this.userId,
    required this.title,
    required this.description,
    required this.location,
    required this.dateTime,
    required this.additionalDetails,
    required this.status,
  });

  factory ServiceRequestModel.fromMap(Map<String, dynamic> map) {
    return ServiceRequestModel(
      id: map['id'] ?? '',
      userId: map['userId'] ?? '',
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      location: map['location'] ?? '',
      dateTime:
          (map['dateTime'] as Timestamp)
              .toDate(), // Convert Timestamp to DateTime
      additionalDetails: map['additionalDetails'] ?? {},
      status: map['status'] ?? 'open',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'title': title,
      'description': description,
      'location': location,
      'dateTime': Timestamp.fromDate(dateTime), // Convert DateTime to Timestamp
      'additionalDetails': additionalDetails,
      'status': status,
    };
  }
}
