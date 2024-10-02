import 'dart:io';
import 'utils.dart';
import 'sorting.dart';
import 'inversion.dart';
import 'shuffle.dart';
import 'pyramid.dart';

void main() {
  // Input jumlah angka dari pengguna
  stdout.write('Jumlah Angka Random: ');
  String? input =
      stdin.readLineSync(); // Nullable karena input pengguna bisa null
  int jumlahAngka = int.parse(input ?? '1'); // Menggunakan '1' jika input null

  // Generate angka acak
  List<int> randomNumbers = generateRandomNumbers(jumlahAngka);
  print('$randomNumbers');

  // Opsi yang tersedia
  print('Aksi untuk angka:');
  print('1. Bubble Sort');
  print('2. Hitung Inversi');
  print('3. Shuffle');
  print('4. Generate Piramida');
  stdout.write('Pilih Opsi: ');
  String? pilihanInput =
      stdin.readLineSync(); // Nullable karena input bisa null
  int pilihan =
      int.parse(pilihanInput ?? '1'); // Menggunakan '1' jika input null

  // Variabel untuk eksekusi dan hasil
  int executionTime = 0;
  List<int> resultNumbers = [];
  int inversions = 0;
  bool selesai = false;

  while (!selesai) {
    switch (pilihan) {
      case 1:
        // Bubble Sort
        executionTime = measureExecutionTime(() {
          resultNumbers = bubbleSort(List.from(randomNumbers));
        });
        print('Hasil Bubble Sort: $resultNumbers');
        selesai = true;
        break;
      case 2:
        // Hitung Inversi
        executionTime = measureExecutionTime(() {
          inversions = countInversions(randomNumbers);
        });
        print('Jumlah inversi: $inversions');
        selesai = true;
        break;
      case 3:
        // Shuffle angka
        executionTime = measureExecutionTime(() {
          resultNumbers = shuffleNumbers(List.from(randomNumbers));
        });
        print('Hasil Shuffle: $resultNumbers');
        selesai = true;
        break;
      case 4:
        // Generate piramida
        printPyramid(randomNumbers);
        selesai = true;
        break;
      default:
        // Jika pilihan tidak valid
        print('Pilihan tidak valid.');
        stdout.write('Pilih Opsi yang valid: ');
        pilihanInput = stdin.readLineSync();
        pilihan = int.parse(pilihanInput ?? '1');
    }
  }

  // Jika ada waktu eksekusi, tampilkan
  if (executionTime > 0) {
    print('Waktu eksekusi: $executionTime ms');
  }
}
