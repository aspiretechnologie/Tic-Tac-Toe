import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import '/widget/game_view/game_dialog/game_dialog_buttons.dart';

import '../../../constants/app_assets.dart';
import '../../../constants/app_constants.dart';
import 'game_dialog_score_container.dart';

class GameDialogContent extends StatelessWidget {
  const GameDialogContent({Key? key, this.isDraw = false}) : super(key: key);
  final bool isDraw;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Column(
        children: [
          if (isDraw) const SizedBox(height: 15),

          // Lottie Gif
          if (isDraw)
            Flexible(
              child: Lottie.asset(
                AppAsset.drawLogo,
                repeat: false,
                width: 150.w,
                height: 150.h,
              ),
            )
          else
            Flexible(
              child: Lottie.asset(
                AppAsset.winLogo,
                repeat: false,
                width: 150.w,
                height: 150.h,
              ),
            ),

          // Result Text
          Text(
            isDraw ? 'Draw!' : 'You Win!',
            style: Theme.of(context).textTheme.titleSmall,
          ),
          const SizedBox(height: 32),
          const GameDialogScoreContainer(),
          const SizedBox(height: 32),
          const GameDialogButtons(),
        ],
      ),
    );
  }
}
