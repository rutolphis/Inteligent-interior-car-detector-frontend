import 'package:flutter/material.dart';
import 'package:gui_flutter/pages/home/widgets/car_stats.dart';
import 'package:gui_flutter/pages/home/widgets/map.dart';
import 'package:gui_flutter/pages/home/widgets/speed.dart';
import 'package:gui_flutter/pages/home/widgets/stats_item.dart';
import 'package:gui_flutter/pages/home/bluetooth/bluetooth_connect_dialog.dart';
import 'package:gui_flutter/widgets/button.dart';
import 'package:gui_flutter/widgets/image_container.dart';
import 'package:gui_flutter/pages/home/widgets/home_container.dart';
import 'package:gui_flutter/widgets/page.dart';

import 'package:gui_flutter/pages/home/widgets/connect_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  void _showBluetoothDialog(BuildContext context) {
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            BluetoothConnectDialog(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          // Define your animation here
          var begin = 0.0;
          var end = 1.0;
          var curve = Curves.ease;

          var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          var opacityAnimation = animation.drive(tween);

          return FadeTransition(
            opacity: opacityAnimation,
            child: child,
          );
        },
        fullscreenDialog: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PageWidget(
        button: ConnectButtonWidget(
          onTap: () => _showBluetoothDialog(context),
        ),
        title: "Dashboard",
        body: const Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SpeedWidget(),
                  SizedBox(
                    height: 40,
                  ),
                  MapWidget()
                ],
              ),
            ),
            SizedBox(
              width: 40,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ImageContainerWidget(
                    height: 220,
                    backgroundImage: "assets/images/test_photo.jpg",
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  CarStatsWidget(),
                ],
              ),
            )
          ],
        ));
  }
}
