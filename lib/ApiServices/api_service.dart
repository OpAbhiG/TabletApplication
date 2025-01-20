import 'dart:convert';
// import 'dart:js_interop';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
// import 'package:login_registration_screen/APIServices/base_api.dart';
// import '../models/model.dart';
// import 'model.dart';
import 'package:http/http.dart' as http;

// import '../screens/login_screen.dart';
import '../signin_signup/model.dart';
import 'base_api.dart';

class ApiServices{

  // Future<LoginModel?> loginWithModel( String email, String password)async{
  //
  //   try{
  //     var url = Uri.parse("$baseapi/user/login");
  //     var response = await http.post(url, body: {
  //       "email": email,
  //       "password": password
  //     });
  //
  //
  //     if(response.statusCode == 200 || response.statusCode==201){
  //       LoginModel model = LoginModel.fromJson(jsonDecode(response.body));
  //       return model;
  //     }
  //   }catch (e){
  //     print(e);
  //   }
  //   return null;
  // }




  // Future<LoginModel?> loginWithModel(String email, String password) async {
  //   try {
  //     var url = Uri.parse("http://api.bharatteleclinic.co/user/login");
  //     var response = await http.post(url, body: {
  //       "email": email,
  //       "password": password
  //     });
  //
  //     if (response.statusCode == 200) {
  //       // Decode the response
  //       Map<String, dynamic> responseBody = jsonDecode(response.body);
  //
  //
  //       // await saveToken(token);
  //       // print(response.body);
  //
  //       // Extract the token from the response
  //       String? accessToken = responseBody['user_data']['access_token'];
  //
  //       // print("hdgcvjhevffjhvberjhv");
  //
  //       // print(accessToken);
  //
  //       if (accessToken != null && accessToken.isNotEmpty) {
  //         // Save token dynamically in Hive
  //         var box = await Hive.openBox('userBox');
  //         await box.put('authToken', accessToken);
  //         print('Token saved: $accessToken');
  //       } else {
  //         print('Access token is missing in the response.');
  //       }
  //
  //       // Convert the response to a LoginModel
  //       LoginModel model = LoginModel.fromJson(responseBody);
  //       return model;
  //     } else {
  //       print('Failed to log in, status code: ${response.statusCode}');
  //     }
  //   } catch (e) {
  //     print('Error occurred: $e');
  //   }
  //   return null;
  // }


  Future<LoginModel?> loginWithModel(String email, String password,BuildContext context) async {
    try {
      var url = Uri.parse("$baseapi/user/login");
      var response = await http.post(url, body: {
        "email": email,
        "password": password,
        "user_type":"3"
      });

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Container(
              alignment: Alignment.center,
              height: 12, // Adjust height if needed
              child: Center(
                child: Text(
                  'Login successfully',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            // backgroundColor: Colors.black.withOpacity(0.7), // Transparent black
            backgroundColor: Color(0xFF40BF78), // Background color
            behavior: SnackBarBehavior.floating, // Floating SnackBar
            margin: EdgeInsets.symmetric(horizontal: 120, vertical: 10), // Adjust padding
            elevation: 0, // Remove shadow
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5), // Rounded corners
            ),
            duration: Duration(seconds: 2), // Visible for 2 seconds
          ),
        );
        // Decode the response
        Map<String, dynamic> responseBody = jsonDecode(response.body);


        // // Check if the user_type is 3
        // if (responseBody['user_data']['user_type'] != 3) {
        //   print('Invalid username or password');
        //   // You can show a message to the user here (e.g., using a Snackbar)
        //   return null; // Return null if user_type is not 3
        // }

        // Check if the user_type is 3
        if (responseBody['user_data']['user_type'] != 3) {
          // Display invalid username or password message in UI
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Invalid username or password'),
            ),
          );
          return null; // Return null if user_type is not 3
        }



        // await saveToken(token);
        print(response.body);

        // Extract the token from the response
        String? accessToken = responseBody['user_data']['access_token'];

        // print("hdgcvjhevffjhvberjhv");

        // print(accessToken);

        // if (accessToken != null && accessToken.isNotEmpty) {
        //   // Save token dynamically in Hive
        //   var box = await Hive.openBox('userBox');
        //   await box.put('authToken', accessToken);
        //   print('Token saved: $accessToken');
        // } else {
        //   print('Access token is missing in the response.');
        // }

        // Convert the response to a LoginModel
        LoginModel model = LoginModel.fromJson(responseBody);
        return model;
      } else {
        print('Failed to log in, status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error occurred: $e');
    }
    return null;
  }

  // Future<void> logout(BuildContext context) async {
  //   var box = Hive.box('userBox');
  //   await box.delete('authToken');
  //   print('Token cleared.');
  //   Navigator.of(BuildContext as BuildContext).pushAndRemoveUntil(
  //     MaterialPageRoute(builder: (context) => const LoginScreen()),
  //         (route) => false,
  //   );
  // }





  Future<void>RegistrationScreen(
      String email,
      String password,
      String fname,
      String lname ,
      String gender,
      String dob,
      String aadhar_no,
      String number,

      ) async {
    try {
      var url = Uri.parse("$baseapi/user/create_user");
      var response = await http.post(
        url,
        body: {
          "user_type":"3",
          "email": email,
          "password": password,
          "fname":fname,
          "lname":lname,
          "gender":gender,
          "dob":dob,
          "aadhar_no":aadhar_no,
          "number":number,


        },
      );
      if (response.statusCode != 200) {
        throw Exception('Sign up failed: ${response.body}');
      }else{

      }
    } catch (e) {
      print('Error during sign up: $e');
      throw e;
    }
  }


// Future<RegistrationModel?> registerUser({
//   required String firstName,
//   required String lastName,
//   required String gender,
//   required int age,
//   required String aadhaarNumber,
//   required String mobileNumber,
//   required String email,
//   required String password,
// }) async {
//   var url = Uri.parse("$baseapi/user/create_user");
//
//   try {
//     var response = await http.post(
//       url,
//       body: {
//         "first_name": firstName,
//         "last_name": lastName,
//         "gender": gender,
//         "age": age.toString(),
//         "aadhaar_number": aadhaarNumber,
//         "mobile_number": mobileNumber,
//         "email": email,
//         "password": password,
//       },
//     );
//
//     if (response.statusCode == 200 || response.statusCode == 201) {
//       return RegistrationModel.fromJson(jsonDecode(response.body));
//     } else {
//       print("Error: ${response.statusCode}");
//     }
//   } catch (e) {
//     print("Exception: $e");
//   }
//
//   return null;
// }

// Future<dynamic> loginWithOutModel( String email, String password)async{
//
//   try{
//     var url = Uri.parse("https://reqres.in/api/login");
//     var response = await http.post(url, body: {
//       "email": email,
//       "password": password
//     });
//
//
//     if(response.statusCode == 200){
//       final model = jsonDecode(response.body);
//       return model;
//     }
//   }catch (e){
//     print(e);
//   }
// }


}