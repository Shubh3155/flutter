import 'package:flutter/material.dart';
import '../models/story.dart';

class DetailScreen extends StatelessWidget {
  final Story story;

  const DetailScreen({super.key, required this.story});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F2027),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔥 IMAGE WITH OVERLAY
            Stack(
              children: [
                Image.network(
                  story.image,
                  width: double.infinity,
                  height: 300,
                  fit: BoxFit.cover,
                ),

                // Gradient overlay (important for clean UI)
                Container(
                  height: 300,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.transparent, Color(0xFF0F2027)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // 🔥 TITLE
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                story.title,
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),

            const SizedBox(height: 8),

            // 🔥 SUBTITLE
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                story.subtitle,
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                ),
              ),
            ),

            const SizedBox(height: 20),

            // 🔥 PLAY BUTTON (centered & bigger)
            Center(
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 30, vertical: 12),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Colors.tealAccent, Colors.greenAccent],
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(Icons.play_arrow, color: Colors.black),
                    SizedBox(width: 6),
                    Text(
                      "Play Story",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 30),

            // 🔥 DESCRIPTION (makes it feel real)
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Description",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 10),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "This is a short immersive story designed to keep you engaged with suspense, emotion, and cinematic storytelling. Enjoy a quick yet powerful experience.",
                style: TextStyle(
                  color: Colors.white70,
                  height: 1.5,
                ),
              ),
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
