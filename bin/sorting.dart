// Fungsi untuk melakukan bubble sort
List<int> bubbleSort(List<int> numbers) {
  bool swapped = true;
  int n = numbers.length;

  // Menggunakan satu while untuk melakukan sorting
  while (swapped) {
    swapped = false; // Reset flag swapped di setiap iterasi
    int i = 0;

    // Proses bubble sort menggunakan satu while
    while (i < n - 1) {
      // Satu if untuk kondisi swap
      if (numbers[i] > numbers[i + 1]) {
        // Lakukan swap
        int temp = numbers[i];
        numbers[i] = numbers[i + 1];
        numbers[i + 1] = temp;
        swapped = true; // Tandai bahwa ada yang diswap
      }
      i++;
    }
    n--; // Kurangi ukuran n setiap kali, karena elemen terbesar sudah berada di tempatnya
  }
  return numbers;
}
