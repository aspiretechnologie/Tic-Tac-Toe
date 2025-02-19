import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/constants/app_constants.dart';
import '/core/network_manager.dart';
import '/core/network_result.dart';

import '../constants/app_assets.dart';
import '../constants/app_theme.dart';
import '../core/service/navigation_service.dart';
import '../locator.dart';
import '../widget/home_view/menu_buttons_section.dart';
import '../widget/home_view/settings_fab_button.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late final NetworkManager _networkManager;
  NetworkResult? _networkResult;
  late final NavigationService _navigationService = getIt<NavigationService>();

  @override
  void initState() {
    super.initState();
    _networkManager = NetworkManager();
    _networkManager.handleNetworkChange((result) {
      setState(() {
        _networkResult = result;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* floatingActionButton: SettingsFabButton(
        backgroundColor: purple,
        function: () {
          _navigationService.showSettingsPopup();
        },
        child: const Icon(
          Icons.settings,
          color: Colors.white,
        ),
      ),*/
      body: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [linearColorOne, linearColorTwo]),
          image: DecorationImage(
            image: AssetImage(AppAsset.backgroundImage),
            fit: BoxFit.fill,
          ),
        ),

        // Child
        child: Column(
          children: [
            height67,
            SizedBox(
                width: 173.w, height: 173.h, child: Image.asset(AppAsset.logo)),
            _networkResult == NetworkResult.off
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Offline Mode',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      IconButton(
                          onPressed: () {
                            // todo little info dialog with smart dialog package
                          },
                          icon: const Icon(
                            Icons.info,
                            color: white,
                          ))
                    ],
                  )
                : const SizedBox(),
            height56,
            const MenuButtonsSection()
          ],
        ),
      ),
    );
  }
}
