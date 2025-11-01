import 'package:flutter/material.dart';

Widget editDaftar(BuildContext context, int index) {
  return AlertDialog(
    title: Center(
      child: TextField(
        controller: TextEditingController(text: "${index}"),
        textAlign: TextAlign.center,
      ),
    ),
    content: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              // showEditForm(index.toString());
              // Aksi edit
            },
            child: Text("Edit"),
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () {
              Navigator.pop(context);
              // Aksi hapus
            },
            child: Text("Hapus", style: TextStyle(color: Colors.white)),
          ),
        ),
      ],
    ),
  );
}
