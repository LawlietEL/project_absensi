import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/riwayat_controller.dart';

class RiwayatView extends GetView<RiwayatController> {
  const RiwayatView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Riwayat Absensi',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Obx(() => DropdownButton<String>(
                        value: controller.selectedMonth.value,
                        onChanged: (newValue) {
                          controller.selectedMonth.value = newValue!;
                          controller.updateHistory();
                        },
                        items: controller.months
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      )),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Obx(() => DropdownButton<String>(
                        value: controller.selectedYear.value,
                        onChanged: (newValue) {
                          controller.selectedYear.value = newValue!;
                          controller.updateHistory();
                        },
                        items: controller.years
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      )),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Obx(() {
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: SingleChildScrollView(
                    child: Table(
                      border: TableBorder.all(),
                      columnWidths: const {
                        0: FixedColumnWidth(50),
                        1: FixedColumnWidth(100),
                        2: FixedColumnWidth(150),
                        3: FixedColumnWidth(100),
                        4: FixedColumnWidth(100),
                        5: FixedColumnWidth(200),
                      },
                      children: [
                        TableRow(
                          children: [
                            tableHeader('No'),
                            tableHeader('Day'),
                            tableHeader('Date'),
                            tableHeader('In Time'),
                            tableHeader('Out Time'),
                            tableHeader('Note'),
                          ],
                        ),
                        for (var i = 0;
                            i < controller.attendanceHistory.length;
                            i++)
                          TableRow(
                            children: [
                              tableCell((i + 1).toString()),
                              tableCell(
                                  controller.attendanceHistory[i]['day']!),
                              tableCell(
                                  controller.attendanceHistory[i]['date']!),
                              tableCell(controller.attendanceHistory[i]['in']!),
                              tableCell(
                                  controller.attendanceHistory[i]['out']!),
                              tableCell(
                                  controller.attendanceHistory[i]['note']!),
                            ],
                          ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  Widget tableHeader(String title) {
    return Container(
      color: Colors.blue,
      padding: const EdgeInsets.all(8.0),
      child: Text(
        title,
        style:
            const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget tableCell(String value) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        value,
        textAlign: TextAlign.center,
      ),
    );
  }
}
