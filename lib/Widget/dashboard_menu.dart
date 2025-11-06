import 'package:aplikasi_mobile_kp_saya/Model/menu_dasboard.dart';
import 'package:aplikasi_mobile_kp_saya/Screen/daftar_karyawan.dart';
import 'package:aplikasi_mobile_kp_saya/Screen/daftar_penjadwalan.dart';
import 'package:aplikasi_mobile_kp_saya/Screen/dasboard.dart';
import 'package:aplikasi_mobile_kp_saya/Screen/daftar_makanan.dart';
import 'package:aplikasi_mobile_kp_saya/Screen/distribusi.dart';
import 'package:aplikasi_mobile_kp_saya/Screen/daftar_stock_makanan.dart';
import 'package:aplikasi_mobile_kp_saya/Screen/monitoring.dart';
import 'package:flutter/material.dart';

Widget dashboardMenu(BuildContext context) {
  Menu menu = Menu();
  return Container(
    // padding: EdgeInsets.all(10),
    margin: EdgeInsets.symmetric(horizontal: 10),
    child: GridView.count(
      crossAxisCount: 3,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      children: List.generate(menu.nama.length, (a) {
        return ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            padding: EdgeInsets.all(0),
          ),
          onPressed: () {
            if (a == 0) {
              // Monitoring
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HalamanMonitoring()),
              );
            } else if (a == 1) {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Center(child: Icon(Icons.restaurant_menu, size: 40)),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          width: 250,
                          height: 50,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadiusGeometry.circular(10),
                              ),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DaftarMakanan(),
                                ),
                              );
                            },
                            child: Text("Makanan"),
                          ),
                        ),
                        SizedBox(height: 10),
                        SizedBox(
                          width: 250,
                          height: 50,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadiusGeometry.circular(10),
                              ),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => StockMakanan(),
                                ),
                              );
                            },
                            child: Text("Stock"),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            } else if (a == 2) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Distribusi()),
              );
            } else if (a == 3) {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Center(child: Icon(Icons.attach_money, size: 40)),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          width: 250,
                          height: 50,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadiusGeometry.circular(10),
                              ),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DasboardScreen(),
                                ),
                              );
                            },
                            child: Text("Oprasional"),
                          ),
                        ),
                        SizedBox(height: 10),
                        SizedBox(
                          width: 250,
                          height: 50,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadiusGeometry.circular(10),
                              ),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text("Gaji Karyawan"),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            } else if (a == 4) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DaftarPenjadwalan()),
              );
            } else {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DaftarKaryawan()),
              );
            }
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(menu.logo[a], size: 40),
              Text(menu.nama[a], style: TextStyle(fontSize: 13)),
            ],
          ),
        );
      }),
    ),
  );
}
