import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/routes.dart';
import 'menu_button.dart';

class MenuButtonsSection extends StatelessWidget {
  const MenuButtonsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Column(
      children: [
        MenuButton(
          function: () {
            Navigator.pushReplacementNamed(context, Routes.gameViewRoute);
          },
          width: 240.w,
          height: 50.h,
          backgroundColor: Colors.black,
          borderRadius: 30.sp,
          child: const Text(
            'Get Start',
            style: TextStyle(fontSize: 25, color: Colors.white),
          ),
        ),
      ],
    ));
  }
}
