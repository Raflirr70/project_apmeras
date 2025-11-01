import 'package:flutter/material.dart';

Widget listDaftarPenjadwalan(BuildContext context, List<String> filtered) {
  return Expanded(
    child: ListView.builder(
      itemCount: filtered.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(title: Text(filtered[index]), onTap: () {
            
          }
          ),
        );
      },
    ),
  );
}
