// Create a registration stepper widget
import 'package:flutter/material.dart';

class AbhaRegistrationScreen extends StatefulWidget {
  @override
  _AbhaRegistrationScreenState createState() => _AbhaRegistrationScreenState();
}

class _AbhaRegistrationScreenState extends State<AbhaRegistrationScreen> {
  final int _currentStep = 0;
  final _formKey = GlobalKey<FormState>();
  String? aadhaarNumber;
  bool termsAccepted = true; //when declare false without check can not show next button

  // Controller for captcha input
  final TextEditingController _captchaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create ABHA Number Using Aadhaar'),
        elevation: 4,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Progress Indicator
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  _buildStepIndicator(1, 'Consent Collection', _currentStep >= 0),
                  _buildStepConnector(_currentStep >= 1),
                  _buildStepIndicator(2, 'Aadhaar Authentication', _currentStep >= 1),
                  _buildStepConnector(_currentStep >= 2),
                  _buildStepIndicator(3, 'Communication Details', _currentStep >= 2),
                  _buildStepConnector(_currentStep >= 3),
                  _buildStepIndicator(4, 'ABHA Address Creation', _currentStep >= 3),
                ],
              ),
            ),
            const SizedBox(height: 32),
            // Main Form
            Expanded(
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Aadhaar number',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 8),
                      // Aadhaar Input Fields
                      Row(
                        children: [
                          _buildAadhaarInput(),
                          const SizedBox(width: 8),
                          const Text('-'),
                          const SizedBox(width: 8),
                          _buildAadhaarInput(),
                          const SizedBox(width: 8),
                          const Text('-'),
                          const SizedBox(width: 8),
                          _buildAadhaarInput(),
                          const SizedBox(width: 16),
                          IconButton(
                            icon: const Icon(Icons.visibility_off),
                            onPressed: () {},
                          ),
                        ],
                      ),
                      // SizedBox(height: 16),
                      // // Mobile number info
                      // Container(
                      //   padding: EdgeInsets.all(12),
                      //   decoration: BoxDecoration(
                      //     color: Colors.blue.shade50,
                      //     borderRadius: BorderRadius.circular(8),
                      //   ),
                      //   child: Column(
                      //     crossAxisAlignment: CrossAxisAlignment.start,
                      //     children: [
                      //       Text(
                      //         'Please ensure that mobile number is linked with Aadhaar as it will be required for OTP authentication.',
                      //         style: TextStyle(color: Colors.blue.shade900),
                      //       ),
                      //       SizedBox(height: 8),
                      //       RichText(
                      //         text: TextSpan(
                      //           children: [
                      //             TextSpan(
                      //               text: 'If you do not have a mobile number linked, visit the nearest ',
                      //               style: TextStyle(color: Colors.blue.shade900),
                      //             ),
                      //             TextSpan(
                      //               text: 'ABDM participating facility',
                      //               style: TextStyle(
                      //                 color: Colors.orange,
                      //                 fontWeight: FontWeight.bold,
                      //               ),
                      //             ),
                      //             TextSpan(
                      //               text: ' and seek assistance.',
                      //               style: TextStyle(color: Colors.blue.shade900),
                      //             ),
                      //           ],
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      // SizedBox(height: 24),
                      // // Terms and Conditions
                      // Text(
                      //   'Terms and Conditions',
                      //   style: TextStyle(
                      //     fontSize: 18,
                      //     fontWeight: FontWeight.bold,
                      //   ),
                      // ),
                      // SizedBox(height: 16),
                      // Container(
                      //   padding: EdgeInsets.all(16),
                      //   decoration: BoxDecoration(
                      //     border: Border.all(color: Colors.grey.shade300),
                      //     borderRadius: BorderRadius.circular(8),
                      //   ),
                      //   child: Text(
                      //     'I, hereby declare that I am voluntarily sharing my Aadhaar number and demographic information issued by UIDAI, with National Health Authority (NHA) for the sole purpose of creation of ABHA number. I understand that my ABHA number can be used and shared for purposes as may be notified by ABDM from time to time including provision of healthcare services. Further, I am aware that my personal identifiable information (Name, Address, Age, Date of Birth, Gender and Photograph) may be made available to the entities working in the National Digital Health Ecosystem (NDHE) which inter alia includes stakeholders and entities such as healthcare professionals (e.g. doctors), facilities (e.g. hospitals, laboratories) and data fiduciaries (e.g. health programmes), which are registered with or linked to the Ayushman Bharat Digital Mission (ABDM), and various processes there under. I authorize NHA to use my Aadhaar number for performing Aadhaar based authentication with UIDAI as per the provisions of the Aadhaar (Targeted Delivery of Financial and other Subsidies, Benefits and Services) Act, 2016 for the aforesaid purpose. I understand that UIDAI will share my e-KYC details, or response of “Yes” with NHA upon successful authentication. I have been duly informed about the option of using other IDs apart from Aadhaar; however, I consciously choose to use Aadhaar number for the purpose of availing benefits across the NDHE. I am aware that my personal identifiable information excluding Aadhaar number / VID number can be used and shared for purposes as mentioned above. I reserve the right to revoke the given consent at any point of time as per provisions of Aadhaar Act and Regulations.',
                      //     style: TextStyle(fontSize: 14),
                      //   ),
                      // ),
                      // CheckboxListTile(
                      //   value: termsAccepted,
                      //   onChanged: (value) {
                      //     setState(() {
                      //       termsAccepted = value ?? false;
                      //     });
                      //   },
                      //   title: Text('I agree'),
                      //   controlAffinity: ListTileControlAffinity.leading,
                      //   contentPadding: EdgeInsets.zero,
                      // ),

                    ],
                  ),
                ),
              ),
            ),
            // Bottom Buttons
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  OutlinedButton(
                    onPressed: () {
                      Navigator.pop(context); // Close the dialog
                    },
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                    ),
                    child: const Text('Cancel'),
                  ),
                  const SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: termsAccepted ? () {
                      // in future i add API OTP
                    } : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                    ),
                    child: const Text('Next'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAadhaarInput() {
    return SizedBox(
      width: 80,
      child: TextFormField(
        decoration: const InputDecoration(
          hintText: '0000',
          border: OutlineInputBorder(),
          contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        ),
        keyboardType: TextInputType.number,
        maxLength: 4,
        buildCounter: (context, {required currentLength, required isFocused, maxLength}) => null,
      ),
    );
  }

  Widget _buildStepIndicator(int step, String label, bool isActive) {
    return Expanded(
      child: Column(
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isActive ? Colors.blue : Colors.grey.shade300,
            ),
            child: Center(
              child: Text(
                step.toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
              color: isActive ? Colors.blue : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStepConnector(bool isActive) {
    return Container(
      width: 40,
      height: 2,
      color: isActive ? Colors.blue : Colors.grey.shade300,
    );
  }
}