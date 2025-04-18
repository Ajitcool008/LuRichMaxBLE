// lib/controllers/chat_controller.dart
import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../models/chat_model.dart';
import '../services/firebase/firebase_service.dart';
import 'auth_controller.dart';

class ChatController extends GetxController {
  final FirebaseService _firebaseService = FirebaseService();
  final AuthController _authController = Get.find<AuthController>();

  RxList<ChatRoom> chatRooms = <ChatRoom>[].obs;
  RxList<ChatMessage> messages = <ChatMessage>[].obs;
  RxBool isLoading = false.obs;

  StreamSubscription? _chatRoomsSubscription;
  StreamSubscription? _messagesSubscription;
  String? currentChatRoomId;

  @override
  void onInit() {
    super.onInit();
    setupChatRoomsStream();
  }

  void setupChatRoomsStream() {
    if (_authController.user.value == null) return;

    // Cancel existing subscription first
    _chatRoomsSubscription?.cancel();

    try {
      // Start new subscription
      _chatRoomsSubscription = _firebaseService
          .getChatRooms(_authController.user.value!.uid)
          .listen(
            (QuerySnapshot snapshot) {
              chatRooms.value =
                  snapshot.docs.map((doc) {
                    Map<String, dynamic> data =
                        doc.data() as Map<String, dynamic>;
                    data['id'] = doc.id;
                    return ChatRoom.fromMap(data);
                  }).toList();
            },
            onError: (error) {
              print('Error in chat rooms stream: $error');
              // Clear data on error
              chatRooms.clear();
            },
          );
    } catch (e) {
      print('Failed to setup chat rooms stream: $e');
    }
  }

  Future<bool> sendMessage(String message) async {
    if (_authController.user.value == null || currentChatRoomId == null) {
      return false;
    }

    try {
      isLoading.value = true;

      // Create message data
      Map<String, dynamic> messageData = {
        'senderId': _authController.user.value!.uid,
        'message': message,
        'timestamp': DateTime.now(),
        'isRead': false,
      };

      // Use the FirebaseService method instead of direct Firestore access
      await _firebaseService.sendMessage(currentChatRoomId!, messageData);

      isLoading.value = false;
      return true;
    } catch (e) {
      isLoading.value = false;
      Get.snackbar('Error', 'Failed to send message: ${e.toString()}');
      return false;
    }
  }

  void openChatRoom(String chatRoomId) {
    currentChatRoomId = chatRoomId;

    // Cancel existing subscription first
    _messagesSubscription?.cancel();

    try {
      _messagesSubscription = _firebaseService
          .getChatMessages(chatRoomId)
          .listen(
            (QuerySnapshot snapshot) {
              messages.value =
                  snapshot.docs.map((doc) {
                    Map<String, dynamic> data =
                        doc.data() as Map<String, dynamic>;
                    data['id'] = doc.id;
                    return ChatMessage.fromMap(data);
                  }).toList();
            },
            onError: (error) {
              print('Error in messages stream: $error');
              // Clear messages on error
              messages.clear();
            },
          );
    } catch (e) {
      print('Failed to setup messages stream: $e');
    }
  }

  void clearStreams() {
    _chatRoomsSubscription?.cancel();
    _messagesSubscription?.cancel();
    _chatRoomsSubscription = null;
    _messagesSubscription = null;
    chatRooms.clear();
    messages.clear();
  }

  @override
  void onClose() {
    clearStreams();
    super.onClose();
  }
}
