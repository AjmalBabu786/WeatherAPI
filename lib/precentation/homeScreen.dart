import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:weather/domain/weather.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key, required this.data});
  final Weather data;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Weather? weather;
  @override
  void initState() {
    weather = widget.data;
    super.initState();
  }

  TextEditingController mycontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 224, 207, 207),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Weather"),
        titleTextStyle: TextStyle(
            color: Colors.amber, fontSize: 25.sp, fontWeight: FontWeight.w900),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: mycontroller,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "search",
                          hintText: "search Weather"),
                    ),
                  ),
                  Container(
                    width: 50,
                    height: 60,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 182, 163, 105),
                        borderRadius: BorderRadius.circular(5)),
                    child: IconButton(
                        onPressed: () async {
                          weather =
                              await Weather.searchCity(city: mycontroller.text);
                          setState(() {});
                        },
                        icon: const Icon(Icons.search)),
                  ),
                ],
              ),
            ),
            Container(
              height: 250,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadiusDirectional.circular(20)),
              child: Column(
                children: [
                  Row(
                    children: [
                      Column(
                        children: [
                          Text(
                            weather!.location.isEmpty
                                ? "no result"
                                : weather!.location,
                            style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.amber),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 30),
                            child: Text(
                              " ${weather!.windDeg}°C",
                              style: const TextStyle(
                                  fontSize: 40, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      SizedBox(
                        height: 200,
                        width: 150,
                        child: Image.asset(
                          "asset/—Pngtree—drizzle sunny weather forecast_1867896.png",
                          fit: BoxFit.fill,
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Icon(Icons.water_sharp),
                      Text(
                        "${weather!.clouds}%",
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w700),
                      ),
                      const Icon(Icons.air),
                      Text(
                        " ${weather!.speed}km/hr",
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w700),
                      )
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadiusDirectional.circular(20)),
              height: 300,
              width: double.infinity,
              child: Stack(
                children: [
                  Column(
                    children: [
                      const SizedBox(
                        height: 50,
                        width: double.infinity,
                      ),
                      Row(
                        children: [
                          Container(
                            height: 230,
                            width: 180,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadiusDirectional.circular(20)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const Text("Sea Level"),
                                Text(
                                  " ${weather!.seaLeval}°C",
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700),
                                ),
                                const Text("Humidity"),
                                Text(
                                  " ${weather!.humidity}%",
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 230,
                            width: 180,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadiusDirectional.circular(20)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const Text("Description"),
                                Text(
                                  weather!.description.isEmpty
                                      ? "NO Describtion"
                                      : " ${weather!.description}",
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700),
                                ),
                                const Text("Humidity"),
                                Text(
                                  " ${weather!.pressure}°C",
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Positioned(
                      left: 110,
                      child: SizedBox(
                        height: 130,
                        width: 130,
                        child: Image.asset(
                          "asset/—Pngtree—drizzle sunny weather forecast_1867896.png",
                        ),
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
