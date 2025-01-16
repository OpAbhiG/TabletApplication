import 'package:flutter/material.dart';
import '../Connecting_screen/ConnectingScreen.dart';
import '../sliding_Card/Sliding_Card.dart';

class TeleClinicCards extends StatefulWidget {
  const TeleClinicCards({Key? key}) : super(key: key);

  @override
  State<TeleClinicCards> createState() => _TeleClinicCardsState();
}

class _TeleClinicCardsState extends State<TeleClinicCards> {
  void _handleNavigation(BuildContext context, bool isDoctor) {
    if (isDoctor) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>  DemoApp()),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ConnectingScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1e3a8a), // Dark blue background
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 32),
              // Logo Image
              Image.asset(
                'assets/btlogo.png',
                height: 100,
                fit: BoxFit.contain,
                alignment: Alignment.center,
              ),
              const SizedBox(height: 48),
              // Cards Container
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Doctor Card
                    _buildCard(
                      image: 'assets/doctor.png',
                      title: 'Doctor?',
                      price: '₹199/-',
                      isDoctor: true,
                    ),
                    const SizedBox(width: 16),
                    // Pharmacist Card
                    _buildCard(
                      image: 'assets/phy.png',
                      title: 'PHARMACIST?',
                      price: 'FREE!',
                      isDoctor: false,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCard({
    required String image,
    required String title,
    required String price,
    required bool isDoctor,
  }) {
    return Container(
      width: 200,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          // Image
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: Image.asset(
              image,
              height: 200,
              width: 200,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 12),
          // Title
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
          const SizedBox(height: 8),
          // Price
          Text(
            price,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
          const SizedBox(height: 12),
          // Button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child:
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
              onPressed: () => _handleNavigation(context, isDoctor),
              child: const Text(
                'TALK NOW',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}