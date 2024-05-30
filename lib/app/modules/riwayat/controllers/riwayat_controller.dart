import 'package:get/get.dart';

class RiwayatController extends GetxController {
  var selectedMonth = 'January'.obs;
  var selectedYear = '2024'.obs;
  var attendanceHistory = <Map<String, String>>[].obs;

  // Sample data
  final List<String> months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];

  final List<String> years = [
    '2023',
    '2024',
    '2025',
    '2026',
    '2027',
    '2028',
    '2029',
    '2030'
  ];

  @override
  void onInit() {
    super.onInit();
    fetchAttendanceHistory();
  }

  void fetchAttendanceHistory() {
    // Dummy data for demonstration
    attendanceHistory.value = [
      {
        'day': 'Monday',
        'date': '01-01-2024',
        'in': '08:00',
        'out': '17:00',
        'note': 'Present'
      },
      {
        'day': 'Tuesday',
        'date': '02-01-2024',
        'in': '08:05',
        'out': '17:10',
        'note': 'Late'
      },
      // Add more data as needed
    ];
  }

  void updateHistory() {
    // Fetch new data based on selectedMonth and selectedYear
    fetchAttendanceHistory();
  }
}
