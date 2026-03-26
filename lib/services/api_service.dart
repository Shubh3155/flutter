import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/story.dart';

class ApiService {
  static const String apiKey = "b0777c83faed3bd89e034fb801b91c0d"; // 🔴 Replace this
  static const String baseUrl = "api.themoviedb.org";

  static Future<List<Story>> fetchMovies() async {
    try {
      final uri = Uri.https(
        baseUrl,
        "/3/movie/popular",
        {"api_key": apiKey},
      );

      final response = await http.get(uri);

      // 🔍 Debug logs
      print("STATUS CODE: ${response.statusCode}");
      print("RESPONSE: ${response.body}");

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        return (data['results'] as List).map((movie) {
          return Story(
            title: movie['title'] ?? "No Title",
            subtitle:
            "⭐ ${movie['vote_average'] ?? 'N/A'} | ${movie['release_date'] ?? 'N/A'}",
            image: movie['poster_path'] != null
                ? "https://image.tmdb.org/t/p/w500${movie['poster_path']}"
                : "", // fallback
          );
        }).toList();
      } else {
        throw Exception(
            "API Error: ${response.statusCode} - ${response.body}");
      }
    } catch (e) {
      print("ERROR: $e");
      throw Exception("Failed to load movies");
    }
  }
}
