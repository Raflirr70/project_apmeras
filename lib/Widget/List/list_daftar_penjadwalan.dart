import 'package:aplikasi_mobile_kp_saya/Model/karyawan.dart';
import 'package:flutter/material.dart';

Widget listDaftarPenjadwalan(
  BuildContext context,
  List<Map<String, dynamic>> filtered,
) {
  return Expanded(
    child: ListView.builder(
      itemCount: filtered.length,
      itemBuilder: (context, index) {
        var item = filtered[index];
        var karyawan = item["karyawan"] as List;
        return Card(
          child: InkWell(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item["cabang"],
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Container(
                  padding: EdgeInsets.all(10),
                  width: double.infinity,
                  child: Column(
                    children: karyawan.map<Widget>((e) {
                      return Card(
                        color: Colors.amber[200],
                        margin: EdgeInsets.symmetric(vertical: 4),
                        child: ListTile(
                          title: Text(e, style: TextStyle(fontSize: 16)),
                          trailing: InkWell(
                            borderRadius: BorderRadius.circular(30),
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text(
                                      "Hapus karyawan ini?",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    content: Text(
                                      "Tindakan ini tidak dapat dibatalkan.",
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () => Navigator.pop(context),
                                        child: Text("Batal"),
                                      ),
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.red,
                                        ),
                                        onPressed: () {
                                          // aksi hapus nanti
                                          Navigator.pop(context);
                                        },
                                        child: Text("Hapus"),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            child: Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.red.withOpacity(0.15),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.close,
                                color: Colors.red,
                                size: 20,
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.add, color: Colors.black),
                  title: Text("Tambah Karyawan"),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        String? selectedValue;
                        var dataKaryawan = Karyawan.nama;

                        return AlertDialog(
                          title: Text("Pilih Karyawan"),

                          content: StatefulBuilder(
                            builder: (context, setState) {
                              return SingleChildScrollView(
                                child: Column(
                                  children: [
                                    DropdownButtonFormField<String>(
                                      decoration: InputDecoration(
                                        labelText: "Pilih Karyawan",
                                      ),
                                      value: selectedValue,
                                      items: dataKaryawan
                                          .map<DropdownMenuItem<String>>((
                                            nama,
                                          ) {
                                            return DropdownMenuItem(
                                              value: nama,
                                              child: Text(nama),
                                            );
                                          })
                                          .toList(),
                                      onChanged: (val) {
                                        setState(() => selectedValue = val);
                                      },
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text("Batal"),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                                print("Dipilih: $selectedValue");
                              },
                              child: Text("Simpan"),
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
              ],
            ),
            onTap: () {},
          ),
        );
      },
    ),
  );
}
