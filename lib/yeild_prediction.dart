import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class YeildPrediction extends StatefulWidget {
  @override
  _YeildPredictionState createState() => _YeildPredictionState();
}

class _YeildPredictionState extends State<YeildPrediction> {
  TextEditingController _districtController = TextEditingController();
  TextEditingController _cropController = TextEditingController();
  TextEditingController _seasonController = TextEditingController();
  TextEditingController _areaController = TextEditingController();
  String prediction = '';

  void sendDataToAPI() async {
    var url =
        'http://192.168.8.100:5002/api/yeildpredict'; // Update the URL with your Python API endpoint

    var input_data = {
      'Area': _areaController.text,
      'District': _districtController.text,
      'Crop': _cropController.text,
      'Season': _seasonController.text,
    };

    var queryParams = {
      'input_data': jsonEncode(input_data),
    };
    var uri = Uri.parse(url).replace(queryParameters: queryParams);

    var response = await http.get(uri);

    if (response.statusCode == 200) {
      // Request successful, update the prediction state
      var responseData = jsonDecode(response.body);
      var predictions_yeild = responseData['predictions_yeild'];

      if (predictions_yeild != null && predictions_yeild.isNotEmpty) {
        setState(() {
          prediction = predictions_yeild[0].toString();
        });
      } else {
        setState(() {
          prediction = predictions_yeild.isNotEmpty ? predictions_yeild[0] : '';
        });
      }
    } else {
      // Request failed
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Harvest Prediction'),
        backgroundColor: Color.fromARGB(255, 6, 56, 9),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: _areaController,
                  decoration: InputDecoration(
                    labelText: 'Area(Acres)',
                  ),
                ),
                SizedBox(height: 10.0),
                TextField(
                  controller: _districtController,
                  decoration: InputDecoration(
                    labelText: 'District',
                  ),
                ),
                SizedBox(height: 10.0),
                TextField(
                  controller: _cropController,
                  decoration: InputDecoration(
                    labelText: 'Crop',
                  ),
                ),
                SizedBox(height: 10.0),
                TextField(
                  controller: _seasonController,
                  decoration: InputDecoration(
                    labelText: 'Season',
                  ),
                ),
                SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: sendDataToAPI,
                  //style
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(
                        255, 6, 75, 8), // Set the button color to green
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          9.0), // Specify the desired border radius
                    ),
                    textStyle: TextStyle(
                      fontSize: 16.0, // Specify the desired font size
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  child: Text('Predic Harvest'),
                ),
                SizedBox(height: 16),
                Container(
                  width: double.infinity,
                  height: 150,
                  child: Card(
                    child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          'Your Harvest: $prediction' + '(%)',
                          style: TextStyle(
                            fontSize: 18, // Adjust the font size as desired
                            color: Color.fromARGB(255, 0, 0, 0), // Change the color to your preferred color
                          ),
                        )),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
