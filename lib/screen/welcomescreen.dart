import 'package:flutter/material.dart';
import 'dart:ui'; // For ImageFilter for blur effect
import 'package:nft/screen/home_screen.dart'; // این خط را اصلاح کردیم!

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // MediaQuery is used to access screen dimensions (width and height).
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Card dimensions
    final cardWidth = 306.31;
    final cardHeight = 191.02;

    return Scaffold(
      // Scaffold is a basic widget for screen structure.
      body: Stack(
        // Stack allows us to place widgets on top of each other.
        children: [
          // Background with full-screen image
          Container(
            width: double.infinity, // Full screen width
            height: double.infinity, // Full screen height
            decoration: BoxDecoration(
              image: DecorationImage(
                // Make sure the path 'assets/images/b.png' is correct and the image is defined in pubspec.yaml.
                image: AssetImage('assets/images/b.png'),
                fit: BoxFit.cover, // Image covers the entire container space
              ),
            ),
          ),
          // "Welcome to NFT Marketplace" text
          Positioned(
            // Position from the top of the screen (5% of screen height for higher placement)
            top: screenHeight * 0.05,
            // Position from the left of the screen (10% of screen width for rightward shift)
            left: screenWidth * 0.10,
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start, // Align text to the left
              children: [
                Text(
                  'Welcome to',
                  style: TextStyle(
                    color: Colors.white, // Text color
                    fontSize: 32, // Font size
                    fontWeight: FontWeight.bold, // Font weight
                  ),
                ),
                Text(
                  'NFT Marketplace',
                  style: TextStyle(
                    color: Colors.white, // Text color
                    fontSize: 32, // Font size
                    fontWeight: FontWeight.bold, // Font weight
                  ),
                ),
              ],
            ),
          ),
          // New card (Glassmorphism card)
          Positioned(
            // Calculate horizontal position for centering
            left: (screenWidth - cardWidth) / 2,
            // Calculate vertical position for lower and responsive placement
            // 0.65 means 65% of screen height from the top.
            top: screenHeight * 0.65,
            child: ClipRRect(
              // ClipRRect is used to apply rounded corners to its content (including blur).
              borderRadius: BorderRadius.circular(27.03), // Corner radius
              child: BackdropFilter(
                // BackdropFilter is used to apply a filter (like blur) to the underlying widgets.
                filter: ImageFilter.blur(
                    sigmaX: 10,
                    sigmaY: 10), // Horizontal and vertical blur amount
                child: Container(
                  width: cardWidth, // Card width
                  height: cardHeight, // Card height
                  // Adjust inner padding of the card to fix overflow issues.
                  padding:
                      EdgeInsets.symmetric(horizontal: 27.03, vertical: 23.03),
                  decoration: BoxDecoration(
                    // Translucent color for frosted glass effect
                    color: Colors.white.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(
                        27.03), // Rounded corners for the container itself
                    border: Border.all(
                      // Border around the card for glass effect
                      color: Colors.white
                          .withOpacity(0.2), // Border color with transparency
                      width: 0.9, // Border thickness
                    ),
                  ),
                  child: Column(
                    // Content inside the card is arranged vertically.
                    mainAxisAlignment:
                        MainAxisAlignment.start, // Content starts from the top
                    crossAxisAlignment: CrossAxisAlignment
                        .center, // Align items horizontally centered
                    children: [
                      Text(
                        'Explore and Mint NFTs',
                        textAlign: TextAlign.center, // Center text horizontally
                        style: TextStyle(
                          color: Colors.white, // Text color
                          fontSize: 20, // Font size
                          fontWeight: FontWeight.bold, // Font weight
                        ),
                      ),
                      SizedBox(
                          height: 8), // Space between title and description
                      Text(
                        'You can buy and sell the NFTs of the best artists in the world.',
                        textAlign: TextAlign.center, // Center text horizontally
                        style: TextStyle(
                          color: Colors.white
                              .withOpacity(0.7), // Text color with transparency
                          fontSize: 14, // Font size
                        ),
                      ),
                      SizedBox(height: 20), // Space before the button
                      Container(
                        // Container to apply gradient to the button
                        width: 198.20, // New button width
                        height: 45.53, // New button height
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              15), // Rounded corners for button container
                          gradient: LinearGradient(
                            // Gradient colors for button background
                            colors: [
                              Color(0xFF8A2BE2), // Purple color
                              Color(0xFF4B0082), // Indigo color
                            ],
                            begin: Alignment
                                .topLeft, // Gradient starts from top-left
                            end: Alignment
                                .bottomRight, // Gradient ends at bottom-right
                          ),
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            // Navigate to the HomeScreen when the button is pressed.
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomeScreen()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors
                                .transparent, // Button background is transparent to show gradient
                            shadowColor:
                                Colors.transparent, // Remove button shadow
                            padding: EdgeInsets.symmetric(
                                vertical:
                                    0), // Inner button padding (zero so Container controls height)
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  15), // Rounded button corners
                            ),
                          ),
                          child: Text(
                            'Get started now',
                            style: TextStyle(
                              color: Colors.white, // Button text color
                              fontSize: 16, // Button font size
                              fontWeight: FontWeight.bold, // Button font weight
                            ),
                          ),
                        ),
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
