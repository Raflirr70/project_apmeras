import 'package:aplikasi_mobile_kp_saya/Screen/dasboard.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MonitorAmpera());
}

class MonitorAmpera extends StatelessWidget {
  const MonitorAmpera({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Monitor Ampera",
      home: DasboardScreen(),
    );
  }
}
