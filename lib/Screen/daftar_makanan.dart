import 'package:aplikasi_mobile_kp_saya/Model/makanan.dart';
import 'package:aplikasi_mobile_kp_saya/Screen/dasboard.dart';
import 'package:aplikasi_mobile_kp_saya/Screen/daftar_stock_makanan.dart';
import 'package:aplikasi_mobile_kp_saya/Widget/List/list_daftar_makanan.dart';
import 'package:aplikasi_mobile_kp_saya/Widget/search/search_daftar.dart';
import 'package:flutter/material.dart';

class DaftarMakanan extends StatefulWidget {
  const DaftarMakanan({super.key});

  @override
  State<DaftarMakanan> createState() => _DaftarMakananState();
}

class _DaftarMakananState extends State<DaftarMakanan> {
  double w = 150;
  double h = 30;
  late FocusNode _focusNode;
  late TextEditingController _search;

  List<String> listMakanan = List.generate(20, (i) => "Data ke-$i");
  List<String> filteredMakanan = Makanan().nama;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _search = TextEditingController();
    filteredMakanan = Makanan().nama;
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _search.dispose();
    super.dispose();
  }

  void showAddForm() {
    TextEditingController nameCtrl = TextEditingController();
    TextEditingController hargaCtrl = TextEditingController();

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: Text("Tambah Makanan"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameCtrl,
                decoration: InputDecoration(labelText: "Nama Makanan"),
              ),
              SizedBox(height: 10),
              TextField(
                controller: hargaCtrl,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: "Harga"),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Batal"),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  listMakanan.add(nameCtrl.text);
                  filteredMakanan = List.from(listMakanan);
                });
                Navigator.pop(context);
              },
              child: Text("Simpan"),
            ),
          ],
        );
      },
    );
  }

  void showEditForm(String currentName, int index) {
    TextEditingController nameCtrl = TextEditingController(text: currentName);
    TextEditingController hargaCtrl = TextEditingController(
      text: "Harga ke-$index",
    );

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: Text("Edit Makanan"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameCtrl,
                decoration: InputDecoration(labelText: "Nama Makanan"),
              ),
              SizedBox(height: 10),
              TextField(
                controller: hargaCtrl,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: "Harga"),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Batal"),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  listMakanan[index] = nameCtrl.text;
                  filteredMakanan = List.from(listMakanan);
                });
                Navigator.pop(context);
              },
              child: Text("Simpan"),
            ),
          ],
        );
      },
    );
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
        title: Text("Menu Makanan"),
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
              listDaftarMakanan(
                context,
                filteredMakanan,
                showAddForm,
                showEditForm,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
