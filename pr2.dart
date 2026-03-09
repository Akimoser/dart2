void main() {
  // Список студентов
  List<String> students = [
    'Иванов',
    'Петров',
    'Сидоров',
    'Козлов',
    'Смирнова',
    'Васильева'
  ];

  // Список предметов
  List<String> subjects = [
    'Математика',
    'Физика',
    'Химия',
    'Информатика'
  ];

  // Оценки: сначала студент, потом предмет
  List<List<int>> grades = [
    [5, 4, 5, 4], // Иванов
    [3, 4, 3, 4], // Петров
    [5, 5, 5, 5], // Сидоров
    [2, 3, 2, 4], // Козлов
    [4, 5, 4, 5], // Смирнова
    [3, 3, 4, 3]  // Васильева
  ];

  // 1. Разделение по среднему баллу
  List<String> excellent = [];      // отличники >=4.5
  List<String> good = [];           // хорошисты 3.5 - 4.5
  List<String> others = [];         // остальные

  for (int i = 0; i < students.length; i++) {
    double sum = 0;
    for (int g in grades[i]) {
      sum += g;
    }
    double avg = sum / subjects.length;
    if (avg >= 4.5) {
      excellent.add(students[i]);
    } else if (avg >= 3.5) {
      good.add(students[i]);
    } else {
      others.add(students[i]);
    }
  }

  print('Отличники: $excellent');
  print('Хорошисты: $good');
  print('Остальные: $others');
  print('');

  // 2. Подсчет каждой оценки
  int count2 = 0, count3 = 0, count4 = 0, count5 = 0;
  for (var studentGrades in grades) {
    for (int g in studentGrades) {
      if (g == 2) count2++;
      else if (g == 3) count3++;
      else if (g == 4) count4++;
      else if (g == 5) count5++;
    }
  }
  print('Оценка 2: $count2 раз');
  print('Оценка 3: $count3 раз');
  print('Оценка 4: $count4 раз');
  print('Оценка 5: $count5 раз');
  print('');

  // 3. Для каждого предмета список студентов с пятеркой
  for (int j = 0; j < subjects.length; j++) {
    List<String> fives = [];
    for (int i = 0; i < students.length; i++) {
      if (grades[i][j] == 5) {
        fives.add(students[i]);
      }
    }
    print('${subjects[j]}: студенты с пятеркой $fives');
  }
  print('');

  // 4. Предметы без двоек
  List<String> noTwos = [];
  for (int j = 0; j < subjects.length; j++) {
    bool hasTwo = false;
    for (int i = 0; i < students.length; i++) {
      if (grades[i][j] == 2) {
        hasTwo = true;
        break;
      }
    }
    if (!hasTwo) {
      noTwos.add(subjects[j]);
    }
  }
  print('Предметы без двоек: $noTwos');
  print('');

  // 5. Предмет с наибольшим количеством двоек
  int maxTwos = -1;
  String worstSubject = '';
  for (int j = 0; j < subjects.length; j++) {
    int twos = 0;
    for (int i = 0; i < students.length; i++) {
      if (grades[i][j] == 2) twos++;
    }
    if (twos > maxTwos) {
      maxTwos = twos;
      worstSubject = subjects[j];
    }
  }
  print('Больше всего двоек ($maxTwos) по предмету: $worstSubject');
  print('');

  // 6. Студент(ы) с наибольшим количеством пятерок
  List<int> fivesPerStudent = List.filled(students.length, 0);
  for (int i = 0; i < students.length; i++) {
    for (int g in grades[i]) {
      if (g == 5) fivesPerStudent[i]++;
    }
  }
  int maxFives = 0;
  for (int count in fivesPerStudent) {
    if (count > maxFives) maxFives = count;
  }
  List<String> bestStudents = [];
  for (int i = 0; i < students.length; i++) {
    if (fivesPerStudent[i] == maxFives) {
      bestStudents.add(students[i]);
    }
  }
  print('Студенты с наибольшим количеством пятерок ($maxFives): $bestStudents');
  print('');

  // 7. Для каждого студента предметы с оценкой ниже 4
  for (int i = 0; i < students.length; i++) {
    List<String> lowSubjects = [];
    for (int j = 0; j < subjects.length; j++) {
      if (grades[i][j] < 4) {
        lowSubjects.add(subjects[j]);
      }
    }
    print('${students[i]}: предметов с оценкой ниже 4 - ${lowSubjects.length} (${lowSubjects})');
  }
  print('');

  // 8. Все пары студент-предмет с пятеркой
  List<String> pairs = [];
  for (int i = 0; i < students.length; i++) {
    for (int j = 0; j < subjects.length; j++) {
      if (grades[i][j] == 5) {
        pairs.add('${students[i]} - ${subjects[j]}');
      }
    }
  }
  print('Пары студент-предмет с пятеркой: $pairs');
}