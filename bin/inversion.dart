// Fungsi untuk menghitung jumlah inversi
int countInversions(List<int> numbers) {
  int inversions = 0;
  int length = numbers.length;

  // Menggunakan satu while dan satu if
  int i = 0;
  int j = 1; // Inisialisasi j untuk membandingkan dengan i

  while (i < length) {
    // Hanya menggunakan satu if
    if (j < length) {
      if (numbers[i] > numbers[j]) {
        inversions++; // Hitung inversi jika ada
      }
      j++; // Pindah ke elemen berikutnya
    } else {
      // Jika j mencapai akhir, reset j dan pindah ke elemen berikutnya i
      i++;
      j = i + 1; // Set j ke elemen berikutnya dari i
    }
  }

  return inversions;
}
