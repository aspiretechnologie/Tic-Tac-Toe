import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/widget/game_view/game_list.dart';

import '../../constants/app_theme.dart';

class GameContainer extends StatelessWidget {
  const GameContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350.w,
      height: 350.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      child: const GameList(),
    );
  }
}
