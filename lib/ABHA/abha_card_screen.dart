import 'package:flutter/material.dart';

import '../Abha_Registration_Screen/AbhaRegistrationScreen.dart';
import '../signin_signup/login_screen.dart';
import 'abha_login.dart';

class ABHACreationScreen extends StatefulWidget {
  const ABHACreationScreen({Key? key}) : super(key: key);

  @override
  State<ABHACreationScreen> createState() => _ABHACreationScreenState();
}

class _ABHACreationScreenState extends State<ABHACreationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:  const Text('Create ABHA Number',
            style: TextStyle(
              fontSize: 18, // Adjust font size
              fontWeight: FontWeight.bold, // Make text bold
            )),
        backgroundColor: const Color(0xFF243B6D),
        foregroundColor: Colors.white,),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 16),
              const Text(
                'Create Ayushman Bharat \n Health Account - ABHA Number',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFF243B6D),
                  fontWeight: FontWeight.bold
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Creating Indias Digital Health Mission',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 30),
              Row(
                children: [
                  Expanded(
                    child: _buildOptionCard(
                      context,
                      'assets/adharcardBT.png',
                      'Create your ABHA number using',
                      'Aadhaar Card',
                          () {
                        // Handle Aadhaar option
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => AbhaRegistrationScreen()),
                            );
                      },
                    ),
                  ),
                  // const SizedBox(width: 20),
                  // Expanded(
                  //   child: _buildOptionCard(
                  //     context,
                  //     'assets/drivingBT.png',
                  //     'Create your ABHA number using',
                  //     'Driving Licence',
                  //         () {
                  //       // Handle Driving License option
                  //     },
                  //   ),
                  // ),
                ],
              ),
              const SizedBox(height: 16,),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Already have account? ',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // Handle login
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const LoginScreen()),
                      );
                    },
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.orange,
                        fontWeight: FontWeight.bold,
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

  Widget _buildOptionCard(
      BuildContext context,
      String iconPath,
      String title,
      String subtitle,
      VoidCallback onTap,
      ) {

    double cardWidth = MediaQuery.of(context).size.width * 0.4; // 40% of screen width
    double cardHeight = 220.0; // Fixed height, adjust as needed
    return Container(
      width: cardWidth, // Set the width here
      height: cardHeight, // Set the height here
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  iconPath,
                  height: 100,
                  width: 100,
                ),
                const SizedBox(height: 10),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF1A237E),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.orange,
                    fontWeight: FontWeight.bold,
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