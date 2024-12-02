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
    for (int i = -1; i < report.length; i++) {
      final reportCopy = [...report];

      if (i > -1) {
        reportCopy.removeAt(i);
      }

      final bool increase = reportCopy[0] < reportCopy[1];

      bool safeTry = true;

      for (int i = 1; i < reportCopy.length; i++) {
        final diff = (reportCopy[i] - reportCopy[i-1]).abs();

        if (diff > 3 || diff.abs() < 1 || (increase && reportCopy[i] < reportCopy[i-1]) || (!increase && reportCopy[i] > reportCopy[i-1])) {
          safeTry = false;
          break;
        }
      }

      if (safeTry) {
        safe += 1;
        break;
      }
    }
  }

  print(safe);
  print('REPORTS LENGTH: ${reports.length}');
}