import 'package:aplikasi_mobile_kp_saya/Model/makanan.dart';
import 'package:aplikasi_mobile_kp_saya/Widget/legen_item.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class HalamanMonitoring extends StatefulWidget {
  const HalamanMonitoring({super.key});

  @override
  State<HalamanMonitoring> createState() => _HalamanMonitoringState();
}

class _HalamanMonitoringState extends State<HalamanMonitoring> {
  int expandedIndex = -1; // <- menyimpan card yang terbuka

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(onPressed: () {}, icon: Icon(Icons.access_time_rounded)),
            IconButton(onPressed: () {}, icon: Icon(Icons.calendar_today)),
            IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            // ======== PIE CHART CARD ========
            Container(
              margin: EdgeInsets.only(top: 0, left: 10, right: 10),
              padding: EdgeInsets.all(10),
              constraints: BoxConstraints(minHeight: 10, maxHeight: 270),
              width: double.infinity,
              height: 230,
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(20),
              ),
              clipBehavior: Clip.hardEdge,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 160,
                    child: PieChart(
                      PieChartData(
                        sections: [
                          PieChartSectionData(
                            value: 40,
                            color: Colors.amber,
                            showTitle: false,
                          ),
                          PieChartSectionData(
                            value: 3,
                            color: Colors.blue,
                            showTitle: false,
                          ),
                          PieChartSectionData(
                            value: 2,
                            color: Colors.red,
                            showTitle: false,
                          ),
                          PieChartSectionData(
                            value: 80,
                            color: Colors.green,
                            showTitle: false,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 15, width: 150, child: Divider()),
                  Table(
                    defaultColumnWidth: FixedColumnWidth(75),
                    children: [
                      TableRow(
                        children: [
                          legendItem(Colors.amber, "Cipanas"),
                          legendItem(Colors.red, "Cimacan"),
                        ],
                      ),
                      TableRow(
                        children: [
                          legendItem(Colors.blue, "Balakang"),
                          legendItem(Colors.green, "Gsp"),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // ======== LIST LAPORAN ========
            Expanded(
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Detail Laporan",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                        SizedBox(
                          width: 140,
                          child: TextField(
                            decoration: InputDecoration(
                              label: Text("Search"),
                              isDense: true,
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 5),
                    Divider(thickness: 2),

                    Expanded(
                      child: ListView.builder(
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          bool isExpanded = expandedIndex == index;

                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                expandedIndex = isExpanded
                                    ? -1
                                    : index; // toggle
                              });
                            },
                            child: AnimatedSize(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                              child: Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // ===== Tampilan Utama (nama + pendapatan)
                                      Row(
                                        children: [
                                          Text(
                                            "Cabang ke-$index",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Spacer(),
                                          Text("Rp. ${index * 1000000}"),
                                        ],
                                      ),

                                      // ===== Jika Card di expand (klik)
                                      if (isExpanded) ...[
                                        SizedBox(height: 8),
                                        Divider(),

                                        // ---- LIST MAKANAN & STOCK ----
                                        ListView.builder(
                                          itemCount: Makanan().nama.length,
                                          shrinkWrap: true,
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          itemBuilder: (context, i) {
                                            int sisa = 24; // contoh
                                            int total = 50; // contoh

                                            return Padding(
                                              padding: EdgeInsets.symmetric(
                                                vertical: 3,
                                              ),
                                              child: Row(
                                                children: [
                                                  // Nama makanan
                                                  Expanded(
                                                    child: Text(
                                                      Makanan().nama[i],
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                  ),

                                                  Text(" : "),

                                                  // Sisa / Total
                                                  Text(
                                                    "$sisa / $total",
                                                    style: TextStyle(
                                                      color: Colors.grey[700],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        ),
                                      ],
                                    ],
                                  ),
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
          ],
        ),
      ),
    );
  }
}
