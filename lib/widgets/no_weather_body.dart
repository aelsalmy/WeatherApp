import 'package:flutter/material.dart';

class NoWeatherBody extends StatelessWidget {
  const NoWeatherBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Search for a City to get its current weather',
      textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 32,
          color: Colors.grey,
        )
      ),
    );
  }
}