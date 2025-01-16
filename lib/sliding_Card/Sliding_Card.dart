import 'package:flutter/material.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';

import '../ABHA/abha_card_screen.dart';
import '../Abha_Registration_Screen/AbhaRegistrationScreen.dart';

class DemoApp extends StatefulWidget {
  @override
  _DemoAppState createState() => _DemoAppState();
}

class _DemoAppState extends State<DemoApp> {
  final List<Map<String, dynamic>> specialists = [
    {
      "title": "General Physician",
      "price": "₹199/-",
    },
    {
      "title": "Pediatrician",
      "price": "₹199/-",
    },
    {
      "title": "Child Specialist",
      "price": "₹199/-",
    },
    {
      "title": "Cardiologist",
      "price": "₹199/-",
    },
    {
      "title": "Oncologist",
      "price": "₹199/-",
    },
    {
      "title": "Dermatologist",
      "price": "₹199/-",
    },
    {
      "title": "Cardio thoracic Surgeon",
      "price": "₹199/-",
    },
  ];
  // int focusedIndex = 0; // Tracks the currently focused item

  Widget _buildItemList(BuildContext context, int index) {
    if (index == specialists.length) {
      return const Center(child: CircularProgressIndicator());
    }

    return Container(
      width: 150,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15), // Rounded corners
              boxShadow: [
                const BoxShadow(
                  color: Colors.black12,
                  blurRadius: 8,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${specialists[index]['title']}',
                  style: const TextStyle(fontSize: 12.0, color: Colors.black,fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                Text(
                  '${specialists[index]['price']}',
                  style: const TextStyle(fontSize: 12.0, color: Colors.grey,fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30), // Rounded button corners
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 12,
                    ),
                    elevation: 8,
                  ),
                  onPressed: () {
                    // Add your navigation or functionality here
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  ABHACreationScreen()),
                    );
                  },
                  child: const Text(
                    'TALK NOW',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],

            ),
          ),

        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E3F8C), // Dark blue background
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: ScrollSnapList(
                itemBuilder: _buildItemList,
                itemSize: 150,
                dynamicItemSize: true,
                onReachEnd: () {
                  print('Reached the end of the list!');
                },
                itemCount: specialists.length,
                onItemFocus: (index) {
                  setState(() {
                    // focusedIndex = index;
                  });
                  print('Focused on item: ${specialists[index]}');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}