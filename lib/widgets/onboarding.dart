// this is buildpage onboarding widget

import 'package:flutter/material.dart';

Widget buildPage({
  required Color color,
  required String urlImage,
  required String title,
  required String subtitle,
}) =>
    Container(
      padding: const EdgeInsets.only(bottom: 3),
      color: color,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            urlImage,
            fit: BoxFit.cover,
            width: double.infinity,
            height: 300,
          ),
          const SizedBox(
            height: 40,
          ),
          Text(
            title,
            style: TextStyle(
                fontSize: 36,
                color: Colors.teal.shade800,
                fontWeight: FontWeight.w800),
          ),
          const SizedBox(
            height: 24,
          ),
          Text(
            subtitle,
            style: TextStyle(
                fontSize: 20,
                color: Colors.teal.shade800,
                fontWeight: FontWeight.w800),
          ),
        ],
      ),
    );
