// lib/constants/app_constants.dart
class AppConstants {
  // Routes
  static const String splashRoute = '/splash';
  static const String loginRoute = '/login';
  static const String signupRoute = '/signup';
  static const String roleSelectionRoute = '/role-selection';
  static const String homeRoute = '/home';

  // Firebase collections
  static const String usersCollection = 'users';
  static const String serviceRequestsCollection = 'service_requests';
  static const String proposalsCollection = 'proposals';
  static const String chatRoomsCollection = 'chat_rooms';
  static const String messagesCollection = 'messages';

  // User types
  static const String providerType = 'provider';
  static const String consumerType = 'consumer';

  // Status values
  static const String statusPending = 'pending';
  static const String statusAccepted = 'accepted';
  static const String statusRejected = 'rejected';
  static const String statusCompleted = 'completed';
}
