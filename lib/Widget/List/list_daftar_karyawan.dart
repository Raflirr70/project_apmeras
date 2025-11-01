import 'package:flutter/material.dart';

Widget listDaftarKarywan(
  BuildContext context,
  List<String> filtered,
  Function(String) add,
  Function(int, String) edit,
) {
  void showAddForm() {
    TextEditingController ctrl = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Tambah Karyawan"),
          content: TextField(
            controller: ctrl,
            decoration: InputDecoration(labelText: "Nama Karyawan"),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Batal"),
            ),
            ElevatedButton(
              onPressed: () {
                add(ctrl.text); // ✅ panggil fungsi parent
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
    TextEditingController ctrl = TextEditingController(text: currentName);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Edit Karyawan"),
          content: TextField(
            controller: ctrl,
            decoration: InputDecoration(labelText: "Nama Karyawan"),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Batal"),
            ),
            ElevatedButton(
              onPressed: () {
                edit(index, ctrl.text); // ✅ panggil fungsi parent
                Navigator.pop(context);
              },
              child: Text("Simpan"),
            ),
          ],
        );
      },
    );
  }

  return Expanded(
    child: ListView.builder(
      itemCount: filtered.length + 1,
      itemBuilder: (context, index) {
        if (index == filtered.length) {
          return Card(
            child: ListTile(
              leading: Icon(Icons.add),
              title: Text("Tambah Karyawan"),
              onTap: showAddForm,
            ),
          );
        }

        return Card(
          child: ListTile(
            title: Text(filtered[index]),
            onTap: () => showEditForm(filtered[index], index),
          ),
        );
      },
    ),
  );
}
