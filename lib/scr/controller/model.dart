import 'package:cloud_firestore/cloud_firestore.dart';

class MessengerModel {
  final String sendId;
  final String sendEmail;
  final String userId;
  final String message;
  final Timestamp timestamp;

  MessengerModel({
    required this.sendId,
    required this.sendEmail,
    required this.userId,
    required this.message,
    required this.timestamp,
  });

  Map<String, dynamic> toMap() {
    return {
      'sendId': sendId,
      'sendEmail': sendEmail,
      'userId':userId,
      'message': message,
      'timestamp': timestamp,
    };
  }

  factory MessengerModel.fromMap(Map<String, dynamic> map) {
    return MessengerModel(
      sendId: map['sendId'] as String,
      sendEmail: map['sendEmail'] as String,
      userId: map['userId'] as String,
      message: map['message'] as String,
      timestamp: map['timestamp'] as Timestamp,
    );
  }
}
