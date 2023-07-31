import 'package:flutter/material.dart';
import 'package:tiktok/app/view/post/currentScreen.dart';
import 'package:tiktok/app/view/post/widgets/bottom_bar.dart';

Widget scrollPost() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      Expanded(child: currentScreen()),
      BottomBar(),
    ],
  );
}