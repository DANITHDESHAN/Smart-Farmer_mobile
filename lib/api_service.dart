// import 'dart:convert';
// import 'package:http/http.dart' as http;

// Future<String> makePrediction(List<double> inputData) async {
//   final response = await http.post(
//     Uri.parse('http://192.168.8.152:5000/api/predict'), // Replace with your API endpoint
//     headers: {'Content-Type': 'application/json'},
//     body: json.encode({'input': inputData}),
//   );

//   if (response.statusCode == 200) {
//     return json.decode(response.body)['prediction'];
//   } else {
//     throw Exception('Failed to make prediction');
//   }
// }
