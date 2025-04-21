import 'dart:convert';
import 'package:http/http.dart' as http;

class AIService {
  static const String _apiKey = 'sk-YOUR_EXAMPLE_KEY'; // Reemplaza por tu clave real
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
            "content": "Actúa como una guía holística sabia y amorosa llamada 'Lúa'. Tu tarea es ayudar a las personas a manifestar sus deseos desde su intención profunda y alineada con su esencia."
          },
          {
            "role": "user",
            "content": "Quiero manifestar: $intention"
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
