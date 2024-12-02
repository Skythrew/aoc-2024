import 'dart:io';

void main() {
  var line = stdin.readLineSync();

  if (line == null) {
    return;
  }

  final List<List<int>> reports = []; 

  while (line!.trim() != '') {
    final splittedLine = line.split(' ');
    reports.add([for (final lvl in splittedLine) int.parse(lvl)]);
    line = stdin.readLineSync();
  }

  int safe = 0;

  for (final report in reports) {
    final bool increase = report[0] < report[1];

    safe += 1;

    for (int i = 1; i < report.length; i++) {
      final diff = (report[i] - report[i-1]).abs();

      if (diff > 3 || diff.abs() < 1 || (increase && report[i] < report[i-1]) || (!increase && report[i] > report[i-1])) {
        safe -= 1;
        break;
      }
    }
  }

  print(safe);
  print('REPORTS LENGTH: ${reports.length}');
}