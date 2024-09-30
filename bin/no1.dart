import 'dart:io';
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

// Fungsi untuk melakukan bubble sort
List<int> bubbleSort(List<int> numbers) {
  bool swapped = true;
  while (swapped) {
    swapped = false;
    int i = 0;
    while (i < numbers.length - 1) {
      if (numbers[i] > numbers[i + 1]) {
        int temp = numbers[i];
        numbers[i] = numbers[i + 1];
        numbers[i + 1] = temp;
        swapped = true;
      }
      i++;
    }
  }
  return numbers;
}

// Fungsi untuk menghitung jumlah inversi
int countInversions(List<int> numbers) {
  int inversions = 0;
  int i = 0;
  while (i < numbers.length - 1) {
    int j = i + 1;
    while (j < numbers.length) {
      if (numbers[i] > numbers[j]) {
        inversions++;
      }
      j++;
    }
    i++;
  }
  return inversions;
}

// Fungsi untuk shuffle angka
List<int> shuffleNumbers(List<int> numbers) {
  Random random = Random();
  int i = numbers.length - 1;
  while (i > 0) {
    int j = random.nextInt(i + 1);
    int temp = numbers[i];
    numbers[i] = numbers[j];
    numbers[j] = temp;
    i--;
  }
  return numbers;
}

// Fungsi untuk mencetak piramida berurut berdasarkan daftar angka
void printPyramid(List<int> numbers) {
  int index = 0;
  int row = 1;

  while (index < numbers.length) {
    // Cetak spasi untuk membuat piramida di tengah
    for (int j = 0; j < numbers.length - row; j++) {
      stdout.write(' ');
    }

    // Cetak angka pada baris saat ini
    for (int k = 0; k < row && index < numbers.length; k++) {
      stdout.write('${numbers[index]} ');
      index++;
    }

    // Pindah ke baris berikutnya
    print('');
    row++;
  }
}

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

  // Eksekusi berdasarkan pilihan
  if (pilihan == 1) {
    // Bubble Sort
    List<int> sortedNumbers = []; // Inisialisasi variabel dengan List kosong
    int executionTime = measureExecutionTime(() {
      sortedNumbers = bubbleSort(List.from(randomNumbers));
    });
    print('Hasil Bubble Sort: $sortedNumbers');
    print('Waktu eksekusi: $executionTime ms');
  } else if (pilihan == 2) {
    // Hitung Inversi
    int inversions = 0; // Inisialisasi variabel inversions
    int executionTime = measureExecutionTime(() {
      inversions = countInversions(randomNumbers);
    });
    print('Jumlah inversi: $inversions');
    print('Waktu eksekusi: $executionTime ms');
  } else if (pilihan == 3) {
    // Shuffle angka
    List<int> shuffledNumbers = []; // Inisialisasi variabel shuffledNumbers
    int executionTime = measureExecutionTime(() {
      shuffledNumbers = shuffleNumbers(List.from(randomNumbers));
    });
    print('Hasil Shuffle: $shuffledNumbers');
    print('Waktu eksekusi: $executionTime ms');
  } else if (pilihan == 4) {
    // Generate piramida berdasarkan jumlah angka
    printPyramid(randomNumbers);
  } else {
    print('Pilihan tidak valid.');
  }
}
