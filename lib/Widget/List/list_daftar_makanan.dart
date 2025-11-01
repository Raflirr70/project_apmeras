import 'package:flutter/material.dart';

Widget listDaftarMakanan(
  BuildContext context,
  List<String> filteredMakanan,
  Function add,
  Function edit,
) {
  return Expanded(
    child: ListView.builder(
      itemCount: filteredMakanan.length + 1,
      itemBuilder: (context, index) {
        // ✅ Item terakhir = tombol Add
        if (index == filteredMakanan.length) {
          return Card(
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            child: InkWell(
              onTap: () {
                // Navigator.pop(context);
                add;
              },
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Center(child: Icon(Icons.add, size: 30)),
              ),
            ),
          );
        }

        // ✅ Item data
        return Card(
          margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
          child: ListTile(
            title: Text(filteredMakanan[index]),
            subtitle: Text("Harga ke-$index"),
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Center(child: Text(filteredMakanan[index])),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          width: 250,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                              edit;
                            },
                            child: Text("Edit"),
                          ),
                        ),
                        SizedBox(height: 10),
                        SizedBox(
                          width: 250,
                          height: 50,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                              // Aksi hapus
                            },
                            child: Text(
                              "Hapus",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        );
      },
    ),
  );
}
