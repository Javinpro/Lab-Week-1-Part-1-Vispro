import 'dart:io';

// Fungsi untuk mencetak piramida berurut berdasarkan daftar angka
void printPyramid(List<int> numbers) {
  int index = 0;
  int row = 1;
  int totalRows = numbers.length; // Total baris yang akan dicetak

  // Menggunakan satu while dan satu if
  while (index < numbers.length) {
    // Hanya satu if untuk mengecek batas baris
    if (row <= totalRows) {
      // Cetak spasi
      int spaceCount = totalRows - row;
      while (spaceCount > 0) {
        stdout.write(' ');
        spaceCount--; // Mengurangi jumlah spasi yang harus dicetak
      }

      // Cetak angka pada baris saat ini
      int numberCount = row;
      while (numberCount > 0 && index < numbers.length) {
        stdout.write('${numbers[index]} ');
        index++;
        numberCount--; // Mengurangi jumlah angka yang harus dicetak
      }

      print(''); // Pindah ke baris berikutnya
      row++; // Pindah ke baris berikutnya
    }
  }
}
