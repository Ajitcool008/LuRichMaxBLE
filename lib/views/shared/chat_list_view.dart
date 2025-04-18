// lib/views/shared/chat_list_view.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/chat_controller.dart';
import '../../models/chat_model.dart';
import '../../routes/app_routes.dart';

class ChatListView extends StatelessWidget {
  const ChatListView({super.key});

  @override
  Widget build(BuildContext context) {
    final ChatController controller = Get.find<ChatController>();

    return Scaffold(
      appBar: AppBar(title: const Text('Messages')),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.chatRooms.isEmpty) {
          return const Center(child: Text('No conversations yet'));
        }

        return ListView.builder(
          itemCount: controller.chatRooms.length,
          itemBuilder: (context, index) {
            ChatRoom chatRoom = controller.chatRooms[index];
            return _buildChatRoomTile(context, chatRoom);
          },
        );
      }),
    );
  }

  Widget _buildChatRoomTile(BuildContext context, ChatRoom chatRoom) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Theme.of(context).primaryColor,
        child: const Icon(Icons.person, color: Colors.white),
      ),
      title: const Text('User Name'), // This would be fetched from user profile
      subtitle: Text(
        chatRoom.lastMessage.isEmpty ? 'No messages yet' : chatRoom.lastMessage,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: Text(
        '${chatRoom.lastMessageAt.hour}:${chatRoom.lastMessageAt.minute}',
        style: TextStyle(color: Colors.grey.shade600),
      ),
      onTap: () {
        Get.toNamed(AppRoutes.chatRoom, arguments: {'chatRoomId': chatRoom.id});
      },
    );
  }
}
