import 'dart:io';

void main() {
  var line = stdin.readLineSync();

  if (line == null) {
    return;
  }

  final l1 = <int>{};
  final List<int> l2 = [];
  final Map<int, int> scores = {};
  
  while (line!.trim() != '') {
    final splittedLine = line.split('   ');
    l1.add(int.parse(splittedLine[0]));
    l2.add(int.parse(splittedLine[1]));
    line = stdin.readLineSync();
  }

  l2.sort();

  var sum = 0;

  for (final num in l2) {
    if (l1.contains(num)) {
      if (scores[num] == null) {
        scores[num] = 0;
      }

      scores[num] = scores[num]! + 1;
    }
  }

  scores.forEach((k, v) {
    sum += k * v;
  });

  print(sum);
}