// lib/views/shared/chat_room_view.dart (With added web responsiveness)
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/auth_controller.dart';
import '../../controllers/chat_controller.dart';
import '../../models/chat_model.dart';
import '../../utils/responsive_helper.dart';

class ChatRoomView extends StatelessWidget {
  const ChatRoomView({super.key});

  @override
  Widget build(BuildContext context) {
    final ChatController controller = Get.find<ChatController>();
    final AuthController authController = Get.find<AuthController>();
    final TextEditingController messageController = TextEditingController();

    final Map<String, dynamic> args = Get.arguments;
    final String chatRoomId = args['chatRoomId'];

    // Start listening for messages in this chat room
    controller.openChatRoom(chatRoomId);

    return Scaffold(
      appBar: AppBar(title: const Text('Chat')),
      body: LayoutBuilder(
        builder: (context, constraints) {
          // Web layout
          if (constraints.maxWidth > 800) {
            return Row(
              children: [
                // Side panel with contacts (only on web)
                Container(
                  width: 300,
                  decoration: BoxDecoration(
                    border: Border(
                      right: BorderSide(color: Colors.grey.shade300, width: 1),
                    ),
                  ),
                  child: Obx(() {
                    if (controller.chatRooms.isEmpty) {
                      return const Center(child: Text('No conversations yet'));
                    }

                    return ListView.builder(
                      itemCount: controller.chatRooms.length,
                      itemBuilder: (context, index) {
                        ChatRoom chatRoom = controller.chatRooms[index];
                        bool isActive = chatRoom.id == chatRoomId;

                        return ListTile(
                          tileColor:
                              isActive ? Colors.blue.withOpacity(0.1) : null,
                          leading: CircleAvatar(
                            backgroundColor: Theme.of(context).primaryColor,
                            child: const Icon(
                              Icons.person,
                              color: Colors.white,
                            ),
                          ),
                          title: const Text('User Name'),
                          subtitle: Text(
                            chatRoom.lastMessage.isEmpty
                                ? 'No messages yet'
                                : chatRoom.lastMessage,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          onTap: () {
                            // Navigate to a different chat room
                            Get.offAndToNamed(
                              '/chat-room',
                              arguments: {'chatRoomId': chatRoom.id},
                            );
                          },
                        );
                      },
                    );
                  }),
                ),

                // Main chat area
                Expanded(
                  child: _buildChatArea(
                    context,
                    controller,
                    authController,
                    messageController,
                  ),
                ),
              ],
            );
          } else {
            // Mobile layout
            return _buildChatArea(
              context,
              controller,
              authController,
              messageController,
            );
          }
        },
      ),
    );
  }

  Widget _buildChatArea(
    BuildContext context,
    ChatController controller,
    AuthController authController,
    TextEditingController messageController,
  ) {
    return Column(
      children: [
        // Messages list
        Expanded(
          child: Obx(() {
            if (controller.messages.isEmpty) {
              return const Center(child: Text('No messages yet'));
            }

            return ListView.builder(
              reverse: true,
              itemCount: controller.messages.length,
              itemBuilder: (context, index) {
                // Display messages in reverse order (newest at the bottom)
                ChatMessage message =
                    controller.messages[controller.messages.length - 1 - index];
                bool isMyMessage =
                    message.senderId == authController.user.value?.uid;

                return _buildMessageBubble(context, message, isMyMessage);
              },
            );
          }),
        ),

        // Message input
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 3,
                offset: const Offset(0, -1),
              ),
            ],
          ),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: messageController,
                  decoration: const InputDecoration(
                    hintText: 'Type a message',
                    border: InputBorder.none,
                  ),
                  maxLines: null,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.send),
                color: Theme.of(context).primaryColor,
                onPressed: () {
                  if (messageController.text.trim().isNotEmpty) {
                    controller.sendMessage(messageController.text.trim());
                    messageController.clear();
                  }
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMessageBubble(
    BuildContext context,
    ChatMessage message,
    bool isMyMessage,
  ) {
    return Align(
      alignment: isMyMessage ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color:
              isMyMessage
                  ? Theme.of(context).primaryColor
                  : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(12),
        ),
        constraints: BoxConstraints(
          maxWidth:
              ResponsiveHelper.isDesktop(context)
                  ? 400 // Limit width in desktop mode
                  : MediaQuery.of(context).size.width *
                      0.7, // 70% of screen on mobile
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              message.message,
              style: TextStyle(
                color: isMyMessage ? Colors.white : Colors.black,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              '${message.timestamp.hour}:${message.timestamp.minute}',
              style: TextStyle(
                fontSize: 10,
                color: isMyMessage ? Colors.white70 : Colors.grey.shade600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
