import 'package:flutter/material.dart';

import 'package:weather/domain/weather.dart';

import 'package:weather/precentation/homeScreen.dart';

class splash extends StatelessWidget {
  const splash({super.key});

  @override
  Widget build(BuildContext context) {
    gotoHomePage(context);
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: SizedBox(
                height: 250,
                width: 250,
                child: Image.asset(
                  "asset/—Pngtree—drizzle sunny weather forecast_1867896.png",
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const Text(
              "Weather",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.w900),
            )
          ],
        ),
      ),
    );
  }

  gotoHomePage(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 3));
    final data =
        await Weather.getCurretLocation(latitude: 60.23, logitude: 78.5);
    // ignore: use_build_context_synchronously
    Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (context) {
        return HomeScreen(data: data);
      },
    ));
  }
}
