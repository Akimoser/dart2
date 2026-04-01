void main() {
  // 1. Максимум из трех чисел
  print(maxOfThree(10, 25, 15));

  // 2. Сумма элементов списка
  print(sumList([1, 2, 3, 4, 5]));

  // 3. Произведение элементов списка
  print(productList([1, 2, 3, 4, 5]));

  // 4. Удаление повторяющихся элементов
  print(uniqueList([1, 2, 2, 3, 4, 4, 5]));

  // 5. Факториал числа
  print(factorial(5));

  // 6. Проверка вхождения элемента в список
  print(containsElement([1, 2, 3, 4, 5], 67));

  // 7. Вывод элементов с нечетным индексом
  oddIndexElements([10, 20, 30, 40, 50, 60]);

  // 8. Инвертирование списка
  print(reverseList([1, 2, 3, 4, 5]));

  // 9. Среднее арифметическое
  print(averageList([2, 4, 6, 8]));

  // 10. Количество вхождений
  print(countOccurrences([1, 2, 3, 2, 2, 4], 2));
}

// 1. Максимум из трех чисел
int maxOfThree(int a, int b, int c) {
  if (a >= b && a >= c) return a;
  if (b >= a && b >= c) return b;
  return c;
}

// 2. Сумма элементов списка
int sumList(List<int> list) {
  int sum = 0;
  for (int i = 0; i < list.length; i++) {
    sum += list[i];
  }
  return sum;
}

// 3. Произведение элементов списка
int productList(List<int> list) {
  int product = 1;
  for (int i = 0; i < list.length; i++) {
    product *= list[i];
  }
  return product;
}

// 4. Удаление повторяющихся элементов
List<int> uniqueList(List<int> list) {
  Set<int> set = {};
  for (int i = 0; i < list.length; i++) {
    set.add(list[i]);
  }
  return set.toList();
}

// 5. Факториал числа
int factorial(int n) {
  int result = 1;
  for (int i = 2; i <= n; i++) {
    result *= i;
  }
  return result;
}

// 6. Проверка вхождения элемента в список
bool containsElement(List<int> list, int element) {
  for (int i = 0; i < list.length; i++) {
    if (list[i] == element) return true;
  }
  return false;
}

// 7. Вывод элементов с нечетным индексом
void oddIndexElements(List<int> list) {
  for (int i = 0; i < list.length; i++) {
    if (i % 2 != 0) {
      print(list[i]);
    }
  }
}

// 8. Инвертирование списка
List<int> reverseList(List<int> list) {
  List<int> reversed = [];
  for (int i = list.length - 1; i >= 0; i--) {
    reversed.add(list[i]);
  }
  return reversed;
}

// 9. Среднее арифметическое
double averageList(List<int> list) {
  int sum = 0;
  for (int i = 0; i < list.length; i++) {
    sum += list[i];
  }
  return sum / list.length;
}

// 10. Количество вхождений значения в список
int countOccurrences(List<int> list, int value) {
  int count = 0;
  for (int i = 0; i < list.length; i++) {
    if (list[i] == value) count++;
  }
  return count;
}