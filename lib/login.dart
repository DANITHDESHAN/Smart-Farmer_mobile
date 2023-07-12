// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// import 'prediction_form.dart'; // Import your PredictionForm class file

// class LoginPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // appBar: AppBar(
//       //   title: Text('Login Page'),
//       // ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Card(
//           elevation: 4.0,
//           child: LoginForm(),
//         ),
//       ),
//     );
//   }
// }

// class LoginForm extends StatefulWidget {
//   @override
//   _LoginFormState createState() => _LoginFormState();
// }

// class _LoginFormState extends State<LoginForm> {
//   final _formKey = GlobalKey<FormState>();
//   String _email = '';
//   String _password = '';

//   Future<void> _submitForm() async {
//     if (_formKey.currentState!.validate()) {
//       _formKey.currentState!.save();

//       try {
//         // Create a Map object with the email and password
//         Map<String, String> loginData = {
//           'userName': _email,
//           'password': _password,
//         };

//         // Convert the loginData Map to a JSON string
//         String loginDataJson = json.encode(loginData);

//         // Make a POST request to the login endpoint of your Node.js API
//        var response = await http.post(
//   Uri.parse('http://192.168.8.102:5001/api/v1/farmer/loginFarmer'),
//   headers: {'Content-Type': 'application/json'},
//   body: loginDataJson,
// );


//         if (response.statusCode == 200) {
//           // Login successful
//           // Navigate to the PredictionForm screen
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => PredictionFormPage()),
//           );
//         } else {
//           // Login failed
//           // Display an error message
//           showDialog(
//             context: context,
//             builder: (context) => AlertDialog(
//               title: Text('Login Error'),
//               content: Text('Invalid email or password. Please try again.'),
//               actions: [
//                 TextButton(
//                   onPressed: () => Navigator.pop(context),
//                   child: Text('OK'),
//                 ),
//               ],
//             ),
//           );
//         }
//       } catch (error) {
//         print('Error occurred during login: $error');
//         showDialog(
//           context: context,
//           builder: (context) => AlertDialog(
//             title: Text('Login Error'),
//             content: Text('An error occurred during login. Please try again.'),
//             actions: [
//               TextButton(
//                 onPressed: () => Navigator.pop(context),
//                 child: Text('OK'),
//               ),
//             ],
//           ),
//         );
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 4.0,
//       child: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               Center(
//                 child: Container(
//                   decoration: BoxDecoration(
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.grey.withOpacity(0.2),
//                         spreadRadius: 5,
//                         blurRadius: 10,
//                         offset: Offset(0, 3), // changes the position of shadow
//                       ),
//                     ],
//                     borderRadius: BorderRadius.circular(60),
//                   ),
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.circular(63),
//                     child: Container(
//                       width: 130,
//                       height: 130,
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                       ),
//                       child: Image.network(
//                         'https://tinypic.host/images/2023/04/27/smartfarmer.png',
//                         fit: BoxFit.contain,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 16.0),
//               TextFormField(
//                 decoration: InputDecoration(labelText: 'Email'),
//                 validator: (value) {
//                   if (value!.isEmpty) {
//                     return 'Please enter your email';
//                   }
//                   return null;
//                 },
//                 onSaved: (value) {
//                   _email = value!;
//                 },
//               ),
//               SizedBox(height: 12.0),
//               TextFormField(
//                 decoration: InputDecoration(labelText: 'Password'),
//                 obscureText: true,
//                 validator: (value) {
//                   if (value!.isEmpty) {
//                     return 'Please enter your password';
//                   }
//                   return null;
//                 },
//                 onSaved: (value) {
//                   _password = value!;
//                 },
//               ),
//               SizedBox(height: 40.0),
//               Container(
//                 width: double.infinity,
//                 child: ElevatedButton(
//                   onPressed: _submitForm,
//                   style: ElevatedButton.styleFrom(
//                     primary: Colors.green, // Set the button color to green
//                   ),
//                   child: Text('Login'),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'prediction_form.dart'; // Import your PredictionForm class file

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Login Page'),
      // ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Card(
          elevation: 4.0,
          child: LoginForm(),
        ),
      ),
    );
  }
}


class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';
  bool _isPasswordVisible = false;

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      try {
        // Create a Map object with the email and password
        Map<String, String> loginData = {
          'userName': _email,
          'password': _password,
        };

        // Convert the loginData Map to a JSON string
        String loginDataJson = json.encode(loginData);

        // Make a POST request to the login endpoint of your Node.js API
       var response = await http.post(
  Uri.parse('http://192.168.8.100:5001/api/v1/farmer/loginFarmer'),
  headers: {'Content-Type': 'application/json'},
  body: loginDataJson,
);


        if (response.statusCode == 200) {
          // Login successful
          // Navigate to the PredictionForm screen
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PredictionFormPage()),
          );
        } else {
          // Login failed
          // Display an error message
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('Login Error'),
              content: Text('Invalid email or password. Please try again.'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('OK'),
                ),
              ],
            ),
          );
        }
      } catch (error) {
        print('Error occurred during login: $error');
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Login Error'),
            content: Text('An error occurred during login. Please try again.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('OK'),
              ),
            ],
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 5,
                        blurRadius: 10,
                        offset: const Offset(
                            0, 3), // changes the position of shadow
                      ),
                    ],
                    borderRadius: BorderRadius.circular(70),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(73),
                    child: Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Image.network(
                        'https://tinypic.host/images/2023/04/27/smartfarmer.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 70.0),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    
                    labelText: 'Email',
                    labelStyle: TextStyle(color: Colors.grey[900]),
                    //hintText: 'Enter your email',
                    border: InputBorder.none,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                    prefixIcon: Icon(Icons.email),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _email = value!;
                  },
                ),
              ),
              SizedBox(height: 20.0),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(color: Colors.grey[900]),
                     focusColor: Colors.green,
                 hoverColor: Colors.green,
                  fillColor: Colors.green,

                    //hintText: 'Enter your password',
                    border: InputBorder.none,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                      },
                    ),
                  ),
                  obscureText: !_isPasswordVisible,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _password = value!;
                  },
                ),
              ),
              SizedBox(height: 50.0),
              Container(
                width: double.infinity,
                child: SizedBox(
                  width: 200.0, // Specify the desired width
                  height: 50.0, // Specify the desired height
                  child: ElevatedButton(
                    onPressed: _submitForm,
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 6, 75, 8), // Set the button color to green
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            9.0), // Specify the desired border radius
                      ),
                      textStyle: TextStyle(
                        fontSize: 18.0, // Specify the desired font size
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    child: Text('Login'),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account?"),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Color.fromARGB(255, 8, 116, 12), // Set the color to green
                        fontWeight: FontWeight.bold,
                        //decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
