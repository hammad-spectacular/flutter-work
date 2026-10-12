import 'package:flutter/material.dart';

class ShrinkAndRevealWrapper extends StatefulWidget {
  const ShrinkAndRevealWrapper({super.key});

  @override
  State<ShrinkAndRevealWrapper> createState() => _ShrinkAndRevealWrapperState();
}

class _ShrinkAndRevealWrapperState extends State<ShrinkAndRevealWrapper> {
  // Flag to trigger the animation
  bool _isShrunk = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // ---------------------------------------------------------
          // LAYER 1: YOUR ORIGINAL PAGE (Sits at the bottom, revealed last)
          // ---------------------------------------------------------
          Container(
            color: Colors.white, // Background of your original page
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    '🎉 Welcome to your Original Page!',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black87),
                  ),
                  SizedBox(height: 10),
                  Text('The transition revealed this screen underneath.'),
                ],
              ),
            ),
          ),

          // ---------------------------------------------------------
          // LAYER 2: THE NEW PAGE (Sits on top, shrinks and fades out)
          // ---------------------------------------------------------
          AnimatedOpacity(
            opacity: _isShrunk ? 0.0 : 1.0, // Fades out completely when true
            duration: const Duration(milliseconds: 600), // Speed of fade
            child: AnimatedScale(
              scale: _isShrunk ? 0.75 : 1.0, // Shrinks down to 75% size when true
              duration: const Duration(milliseconds: 600), // Speed of shrink
              curve: Curves.easeInOut,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blueAccent, // Background of your new page
                  // Optional: adds rounded corners to the new page as it shrinks
                  borderRadius: BorderRadius.circular(_isShrunk ? 24 : 0),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'This is the New Page',
                        style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.white, foregroundColor: Colors.blueAccent),
                        onPressed: () {
                          // Trigger the shrink and fade effect
                          setState(() {
                            _isShrunk = true;
                          });
                        },
                        child: const Text('Shrink & Reveal Original Page'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}