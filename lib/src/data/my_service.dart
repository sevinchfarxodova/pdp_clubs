import 'dart:convert';
import 'package:http/http.dart' as http;
import 'models/club_model.dart';

class ApiService {
  static const String baseUrl =
      "https://676546dc52b2a7619f5f04f5.mockapi.io/test-api/seventh";

  static Future<List<Club>> fetchClubs() async {
    try {
      final response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data.map((club) => Club.fromJson(club)).toList();
      } else {
        throw Exception("Failed to load clubs");
      }
    } catch (e) {
      throw Exception("Error: $e");
    }
  }

  static Future<Club> fetchClubDetails(String clubId) async {
    final url = Uri.parse('$baseUrl/$clubId');

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        return Club.fromJson(jsonDecode(response.body));
      } else {
        throw Exception("Failed to load club details");
      }
    } catch (e) {
      throw Exception("Error: $e");
    }
  }

  static Future<void> addComment(String clubId, String comment) async {
    final url = Uri.parse('$baseUrl/$clubId');
    final response = await http.put(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'comment': comment,
      }),
    );

    if (response.statusCode == 200) {
      // Resource updated successfully
      print('Resource updated: ${response.body}');
    } else {
      // Handle error
      print('Failed to update resource: ${response.statusCode}');
    }
  }
}
