import 'package:cloud_firestore/cloud_firestore.dart';

class ChatMessage {
  final String id;
  final String senderId;
  final String message;
  final DateTime timestamp;
  final bool isRead;

  ChatMessage({
    required this.id,
    required this.senderId,
    required this.message,
    required this.timestamp,
    required this.isRead,
  });

  factory ChatMessage.fromMap(Map<String, dynamic> map) {
    return ChatMessage(
      id: map['id'] ?? '',
      senderId: map['senderId'] ?? '',
      message: map['message'] ?? '',
      timestamp: (map['timestamp'] as Timestamp).toDate(),
      isRead: map['isRead'] ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'senderId': senderId,
      'message': message,
      'timestamp': timestamp,
      'isRead': isRead,
    };
  }
}

class ChatRoom {
  final String id;
  final List<String> participants;
  final DateTime createdAt;
  final DateTime lastMessageAt;
  final String lastMessage;

  ChatRoom({
    required this.id,
    required this.participants,
    required this.createdAt,
    required this.lastMessageAt,
    required this.lastMessage,
  });

  factory ChatRoom.fromMap(Map<String, dynamic> map) {
    return ChatRoom(
      id: map['id'] ?? '',
      participants: List<String>.from(map['participants'] ?? []),
      createdAt: (map['createdAt'] as Timestamp).toDate(),
      lastMessageAt: (map['lastMessageAt'] as Timestamp).toDate(),
      lastMessage: map['lastMessage'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'participants': participants,
      'createdAt': createdAt,
      'lastMessageAt': lastMessageAt,
      'lastMessage': lastMessage,
    };
  }
}
