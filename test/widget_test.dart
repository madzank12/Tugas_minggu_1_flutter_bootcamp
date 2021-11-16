void main() {
  List<int> dataList = [
    3,
    18,
    45,
    16,
    2,
    5,
    7,
    9,
    10,
    1,
    16,
    11,
    4,
    8,
    11,
    16,
    32,
    56
  ];
  print("====Tugas Minggu Pertama_FLUTTER BOOTCAMP 1.0====\n");
  //mengurutkan nilai terkecil ke terbesar
  print("Hasil dari Pengurutan Ascending..");
  print(ascending(dataList));
  //mengurutkan nilai besar ke terkecil
  print("Hasil dari Pengurutan Descending ialah..");
  print(descending(dataList));
  print("Hasil dari Modus ialah:..");
  print(modus(dataList));

  //mencari mean
  double mean =
      dataList.fold(0, (mean, element) => mean + element / dataList.length);
  print("Hasil dari perhitungan mean ialah..");
  print(mean);

  //mencari median
  int median;
  int middle = dataList.length ~/ 2;
  if (dataList.length % 2 == 1) {
    median = dataList[middle];
  } else {
    median = ((dataList[middle - 1] + dataList[middle]) / 2.0).round();
  }
  print("Hasil dari perhitungan median ialah..");
  print(median);
}

ascending(List<int> angka) {
  for (int i = 0; i < angka.length; i++) {
    for (int j = 0; j < angka.length - 1; j++) {
      if (angka[j] > angka[j + 1]) {
        int num = angka[j];
        angka[j] = angka[j + 1];
        angka[j + 1] = num;
      }
    }
  }
  return angka;
}

descending(List<int> angka) {
  for (int i = 0; i < angka.length; i++) {
    for (int j = 0; j < angka.length - 1; j++) {
      if (angka[j] < angka[j + 1]) {
        int num = angka[j];
        angka[j] = angka[j + 1];
        angka[j + 1] = num;
      }
    }
  }
  return angka;
}

modus(List<int> angka) {
  List<int> hasilSort = ascending(angka);
  int lengthData = angka.length;
  List<int> total = [];
  List<int> mod = [];
  int k = 1;
  int x = 0;

  // Menghitung berapa kali muncul tiap angka
  for (int i = 0; i < lengthData; i++) {
    total.insert(i, 0);
    for (int j = 0; j < lengthData; j++) {
      if (hasilSort[i] == hasilSort[j]) {
        total[i]++;
      }
    }
  }

  // Menentukan nilai yang paling sering muncul
  for (int i = 0; i < lengthData; i++) {
    if (total[i] > k) {
      k = total[i];
    }
  }

  // Menentukan lokasi nilai yang sering muncul

  for (int i = 0; i < lengthData; i++) {
    if (total[i] == k) {
      mod.insert(x, hasilSort[i]);
    }
  }

  mod.insert(mod.length, 999);

  List<int> hasil = [];
  int z = 0;

  for (int i = 0; i < mod.length - 1; i++) {
    if (mod[i] != mod[i + 1]) {
      hasil.insert(z, mod[i]);
      z++;
    }
  }

  hasil.sort();

  return hasil;
}
