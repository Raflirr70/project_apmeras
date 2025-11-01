import 'package:aplikasi_mobile_kp_saya/Model/karyawan.dart';
import 'package:aplikasi_mobile_kp_saya/Screen/dasboard.dart';
import 'package:aplikasi_mobile_kp_saya/Screen/daftar_stock_makanan.dart';
import 'package:aplikasi_mobile_kp_saya/Widget/List/list_daftar_karyawan.dart';
import 'package:aplikasi_mobile_kp_saya/Widget/search/search_daftar.dart';
import 'package:flutter/material.dart';

class DaftarKaryawan extends StatefulWidget {
  const DaftarKaryawan({super.key});

  @override
  State<DaftarKaryawan> createState() => _DaftarKaryawanState();
}

class _DaftarKaryawanState extends State<DaftarKaryawan> {
  List<String> filtered = Karyawan.nama;

  @override
  void initState() {
    super.initState();
    filtered = Karyawan.nama;
  }

  void addKaryawan(String nama) {
    setState(() {
      Karyawan.nama.add(nama);
      filtered = List.from(Karyawan.nama);
    });
  }

  void editKaryawan(int index, String nama) {
    setState(() {
      Karyawan.nama[index] = nama;
      filtered = List.from(Karyawan.nama);
    });
  }

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
        title: Text("Daftar Karyawan"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => StockMakanan()),
              );
            },
            icon: Icon(Icons.menu_book),
          ),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SearchSimple(
                data: Karyawan.nama,
                onResult: (hasil) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    setState(() {
                      filtered = hasil;
                    });
                  });
                },
              ),

              SizedBox(height: 10, width: 250, child: Divider(height: 2)),
              listDaftarKarywan(context, filtered, addKaryawan, editKaryawan),
            ],
          ),
        ),
      ),
    );
  }
}
