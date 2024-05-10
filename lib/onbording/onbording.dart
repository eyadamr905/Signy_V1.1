// ignore_for_file: camel_case_types
import 'package:flutter/material.dart';
import '../login/login.dart';
class welcom extends StatefulWidget {
  const welcom({super.key});

  @override
  State<welcom> createState() => _welcomState();
}

class _welcomState extends State<welcom> {
  PageController pageController = PageController(initialPage: 0);
  int currentPage = 0;

  bool last=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff221F1E),
      body: Stack(
        children: [
          PageView(
            controller: pageController,
            onPageChanged: (index) {
              setState(() {
                currentPage = index;
              });
            },
            children: [
              _buildPage("assets/lang.png",
                  "Hello how can we help you"),
              _buildPage("assets/first.png",
                  ""),
              _buildPage("assets/hands.png",
                  ""),
            ],
          ),
          Positioned(
            bottom: 20,
            left: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: _buildPageDots(),
            ),
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: GestureDetector(
              onTap: () {
                if (currentPage < 2) {
                  pageController.animateToPage(
                    currentPage + 1,
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.decelerate,
                  );
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const signin(),
                    ),
                  );
                }
              },
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.white,
                ),
                child: const Center(
                  child: Icon(
                    Icons.arrow_forward_ios_sharp,
                    color: Colors.black,
                    size: 40.0,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildPageDots() {
    List<Widget> dots = [];
    for (int i = 0; i < 3; i++) {
      dots.add(
        Padding(
          padding: const EdgeInsets.only(right: 5),
          child: Container(
            width:
                i == currentPage ? 12 : 8, // Adjust size based on currentPage
            height: i == currentPage ? 12 : 8,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: i == currentPage ? Colors.white : Colors.grey,
            ),
          ),
        ),
      );
    }
    return dots;
  }

  Widget _buildPage(String imagePath, String text) {
    return Column(
      children: [
        const SizedBox(height: 170),
        Image.asset(imagePath),
        const SizedBox(height: 40),
        Center(
          child: Text(
            text,
            style: const TextStyle(color: Colors.white),
          ),
        ),
        const SizedBox(height: 200),
      ],
    );
  }
}