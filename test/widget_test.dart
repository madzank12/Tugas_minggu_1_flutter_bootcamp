void main() {
  List<int> dataList = [3, 18, 45, 16, 2, 5, 7, 9, 10, 1, 16, 11, 4, 8, 11, 16, 32, 56];
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
  double mean = dataList.fold(0, (mean, element) => mean + element / dataList.length);
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
  // output & logic sudah sesuai dan benar
  // for (int i = 0; i < angka.length; i++) {
  //   for (int j = 0; j < angka.length - 1; j++) {
  //     if (angka[j] > angka[j + 1]) {
  //       int num = angka[j];
  //       angka[j] = angka[j + 1];
  //       angka[j + 1] = num;
  //     }
  //   }
  // }
  // return angka;

  // alternatif
  // bisa manfaatin fungsi sort yaa
  angka.sort();
  return angka;
}

descending(List<int> angka) {
  // output & logic sudah sesuai dan benar
  // for (int i = 0; i < angka.length; i++) {
  //   for (int j = 0; j < angka.length - 1; j++) {
  //     if (angka[j] < angka[j + 1]) {
  //       int num = angka[j];
  //       angka[j] = angka[j + 1];
  //       angka[j + 1] = num;
  //     }
  //   }
  // }
  // return angka;

  // alternatif
  // bisa manfaatin fungsi sort juga & reversed yaa
  angka.sort();
  return angka.reversed.toList();
}

modus(List<int> angka) {
  // output & logic sudah sesuai dan benar, tapi ada yg kurang pada definisi modus itu sendiri
  // modus adalah nilai yg PALING banyak muncul -> ini artinya cuma 1 data
  // maka jika data array memiliki 2 nilai yang sama banyak, bisa di bilang tidak memiliki modus
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

  // tambahkan ini
  if (hasil.length == 1) {
    return hasil;
  } else {
    return "TIDAK ADA MODUS";
  }

  // alternatif lain
  // jangan lupa di buka comment fungsi modus()
  // return modus(data);
}

/*
modus(List<int> data) {
  data.sort();

  List<Map<int, int>> dataMap = [];
  List<Map<int, int>> fixDataMap = [];

  for (int i = 0; i < data.length; i++) {
    int total = 0;
    for (int j = 0; j < data.length; j++) {
      if (data[i] == data[j]) {
        total++;
      }
    }
    dataMap.add({data[i]: total});
  }

  for (int i = 0; i < dataMap.length; i++) {
    if (i > 0) {
      if (const DeepCollectionEquality().equals(dataMap[i], dataMap[i - 1])) {
        continue;
      } else {
        fixDataMap.add(dataMap[i]);
      }
    } else {
      fixDataMap.add(dataMap[i]);
    }
  }

  print("Data Map dengan banyaknya data");
  print(fixDataMap);

  List<int> keyData = [];
  List<int> valueData = [];

  for (int i = 0; i < fixDataMap.length; i++) {
    keyData.add(fixDataMap[i].keys.first);
    valueData.add(fixDataMap[i].values.first);
  }

  print("\nExtract Data Map");
  print("Nilai : $keyData");
  print("Banyak : $valueData");
  print("\n--------------------------\nKESIMPULAN\n");

  int maksimalData = valueData[0];

  for (var i = 0; i < valueData.length; i++) {
    if (valueData[i] > maksimalData) {
      maksimalData = valueData[i];
    }
  }

  // print(maksimalData);

  int totalMaksimalData = 0;
  for (var item in valueData) {
    if (item == maksimalData) {
      totalMaksimalData++;
    }
  }

  maksimalData = valueData[0];
  int indexMaksimalData = 0;

  if (totalMaksimalData != 1) {
    return "TIDAK ADA MODUS";
  } else {
    for (var i = 0; i < valueData.length; i++) {
      if (valueData[i] > maksimalData) {
        maksimalData = valueData[i];
        indexMaksimalData = i;
      }
    }

    return "Nilai yang sering muncul : ${keyData[indexMaksimalData]}\nSebanyak : ${valueData[indexMaksimalData]} x";
  }
}
*/