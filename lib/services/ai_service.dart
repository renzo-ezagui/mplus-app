import 'dart:convert';
import 'package:http/http.dart' as http;

class AIService {
  static const String _apiKey = 'sk-YOUR_EXAMPLE_KEY'; // Replace with your actual key
  static const String _apiUrl = 'https://api.openai.com/v1/chat/completions';

  static Future<Map<String, dynamic>> generateManifestationPlan(String intention) async {
    final response = await http.post(
      Uri.parse(_apiUrl),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $_apiKey',
      },
      body: jsonEncode({
        "model": "gpt-4",
        "messages": [
          {
            "role": "system",
            "content": "Act as a loving holistic guide called 'Lúa'. Your job is to help people manifest desires from deep aligned intention."
          },
          {
            "role": "user",
            "content": "I want to manifest: $intention"
          }
        ],
        "temperature": 0.8
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final content = data['choices'][0]['message']['content'];
      return {"success": true, "response": content};
    } else {
      return {"success": false, "error": response.body};
    }
  }
}
