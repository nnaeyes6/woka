import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:woka/screens/woka_home_page.dart';
import 'package:woka/widgets/onboarding.dart';

class OnboardingPages extends StatefulWidget {
  const OnboardingPages({Key? key}) : super(key: key);

  @override
  State<OnboardingPages> createState() => _WokaPageState();
}

class _WokaPageState extends State<OnboardingPages> {
  final pageViewController = PageController();
  bool isLastPage = false;
  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade700,
      body: Container(
        padding: const EdgeInsets.only(bottom: 20),
        child: PageView(
          controller: pageViewController,
          onPageChanged: (index) {
            setState(() {
              isLastPage = index == 2;
            });
          },
          children: [
            buildPage(
                color: Colors.green.shade200,
                urlImage: 'assets/images/capenter1.jpg',
                title: "WOKA",
                subtitle:
                    "Welcome to WOKA where you can find professionals who will help you with your daily requests for services"),
            buildPage(
                color: Colors.red.shade200,
                urlImage: 'assets/images/cleaner_unsplash.jpeg',
                title: "WOKA",
                subtitle:
                    "Welcome to WOKA where you can find professionals who will help you with your daily requests for services"),
            buildPage(
                color: Colors.blue.shade200,
                urlImage: 'assets/images/plumber_unsplash.jpg',
                title: "WOKA",
                subtitle:
                    "Welcome to WOKA where you can find professionals who will help you with your daily requests for services"),
          ],
        ),
      ),
      bottomSheet: isLastPage
          ? TextButton(
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                primary: Colors.white70,
                backgroundColor: Colors.teal.shade800,
                maximumSize: const Size.fromHeight(80),
              ),
              onPressed: () async {
                final prefs = await SharedPreferences.getInstance();
                prefs.setBool("showHome", true);
                // ignore: use_build_context_synchronously
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const WokaHomePage()));
              },
              child: const Text("Get Started"))
          : Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      pageViewController.jumpToPage(2);
                    },
                    child: const Text("Skip"),
                  ),
                  Center(
                    child: SmoothPageIndicator(
                      controller: pageViewController,
                      count: 3,
                      effect: WormEffect(
                          spacing: 16,
                          dotColor: Colors.yellow.shade800,
                          activeDotColor: Colors.red),
                      onDotClicked: (index) => pageViewController.animateToPage(
                          index,
                          duration: const Duration(microseconds: 500),
                          curve: Curves.easeIn),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      pageViewController.nextPage(
                          duration: const Duration(microseconds: 500),
                          curve: Curves.easeInOut);
                    },
                    child: const Text("Next"),
                  ),
                ],
              ),
            ),
    );
  }
}
