// lib/services/firebase/firebase_service.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../interfaces/database_interface.dart';

class FirebaseService implements DatabaseInterface {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Auth methods
  Future<UserCredential> signUp(String email, String password) {
    return _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<UserCredential> signIn(String email, String password) {
    return _auth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<void> signOut() {
    return _auth.signOut();
  }

  // User profile methods
  Future<void> createUserProfile(String userId, Map<String, dynamic> data) {
    return _firestore.collection('users').doc(userId).set(data);
  }

  Future<Map<String, dynamic>?> getUserProfile(String userId) async {
    DocumentSnapshot doc =
        await _firestore.collection('users').doc(userId).get();
    return doc.exists ? doc.data() as Map<String, dynamic>? : null;
  }

  // Service requests
  Future<List<Map<String, dynamic>>> getServiceRequests() async {
    QuerySnapshot snapshot =
        await _firestore.collection('service_requests').get();
    return snapshot.docs.map((doc) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      data['id'] = doc.id;
      return data;
    }).toList();
  }

  Future<String> createServiceRequest(Map<String, dynamic> data) async {
    DocumentReference ref = await _firestore
        .collection('service_requests')
        .add(data);
    return ref.id;
  }

  // Proposals
  Future<void> createProposal(Map<String, dynamic> data) {
    return _firestore.collection('proposals').add(data);
  }

  Stream<QuerySnapshot> getProposalsForUser(String userId) {
    return _firestore
        .collection('proposals')
        .where('userId', isEqualTo: userId)
        .snapshots();
  }

  Stream<QuerySnapshot> getProposalsForProvider(String providerId) {
    return _firestore
        .collection('proposals')
        .where('providerId', isEqualTo: providerId)
        .snapshots();
  }

  // Chat methods
  Future<String> createChatRoom(Map<String, dynamic> data) async {
    DocumentReference ref = await _firestore.collection('chat_rooms').add(data);
    return ref.id;
  }

  Future<void> sendMessage(String chatRoomId, Map<String, dynamic> message) {
    return _firestore
        .collection('chat_rooms')
        .doc(chatRoomId)
        .collection('messages')
        .add(message);
  }

  Stream<QuerySnapshot> getChatMessages(String chatRoomId) {
    return _firestore
        .collection('chat_rooms')
        .doc(chatRoomId)
        .collection('messages')
        .orderBy('timestamp', descending: false)
        .snapshots();
  }

  Stream<QuerySnapshot> getChatRooms(String userId) {
    return _firestore
        .collection('chat_rooms')
        .where('participants', arrayContains: userId)
        .snapshots();
  }
}
