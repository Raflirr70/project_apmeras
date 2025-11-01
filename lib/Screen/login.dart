import 'package:aplikasi_mobile_kp_saya/Screen/dasboard.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: EdgeInsets.all(50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 150,
                decoration: BoxDecoration(border: Border.all()),
              ),
              SizedBox(height: 20),
              TextField(decoration: InputDecoration(label: Text("Username"), border: OutlineInputBorder( borderRadius: BorderRadius.circular(20)), prefixIcon: Icon(Icons.account_box_rounded)),),
              SizedBox(height: 10),
              TextField(decoration: InputDecoration(label: Text("Username"), border: OutlineInputBorder( borderRadius: BorderRadius.circular(20)), prefixIcon: Icon(Icons.key)),),
              SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ButtonStyle(),
                  child: Text("Login"),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => DasboardScreen(),));
                  },
                ),
              )
            ],
          ),
        )
      ),
    );
  }
}