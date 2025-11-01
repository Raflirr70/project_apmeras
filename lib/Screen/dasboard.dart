
import 'package:aplikasi_mobile_kp_saya/Widget/dashboard_menu.dart';
import 'package:aplikasi_mobile_kp_saya/Widget/legen_item.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class DasboardScreen extends StatefulWidget {
  const DasboardScreen({super.key});

  @override
  State<DasboardScreen> createState() => _DasboardScreenState();
}

class _DasboardScreenState extends State<DasboardScreen> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 30,),
            SizedBox(
              height: 50,
              key: Key("Navigasi"),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text("Nama User", style: TextStyle(fontSize: 13)),
                      Text("Role User", style: TextStyle(fontSize: 9))
                    ],
                  ),
                  Icon(Icons.account_circle_rounded, size: 40,),
                ],
              )
            ),
            Container(
              margin: EdgeInsets.only(top: 0, left: 10, right: 10),
              padding: EdgeInsets.all(10),
              constraints: BoxConstraints(
                minHeight: 10,  maxHeight: 270
              ),
              width: double.infinity,
              decoration: BoxDecoration(border: Border.all(), borderRadius: BorderRadius.circular(20),),
              clipBehavior: Clip.hardEdge,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 175,
                    child: PieChart(
                      PieChartData(
                        sections: [
                          PieChartSectionData(value: 40, color: Colors.amber, showTitle: false,),
                          PieChartSectionData(value: 3, color: Colors.blue, showTitle: false),
                          PieChartSectionData(value: 2, color: Colors.red, showTitle: false),
                          PieChartSectionData(value: 80, color: Colors.green, showTitle: false),
                        ]
                      )
                    ),
                  ),
                  SizedBox(
                    height: 15,
                    width: 150,
                    child: Divider(),
                  ),
                  Table(
                    // border: TableBorder.all(),
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
                  )
                ],
              ),
            ),
            SizedBox(height: 30, width: 200, child: Divider(thickness: 4, radius: BorderRadius.circular(100),)),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: dashboardMenu(context)
              )
            ),
          ],
        ),
      ),
    );
  }
}

