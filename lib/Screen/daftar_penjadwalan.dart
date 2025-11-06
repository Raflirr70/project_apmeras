import 'package:aplikasi_mobile_kp_saya/Model/cabang.dart';
import 'package:aplikasi_mobile_kp_saya/Screen/dasboard.dart';
import 'package:aplikasi_mobile_kp_saya/Widget/List/list_daftar_penjadwalan.dart';
import 'package:aplikasi_mobile_kp_saya/Widget/search/search_daftar.dart';
import 'package:flutter/material.dart';

class DaftarPenjadwalan extends StatefulWidget {
  const DaftarPenjadwalan({super.key});

  @override
  State<DaftarPenjadwalan> createState() => _DaftarPenjadwalanState();
}

class _DaftarPenjadwalanState extends State<DaftarPenjadwalan> {
  List<Map<String, dynamic>> filtered = [];

  @override
  void initState() {
    super.initState();
    filtered = Cabang().nama;
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
        child: Column(
          children: [
            SearchSimple(
              data: Cabang().nama.map((e) => e["cabang"] as String).toList(),
              onResult: (hasil) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  setState(() {
                    filtered = Cabang().nama
                        .where((e) => hasil.contains(e["cabang"]))
                        .toList();
                  });
                });
              },
            ),

            SizedBox(height: 10, width: 250, child: Divider(height: 2)),
            listDaftarPenjadwalan(context, filtered),
          ],
        ),
      ),
    );
  }
}
