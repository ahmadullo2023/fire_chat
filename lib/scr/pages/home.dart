import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fire_chat/scr/pages/sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'chat_page.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final service = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 27, 32, 45),
        appBar: AppBar(
          backgroundColor: const Color(0xFF0A0D27),
          title: const Text("WELCOME"),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SignIn(),
                  ),
                );
              },
              icon: const Icon(
                Icons.login,
                size: 30,
              ),
            ),
          ],
        ),
        body: Center(
          child: _userBuildList(),
        )
    );
  }

  Widget _userBuildList() {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection("users").snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text("Error snapshot data");
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading");
        }
        if (snapshot.hasData) {
          return ListView(
            physics: const BouncingScrollPhysics(),
            children:
            snapshot.data!.docs.map((e) => _buildUserListItem(e)).toList(),
          );
        }
        return const CircularProgressIndicator();
      },
    );
  }

  Widget _buildUserListItem(DocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data()! as Map<String, dynamic>;
    if (service.currentUser!.email != data["email"]) {
      return ListTile(
        title: Card(
          child: SizedBox(
            height: 50,
           child: Center(
              child: Text(
                data["email"],
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 19,
                ),
              ),
            ),
          ),
        ),
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                ChatPage(userEmail: data["email"], userId: data["uid"]),
          ),
        ),
      );
    } else {
      return Container();
    }
  }
}