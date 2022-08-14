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
      backgroundColor: Colors.green.shade600,
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
                color: Colors.red.shade700,
                urlImage: 'assets/images/capenter1.jpg',
                title: "Service",
                logo: 'assets/images/woka_logo_white_bkgrnd.png',
                subtitle:
                    "Welcome to WOKA where you can specify your profession and access clients who want your service."),
            buildPage(
                color: Colors.yellow.shade800,
                urlImage: 'assets/images/cleaner_unsplash.jpeg',
                title: "Client",
                logo: 'assets/images/woka_logo_white_bkgrnd.png',
                subtitle:
                    "Welcome to WOKA where you can find professionals that will provide you services requested at your location"),
            buildPage(
                color: Colors.green.shade600,
                urlImage: 'assets/images/delivery1.png',
                title: "Welcome",
                logo: 'assets/images/woka_logo_white_bkgrnd.png',
                subtitle:
                    "Welcome to WOKA where you can find professionals who will help you with your daily requests for services"),
          ],
        ),
      ),
      bottomSheet: isLastPage
          ? Container(
              color: Colors.green.shade600,
              width: double.infinity,
              padding: const EdgeInsets.only(
                  top: 10, bottom: 10, left: 100, right: 100),
              child: TextButton(
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  primary: Colors.black,
                  backgroundColor: Colors.red.shade800,
                  maximumSize: const Size.fromHeight(80),
                ),
                onPressed: () async {
                  final prefs = await SharedPreferences.getInstance();
                  prefs.setBool("showHome", true);
                  // ignore: use_build_context_synchronously
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const WokaHomePage()));
                },
                child: const Text(
                  "Get Started",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.italic,
                    fontSize: 22,
                  ),
                ),
              ),
            )
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
                    child: const Text(
                      "SKIP",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.italic,
                          color: Colors.black,
                          fontSize: 22),
                    ),
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
                    child: const Text(
                      "NEXT",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.italic,
                          color: Colors.black,
                          fontSize: 22),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
