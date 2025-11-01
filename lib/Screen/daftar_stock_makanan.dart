import 'package:aplikasi_mobile_kp_saya/Model/makanan.dart';
import 'package:aplikasi_mobile_kp_saya/Screen/daftar_makanan.dart';
import 'package:aplikasi_mobile_kp_saya/Screen/dasboard.dart';
import 'package:aplikasi_mobile_kp_saya/Widget/List/list_stock_makanan.dart';
import 'package:aplikasi_mobile_kp_saya/Widget/search/search_daftar.dart';
import 'package:flutter/material.dart';

class StockMakanan extends StatefulWidget {
  const StockMakanan({super.key});

  @override
  State<StockMakanan> createState() => _StockMakananState();
}

class _StockMakananState extends State<StockMakanan> {
  
  int? expandedIndex;
  double w = 150;
  double h = 30;
  late FocusNode _focusNode;
  late TextEditingController _search;

  List<String> listMakanan = List.generate(20, (i) => "Data ke-$i");
  List<String> filteredMakanan = [];

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _search = TextEditingController();
    filteredMakanan = List.from(listMakanan); // tampil semua data awal
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _search.dispose();
    super.dispose();
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
        
        title: Text("Stock Makanan"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DaftarMakanan()),
              );
            },
            icon: Icon(Icons.warehouse_rounded),
          ),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SearchSimple(
                data: Makanan().nama,
                onResult: (hasil) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    setState(() {
                      filteredMakanan = hasil;
                    });
                  });
                },
              ),
              SizedBox(height: 10, width: 250, child: Divider(height: 2)),

              Expanded(
                child: listStockMakanan(
                  context,
                  filteredMakanan,
                  expandedIndex ?? -1,
                  (newIndex) {
                    setState(() {
                      expandedIndex = newIndex;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
