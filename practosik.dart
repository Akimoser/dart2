import 'dart:math';

// 1. Кружка и Человек
class Kruzhka {
  int voda = 100;
  void pit() {
    if (voda >= 10) {
      voda -= 10;
      print('Пью, осталось $voda мл');
    } else {
      print('Кружка пуста');
    }
  }
}

class Chelovek {
  String name;
  Chelovek(this.name);
  void pitIzKruzhki(Kruzhka k) {
    print('$name пьет из кружки');
    k.pit();
  }
}

// 2. Шкаф и системы хранения
class Polka {
  List<String> veshi = [];
  void polozhit(String ves) => veshi.add(ves);
  void zabrat(String ves) => veshi.remove(ves);
}

class Shkaf {
  List<Polka> polki = [Polka(), Polka(), Polka()];
  void polozhitVeshi(int numPolki, String ves) {
    polki[numPolki].polozhit(ves);
  }
  void zabratVeshi(int numPolki, String ves) {
    polki[numPolki].zabrat(ves);
  }
}

// 3. Гриф и Блин
class Blin {
  int ves;
  Blin(this.ves);
}

class Grif {
  int maxLoad;
  List<Blin> levo = [];
  List<Blin> pravo = [];
  Grif(this.maxLoad);
  void navesitLevo(Blin b) {
    if (tekuschiVes() + b.ves <= maxLoad) {
      levo.add(b);
    } else {
      print('Перегруз');
    }
  }
  void navesitPravo(Blin b) {
    if (tekuschiVes() + b.ves <= maxLoad) {
      pravo.add(b);
    } else {
      print('Перегруз');
    }
  }
  int tekuschiVes() {
    int sum = 0;
    for (var b in levo) sum += b.ves;
    for (var b in pravo) sum += b.ves;
    return sum;
  }
}

// 4. Конвертация валют
class KonverterValut {
  double kurs;
  KonverterValut(this.kurs);
  double konvert(double summa) => summa * kurs;
}

// 5. Гараж с дженериками
class Garage<T> {
  List<T> objects = [];
  void add(T obj) => objects.add(obj);
  T? get(int index) {
    if (index < objects.length) return objects[index];
    return null;
  }
}

// 6. Класс с перегруженными операциями
class Vector2 {
  int x, y;
  Vector2(this.x, this.y);
  Vector2 operator +(Vector2 other) => Vector2(x + other.x, y + other.y);
  Vector2 operator -(Vector2 other) => Vector2(x - other.x, y - other.y);
  Vector2 operator *(int n) => Vector2(x * n, y * n);
  Vector2 operator ~() => Vector2(-x, -y);
  @override
  String toString() => '($x, $y)';
}

// 7. Автомобиль с перечислениями
enum Sostoianie { stop, edet, povorot }
class Avtomobil {
  Sostoianie sostoianie = Sostoianie.stop;
  void edhat() => sostoianie = Sostoianie.edet;
  void stop() => sostoianie = Sostoianie.stop;
  void povorot() => sostoianie = Sostoianie.povorot;
}

// 8. Геометрические фигуры
abstract class Figura {
  double ploshad();
}
class Pryamougolnik extends Figura {
  double a, b;
  Pryamougolnik(this.a, this.b);
  @override double ploshad() => a * b;
}
class Treugolnik extends Figura {
  double osnovanie, visota;
  Treugolnik(this.osnovanie, this.visota);
  @override double ploshad() => 0.5 * osnovanie * visota;
}
class Okruzhnost extends Figura {
  double radius;
  Okruzhnost(this.radius);
  @override double ploshad() => pi * radius * radius;
}

// 9. Перевод систем счисления
class ConverterSS {
  static String fromDec(int n, int radix) {
    if (radix == 16) return n.toRadixString(16).toUpperCase();
    if (radix == 8) return n.toRadixString(8);
    return n.toString();
  }
  static int toDec(String s, int radix) {
    return int.parse(s, radix: radix);
  }
}

// 10. Список фигур и максимальная площадь
class FiguraList {
  List<Figura> figury = [];
  void add(Figura f) => figury.add(f);
  Figura maxPloshad() {
    double max = 0;
    Figura? maxFig;
    for (var f in figury) {
      if (f.ploshad() > max) {
        max = f.ploshad();
        maxFig = f;
      }
    }
    return maxFig!;
  }
}

// 11. Столовые приборы
class Pribor {
  String name;
  Pribor(this.name);
}
class Vilka extends Pribor {
  Vilka() : super('Вилка');
}
class Lozhka extends Pribor {
  Lozhka() : super('Ложка');
}
class Stol {
  List<Pribor> pribory = [];
  void postavit(Pribor p) => pribory.add(p);
  void ubrat(Pribor p) => pribory.remove(p);
}

// Проверка работы
void main() {
  // 1
  Kruzhka k = Kruzhka();
  Chelovek c = Chelovek('Вася');
  c.pitIzKruzhki(k);
  // 2
  Shkaf shkaf = Shkaf();
  shkaf.polozhitVeshi(0, 'Носки');
  shkaf.zabratVeshi(0, 'Носки');
  // 3
  Grif g = Grif(100);
  g.navesitLevo(Blin(20));
  g.navesitPravo(Blin(30));
  // 4
  KonverterValut usdToRub = KonverterValut(90);
  print('100 USD = ${usdToRub.konvert(100)} RUB');
  // 5
  Garage<String> garage = Garage();
  garage.add('Машина');
  print(garage.get(0));
  // 6
  Vector2 v1 = Vector2(1, 2);
  Vector2 v2 = Vector2(3, 4);
  print(v1 + v2);
  // 7
  Avtomobil a = Avtomobil();
  a.edhat();
  print(a.sostoianie);
  // 8
  Figura f1 = Pryamougolnik(2, 3);
  print(f1.ploshad());
  // 9
  print(ConverterSS.fromDec(255, 16));
  // 10
  FiguraList list = FiguraList();
  list.add(Pryamougolnik(2, 3));
  list.add(Okruzhnost(4));
  print(list.maxPloshad().ploshad());
  // 11
  Stol stol = Stol();
  stol.postavit(Vilka());
  stol.postavit(Lozhka());
  print(stol.pribory.length);
}
