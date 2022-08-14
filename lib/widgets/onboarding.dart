// this is buildpage onboarding widget

import 'package:flutter/material.dart';

Widget buildPage({
  required Color color,
  required String urlImage,
  required String logo,
  required String title,
  required String subtitle,
}) =>
    SingleChildScrollView(
      child: Stack(
        children: [
          Image.asset(
            urlImage,
            fit: BoxFit.cover,
            width: double.infinity,
            height: 390,
          ),
          Column(
            children: [
              const SizedBox(
                height: 380,
              ),
              Container(
                padding: const EdgeInsets.only(bottom: 350),
                color: color,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding:
                          const EdgeInsets.only(left: 30, right: 30, top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                title,
                                style: const TextStyle(
                                    fontSize: 36, fontWeight: FontWeight.w800),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 24,
                          ),
                          Image.asset(
                            logo,
                            fit: BoxFit.cover,
                            width: 100,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Container(
                      padding: const EdgeInsets.only(right: 30, left: 30),
                      child: Text(
                        subtitle,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
