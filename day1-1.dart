import 'dart:io';

void main() {
  var line = stdin.readLineSync();

  if (line == null) {
    return;
  }

  List<int> l1 = [];
  List<int> l2 = [];
  
  while (line!.trim() != '') {
    final splittedLine = line.split('   ');
    l1.add(int.parse(splittedLine[0]));
    l2.add(int.parse(splittedLine[1]));
    line = stdin.readLineSync();
  }

  l1.sort();
  l2.sort();

  var sum = 0;

  for (var i = 0; i < l1.length; i++) {
    sum += (l1[i] - l2[i]).abs();
  }

  print(sum);
}