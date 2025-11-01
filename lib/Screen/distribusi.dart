import 'package:aplikasi_mobile_kp_saya/Model/cabang.dart';
import 'package:aplikasi_mobile_kp_saya/Screen/dasboard.dart';
import 'package:aplikasi_mobile_kp_saya/Widget/List/list_distribusi.dart';
import 'package:aplikasi_mobile_kp_saya/Widget/PopUp/pilihan_cabang.dart';
import 'package:flutter/material.dart';

class Distribusi extends StatefulWidget {
  const Distribusi({super.key});

  @override
  State<Distribusi> createState() => _DistribusiState();
}

class _DistribusiState extends State<Distribusi> {
  int n = 10;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DasboardScreen()),
            );
          },
          icon: Icon(Icons.arrow_back_ios_new_sharp),
        ),
        title: Text("Halaman Distribusi"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            padding: EdgeInsets.symmetric(vertical: 20),
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 100,
                      height: 100,
                      child: ElevatedButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) =>
                                PopUpPilihanCabang(Cabang(), 1),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.circular(20),
                          ),
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.store_mall_directory, size: 40),
                              Text("Cipanas"),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
                      child: Icon(Icons.keyboard_double_arrow_right, size: 30),
                    ),

                    SizedBox(
                      width: 100,
                      height: 100,
                      child: ElevatedButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) =>
                                PopUpPilihanCabang(Cabang(), 2),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.circular(20),
                          ),
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.store_mall_directory, size: 40),
                              Text("Cipanas"),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  width: 250,
                  margin: EdgeInsets.symmetric(vertical: 20),
                  child: Divider(height: 3),
                ),
                Expanded(
                  child: ScrollbarTheme(
                    data: ScrollbarThemeData(
                      thumbVisibility: MaterialStateProperty.all(false),
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: ListView.builder(
                            itemCount: n + 1,
                            itemBuilder: (context, index) {
                              if (index != n) {
                                return listDistribusi(context, index);
                              } else {
                                return SizedBox(
                                  width: double.infinity,
                                  height: 50,
                                  child: Card(
                                    child: ListView(
                                      children: [Icon(Icons.add, size: 30)],
                                    ),
                                  ),
                                );
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
