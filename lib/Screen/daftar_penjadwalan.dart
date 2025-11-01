import 'package:aplikasi_mobile_kp_saya/Model/cabang.dart';
import 'package:aplikasi_mobile_kp_saya/Screen/dasboard.dart';
import 'package:aplikasi_mobile_kp_saya/Screen/daftar_stock_makanan.dart';
import 'package:aplikasi_mobile_kp_saya/Widget/List/list_daftar_karyawan.dart';
import 'package:aplikasi_mobile_kp_saya/Widget/List/list_daftar_penjadwalan.dart';
import 'package:aplikasi_mobile_kp_saya/Widget/search/search_daftar.dart';
import 'package:flutter/material.dart';

class DaftarPenjadwalan extends StatefulWidget {
  const DaftarPenjadwalan({super.key});

  @override
  State<DaftarPenjadwalan> createState() => _DaftarPenjadwalanState();
}

class _DaftarPenjadwalanState extends State<DaftarPenjadwalan> {
  List<String> filtered = Cabang().nama;

  @override
  void initState() {
    super.initState();
    filtered = Cabang().nama;
  }

  void addKaryawan(String nama) {
    setState(() {
      Cabang().nama.add(nama);
      filtered = List.from(Cabang().nama);
    });
  }

  void editKaryawan(int index, String nama) {
    setState(() {
      Cabang().nama[index] = nama;
      filtered = List.from(Cabang().nama);
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
        title: Text("Daftar Cabang"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SearchSimple(
                data: Cabang().nama,
                onResult: (hasil) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    setState(() {
                      filtered = hasil;
                    });
                  });
                },
              ),

              SizedBox(height: 10, width: 250, child: Divider(height: 2)),
              listDaftarPenjadwalan(context, filtered),
            ],
          ),
        ),
      ),
    );
  }
}
