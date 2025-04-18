// lib/models/user_model.dart
class UserModel {
  final String id;
  final String email;
  final String name;
  final String phone;
  final String userType; // 'provider' or 'consumer'
  final String? profileImage;
  final Map<String, dynamic>? additionalInfo;

  UserModel({
    required this.id,
    required this.email,
    required this.name,
    required this.phone,
    required this.userType,
    this.profileImage,
    this.additionalInfo,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] ?? '',
      email: map['email'] ?? '',
      name: map['name'] ?? '',
      phone: map['phone'] ?? '',
      userType: map['userType'] ?? 'consumer',
      profileImage: map['profileImage'],
      additionalInfo: map['additionalInfo'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'name': name,
      'phone': phone,
      'userType': userType,
      'profileImage': profileImage,
      'additionalInfo': additionalInfo,
    };
  }
}
