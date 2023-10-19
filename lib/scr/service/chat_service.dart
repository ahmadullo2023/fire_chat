import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../controller/model.dart';


class ChatService {
  final _firebaseAuth = FirebaseAuth.instance;
  final _fireStore = FirebaseFirestore.instance;

  Future<void> sendMessenger(String userId, String message) async {
    final String currentUserId = _firebaseAuth.currentUser!.uid;
    final String currentUserEmail = _firebaseAuth.currentUser!.email.toString();

    final Timestamp timestamp = Timestamp.now();

    MessengerModel newMessage = MessengerModel(
      sendId: currentUserId,
      sendEmail: currentUserEmail,
      userId: userId,
      message: message,
      timestamp: timestamp,
    );

    List<String> ids = [currentUserId, userId];
    ids.sort();

    String chatRoomId = ids.join("_");

    await _fireStore
        .collection("chat_rooms")
        .doc(chatRoomId)
        .collection("messages")
        .add(
      newMessage.toMap(),
    );

  }
  Stream <QuerySnapshot>getMessages(String userId, String otherUserId) {
    List<String> ids = [userId, otherUserId];
    ids.sort();
    String chatRoomId = ids.join("_");
    return _fireStore
        .collection("chat_rooms")
        .doc(chatRoomId)
        .collection("messages")
        .orderBy(
      "timestamp",
      descending: false,
    )
        .snapshots();
  }
}
