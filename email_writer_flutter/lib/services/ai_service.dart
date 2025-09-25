import 'dart:convert';
import 'package:email_writer_flutter/utils/constants.dart';
import 'package:http/http.dart' as http;

class AIService {
  static Future<String> generateReply(String emailContent, String tone) async {
    const apiUrl = "$serverUrl/api/email/generate";

    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'emailContent': emailContent, 'tone': tone}),
    );

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to generate reply');
    }
  }
}
