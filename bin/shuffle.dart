import 'dart:math';

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
