import 'dart:math';

// Fungsi untuk menghitung waktu eksekusi
int measureExecutionTime(Function f) {
  var stopwatch = Stopwatch()..start();
  f();
  stopwatch.stop();
  return stopwatch.elapsedMilliseconds;
}

// Fungsi untuk menghasilkan daftar angka acak
List<int> generateRandomNumbers(int jumlah) {
  Random random = Random();
  List<int> numbers = [];
  int i = 0;
  while (i < jumlah) {
    numbers.add(random.nextInt(100)); // Angka acak antara 0-99
    i++;
  }
  return numbers;
}
