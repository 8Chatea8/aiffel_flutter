import 'package:flutter/material.dart';
import 'package:tiktok/app/data/service/video_controll.dart';
import 'package:tiktok/app/view/post/videoFeed.dart';

import '../mypage/mypage.dart';
import '../upload/upload.dart';

Widget currentScreen() {
  ViedeoControll videoControl = ViedeoControll();
  switch (videoControl.currentScreen) {
    case 0:
      return feedVideos();
    case 1:
      return ProfileScreen();
    case 2:
      return UploadScreen();
    default:
      return feedVideos();
  }
}