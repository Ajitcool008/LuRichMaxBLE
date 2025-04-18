// lib/services/interfaces/database_interface.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class DatabaseInterface {
  Future<UserCredential> signUp(String email, String password);
  Future<UserCredential> signIn(String email, String password);
  Future<void> signOut();

  Future<void> createUserProfile(String userId, Map<String, dynamic> data);
  Future<Map<String, dynamic>?> getUserProfile(String userId);

  Future<List<Map<String, dynamic>>> getServiceRequests();
  Future<String> createServiceRequest(Map<String, dynamic> data);

  Future<void> createProposal(Map<String, dynamic> data);
  Stream<QuerySnapshot> getProposalsForUser(String userId);
  Stream<QuerySnapshot> getProposalsForProvider(String providerId);

  Future<String> createChatRoom(Map<String, dynamic> data);
  Future<void> sendMessage(String chatRoomId, Map<String, dynamic> message);
  Stream<QuerySnapshot> getChatMessages(String chatRoomId);
  Stream<QuerySnapshot> getChatRooms(String userId);
}
