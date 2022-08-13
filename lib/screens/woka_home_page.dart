import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:woka/widgets/onboarding_pages.dart';

class WokaHomePage extends StatelessWidget {
  const WokaHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(
          onPressed: () async {
            final prefs = await SharedPreferences.getInstance();
            prefs.setBool("showHome", false);
            // ignore: use_build_context_synchronously
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => const OnboardingPages()));
          },
          icon: const Icon(Icons.logout),
        ),
      ]),
      backgroundColor: Colors.red,
      body: const Center(child: Text("WokaHomePage")),
    );
  }
}
