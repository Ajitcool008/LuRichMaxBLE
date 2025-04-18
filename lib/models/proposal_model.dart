import 'package:cloud_firestore/cloud_firestore.dart';

class ProposalModel {
  final String id;
  final String serviceRequestId;
  final String providerId;
  final String userId;
  final String description;
  final double price;
  final String status; // 'pending', 'accepted', 'rejected'
  final DateTime createdAt;

  ProposalModel({
    required this.id,
    required this.serviceRequestId,
    required this.providerId,
    required this.userId,
    required this.description,
    required this.price,
    required this.status,
    required this.createdAt,
  });

  factory ProposalModel.fromMap(Map<String, dynamic> map) {
    return ProposalModel(
      id: map['id'] ?? '',
      serviceRequestId: map['serviceRequestId'] ?? '',
      providerId: map['providerId'] ?? '',
      userId: map['userId'] ?? '',
      description: map['description'] ?? '',
      price: (map['price'] ?? 0).toDouble(),
      status: map['status'] ?? 'pending',
      createdAt: (map['createdAt'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'serviceRequestId': serviceRequestId,
      'providerId': providerId,
      'userId': userId,
      'description': description,
      'price': price,
      'status': status,
      'createdAt': createdAt,
    };
  }
}
