import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherforecastingapp/theme_provider.dart';

class Weatherupdate extends StatefulWidget {
  const Weatherupdate({super.key});

  @override
  State<Weatherupdate> createState() => _WeatherupdateState();
}

class _WeatherupdateState extends State<Weatherupdate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.more_vert),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Consumer<ThemeProvider>(
              builder: (context, themeProvider, child) {
                return Switch(
                  activeColor: Colors.white,
                  inactiveThumbColor: Colors.white,
                  thumbColor: MaterialStateProperty.all(Colors.orange),
                  inactiveTrackColor: Colors.transparent,
                  thumbIcon: MaterialStateProperty.all(
                    themeProvider.isSelected
                        ? const Icon(Icons.nights_stay)
                        : const Icon(Icons.sunny),
                  ),
                  value: themeProvider.isSelected,
                  onChanged: (value) {
                    themeProvider.toggleTheme();
                  },
                );
              },
            ),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Karachi",
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 30),
              Consumer<ThemeProvider>(
                builder: (context, themeProvider, child) {
                  return Icon(
                    themeProvider.isSelected ? Icons.nights_stay : Icons.sunny,
                    size: 250,
                    color: Colors.orange,
                  );
                },
              ),
              const SizedBox(height: 30),
              Text(
                "20°C",
                style: TextStyle(fontSize: 31),
              ),
              Text(
                "Good Morning",
                style: TextStyle(fontSize: 18, color: Colors.grey.shade500),
              ),
              Text(
                "Weather",
                style: TextStyle(fontSize: 18, color: Colors.grey.shade600),
              ),
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Icon(Icons.wb_sunny),
                      Text("SUNRISE"),
                      Text("5:00"),
                    ],
                  ),
                  const VerticalDivider(
                    color: Colors.black,
                    thickness: 1,
                  ),
                  Column(
                    children: [
                      Icon(Icons.air),
                      Text("WIND"),
                      Text("4m/s"),
                    ],
                  ),
                  const VerticalDivider(
                    color: Colors.black,
                    thickness: 1,
                  ),
                  Column(
                    children: [
                      Icon(Icons.thermostat),
                      Text("TEMPERATURE"),
                      Text("32°C"),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
