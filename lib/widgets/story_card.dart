import 'package:flutter/material.dart';
import '../models/story.dart';
import '../screens/detail_screen.dart';
import 'liquid_glass_renderer.dart';

class StoryCard extends StatelessWidget {
  final Story story;

  const StoryCard({super.key, required this.story});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => DetailScreen(story: story),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.25),
                blurRadius: 12,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: SizedBox(
            height: 150,
            child: LiquidGlassRenderer(
              child: Row(
                children: [
                  const SizedBox(width: 10),

                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(
                      story.image,
                      width: 90,
                      height: 120,
                      fit: BoxFit.cover,
                    ),
                  ),

                  const SizedBox(width: 15),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          story.title,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          story.subtitle,
                          style: const TextStyle(color: Colors.white70),
                        ),
                        const SizedBox(height: 10),

                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 14, vertical: 7),
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [
                                Colors.tealAccent,
                                Colors.greenAccent
                              ],
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Text(
                            "Watch Now",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(width: 10),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
