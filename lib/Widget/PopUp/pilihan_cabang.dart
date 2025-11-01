import 'package:flutter/material.dart';

Widget PopUpPilihanCabang(var cabang, int x) {
  return AlertDialog(
    content: Container(
      margin: EdgeInsets.all(2),
      height: 220,
      child: Center(
        child: Column(
          children: [
            Text("Pilih Cabang"),
            Expanded(
              child: ListView.builder(
                itemCount: cabang.nama.length,
                itemBuilder: (context, index) {
                  return SizedBox(
                    height: 50,
                    child: Card(
                      child: Expanded(
                        child: InkWell(
                          onTap: () {},
                          child: Text(cabang.nama[index]),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
