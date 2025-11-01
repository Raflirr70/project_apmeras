import 'package:aplikasi_mobile_kp_saya/Model/stock.dart';
import 'package:flutter/material.dart';

Widget listStockMakanan(
  BuildContext context,
  List<String> filteredMakanan,
  int expandedIndex,
  Function(int?) onTapItem,
) {
  Stock stocks = Stock();

  return ListView.builder(
    itemCount: filteredMakanan.length,
    itemBuilder: (context, index) {
      bool isExpanded = expandedIndex == index;
      return AnimatedSize(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 4,
                offset: Offset(1, 2),
              ),
            ],
          ),
          child: InkWell(
            // Hilangkan splash kuning
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,

            onTap: () {
              onTapItem(expandedIndex == index ? null : index);
            },

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  filteredMakanan[index],
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                Text("Harga ke-$index"),

                // muncul hanya ketika dibuka — auto height
                if (isExpanded) ...[
                  SizedBox(height: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Stock"),
                      Text("Cipanas           : ${stocks.getJumlah(1, index)}"),
                      Text("Balakang         : ${stocks.getJumlah(2, index)}"),
                      Text(
                        "GSP                 : ${stocks.getJumlah(3, index)}",
                      ),
                      Text("Cimacan         : ${stocks.getJumlah(4, index)}"),
                      Text("Gudang           : ${stocks.getJumlah(0, index)}"),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            height: 50,
                            width: 150,
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Text("Stock Gudang"),
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 50,
                            width: 150,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Text(
                                "Stock Cabang",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),
        ),
      );
    },
  );
}
