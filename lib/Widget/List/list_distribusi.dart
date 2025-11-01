import 'package:aplikasi_mobile_kp_saya/Widget/PopUp/dasboard_edit_form.dart';
import 'package:flutter/material.dart';

Widget listDistribusi(BuildContext context, int index) {
  return InkWell(
    child: Card(
      child: Container(
        padding: EdgeInsets.all(5),
        child: Row(
          children: [
            Expanded(
              child: SizedBox(
                height: 50,
                child: Card(
                  shape: RoundedRectangleBorder(),
                  child: Text("data"),
                ),
              ),
            ),
            Column(
              children: [
                Icon(Icons.arrow_right_alt, size: 30),
                Text("20", style: TextStyle(fontSize: 13)),
              ],
            ),
            Expanded(
              child: SizedBox(
                height: 50,
                child: Card(
                  shape: RoundedRectangleBorder(),
                  child: Text("data"),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
    onTap: () {
      showDialog(
        context: context,
        builder: (context) => editDaftar(context, index),
      );
    },
  );
}
