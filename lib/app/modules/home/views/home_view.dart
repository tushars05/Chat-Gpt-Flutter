import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../chat_text/views/chat_text_view.dart';
import '../controllers/home_controller.dart';
import '../screens/profile_view.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.logout),
          onPressed: () {
            // Log out the user and navigate to the AuthView
            FirebaseAuth.instance.signOut();
            Get.offAllNamed(Routes.AUTHENTICATION);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              // Navigate to the profile view
              Get.toNamed(Routes.PROFILE);
            },
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              makeCard(
                Icons.text_fields_sharp,
                "Chat Bot",
                const Color(0xFF833AB4),
                    () {
                  Get.toNamed(Routes.CHAT_TEXT);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget makeCard(
      IconData icon,
      String title,
      Color color,
      VoidCallback callback,
      ) {
    return InkWell(
      onTap: callback,
      child: Card(
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Container(
          height: 120,
          width: 120,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: Colors.white,
                  size: 44,
                ),
                const SizedBox(height: 8),
                Text(
                  title,
                  style: const TextStyle(
                    fontFamily: 'SF Pro',
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}