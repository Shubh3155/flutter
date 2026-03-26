import 'package:flutter/material.dart';
import '../data/dummy_data.dart';
import '../widgets/story_card.dart';
import '../services/api_service.dart';
import '../models/story.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white.withOpacity(0.2),
        onPressed: () {},
        child: const Icon(Icons.play_arrow, color: Colors.white),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF0F2027), Color(0xFF2C5364)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 10),

              // Header
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    CircleAvatar(
                      backgroundImage:
                      NetworkImage("https://i.pravatar.cc/150"),
                    ),
                    Icon(Icons.search, color: Colors.white70),
                  ],
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                'Foxtales',
                style: TextStyle(
                  fontSize: 42,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                  fontFamily: 'Aladin',
                ),
              ),

              const SizedBox(height: 6),

              const Text(
                'Discover Short Stories',
                style: TextStyle(color: Colors.white70),
              ),

              const SizedBox(height: 20),

              Expanded(
                child: FutureBuilder<List<Story>>(
                  future: ApiService.fetchMovies(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasError) {
                      return const Center(
                        child: Text(
                          "Error loading movies",
                          style: TextStyle(color: Colors.white),
                        ),
                      );
                    } else {
                      final movies = snapshot.data!;

                      return ListView.builder(
                        itemCount: movies.length,
                        itemBuilder: (context, index) {
                          return StoryCard(story: movies[index]);
                        },
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

