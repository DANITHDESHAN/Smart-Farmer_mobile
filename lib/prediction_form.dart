import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'yeild_prediction.dart';

class PredictionFormPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Prediction Form'),
         backgroundColor: Color.fromARGB(255, 6, 56, 9),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView( // Wrap the Column with SingleChildScrollView
          child: PredictionForm(),
        ),
      ),
    );
  }
}

class PredictionForm extends StatefulWidget {
  @override
  _PredictionFormState createState() => _PredictionFormState();
}

class _PredictionFormState extends State<PredictionForm> {
  final TextEditingController nController = TextEditingController();
  final TextEditingController pController = TextEditingController();
  final TextEditingController kController = TextEditingController();
  final TextEditingController temperatureController = TextEditingController();
  final TextEditingController humidityController = TextEditingController();
  final TextEditingController phController = TextEditingController();
  final TextEditingController rainfallController = TextEditingController();

  String prediction = '';

  void sendDataToAPI() async {
    var url = 'http://192.168.8.100:5000/api/predict';


    var input_data = [
      int.parse(nController.text),
      int.parse(pController.text),
      int.parse(kController.text),
      double.parse(temperatureController.text),
      double.parse(humidityController.text),
      double.parse(phController.text),
      double.parse(rainfallController.text),
    ];

    // Build the query parameters and URL
    var queryParams = {
      'input_data': jsonEncode(input_data),
    };
    var uri = Uri.parse(url).replace(queryParameters: queryParams);

    var response = await http.get(uri);

    if (response.statusCode == 200) {
      // Request successful, update the prediction state
      var responseData = jsonDecode(response.body);
      var predictions = responseData['predictions'];
      setState(() {
        prediction = predictions.isNotEmpty ? predictions[0] : '';
      });
    } else {
      // Request failed
      print('Request failed with status: ${response.statusCode}.');
    }
  }

   void _yeildForm() {
    
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => YeildPrediction()),
      );
    }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  controller: nController,
                  decoration: InputDecoration(labelText: 'N'),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: pController,
                  decoration: InputDecoration(labelText: 'P'),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: kController,
                  decoration: InputDecoration(labelText: 'K'),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: temperatureController,
                  decoration: InputDecoration(labelText: 'Temperature'),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: humidityController,
                  decoration: InputDecoration(labelText: 'Humidity'),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: phController,
                  decoration: InputDecoration(labelText: 'pH'),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: rainfallController,
                  decoration: InputDecoration(labelText: 'Rainfall'),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: sendDataToAPI,
                  //style
                  style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 6, 75, 8), // Set the button color to green
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            9.0), // Specify the desired border radius
                      ),
                      textStyle: TextStyle(
                        fontSize: 16.0, // Specify the desired font size
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  child: Text('Recommend Crop'),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 16),
        Container(
          width: double.infinity,
          height: 150,
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text('Recommend Crop is: $prediction',
               style: TextStyle(
                            fontSize: 18, // Adjust the font size as desired
                            color: Color.fromARGB(255, 0, 0, 0), // Change the color to your preferred color
                          ),
              ),
              
            ),
          ),
        ),
        SizedBox(height: 16),
         ElevatedButton(
                  onPressed: _yeildForm,
                    //style
                  style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 6, 75, 8), // Set the button color to green
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            9.0), // Specify the desired border radius
                      ),
                      textStyle: TextStyle(
                        fontSize: 16.0, // Specify the desired font size
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  child: Text('Predict Crop Yeild'),
                ),
      ],
    );
  }
}
