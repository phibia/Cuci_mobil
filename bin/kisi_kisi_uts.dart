import 'dart:io';

Map posA = {"plat": null};
Map posB = {"plat": null};
Map posC = {"plat": null};

List waitingList = [];

void garis() {
  print("==============================");
}

// 1. Tambah mobil
void tambahMobil() {
  stdout.write("Plat Kendaraan: ");
  String plat = stdin.readLineSync()!;

  if (posA["plat"] == null) {
    posA["plat"] = plat;
    print("Mobil masuk ke Pos A");
  } else if (posB["plat"] == null) {
    posB["plat"] = plat;
    print("Mobil masuk ke Pos B");
  } else if (posC["plat"] == null) {
    posC["plat"] = plat;
    print("Mobil masuk ke Pos C");
  } else {
    waitingList.add(plat);
    print("Semua pos penuh.");
    print("Mobil masuk ke Waiting List.");
  }
}

// 2. Lihat Waiting List
void lihatWaitingList() {
  garis();
  print("WAITING LIST");

  if (waitingList.isEmpty) {
    print("Waiting List kosong.");
  } else {
    for (var plat in waitingList) {
      print(plat);
    }
  }

  garis();
}

// 3. Lihat Pos
void lihatPos() {
  garis();
  print("KONDISI POS");

  print("Pos A : ${posA["plat"]}");
  print("Pos B : ${posB["plat"]}");
  print("Pos C : ${posC["plat"]}");

  garis();
}

// 4. Selesaikan Pos
void selesaikanPos() {
  stdout.write("Pilih Pos (A/B/C): ");
  String pilih = stdin.readLineSync()!.toUpperCase();

  if (pilih == "A") {
    print("Mobil di Pos A: ${posA["plat"]}");

    posA["plat"] = null;

    if (waitingList.isNotEmpty) {
      posA["plat"] = waitingList[0];
      waitingList.removeAt(0);
      print("Mobil dari Waiting List masuk ke Pos A.");
    }
  } else if (pilih == "B") {
    print("Mobil di Pos B: ${posB["plat"]}");

    posB["plat"] = null;

    if (waitingList.isNotEmpty) {
      posB["plat"] = waitingList[0];
      waitingList.removeAt(0);
      print("Mobil dari Waiting List masuk ke Pos B.");
    }
  } else if (pilih == "C") {
    print("Mobil di Pos C: ${posC["plat"]}");

    posC["plat"] = null;

    if (waitingList.isNotEmpty) {
      posC["plat"] = waitingList[0];
      waitingList.removeAt(0);
      print("Mobil dari Waiting List masuk ke Pos C.");
    }
  } else {
    print("Pos tidak tersedia.");
  }
}

// Menu
void tampilMenu() {
  garis();
  print("       WASH & CLEAN");
  garis();

  print("1. Tambah Mobil");
  print("2. Lihat Waiting List");
  print("3. Lihat Pos");
  print("4. Selesaikan Pos");
  print("5. Keluar");

  garis();
}

// Program utama
void main() {
  bool jalan = true;

  while (jalan == true) {
    tampilMenu();

    stdout.write("Pilih Menu (1/2/3/4/5): ");
    int pilih = int.parse(stdin.readLineSync()!);

    switch (pilih) {
      case 1:
        tambahMobil();
        break;

      case 2:
        lihatWaitingList();
        break;

      case 3:
        lihatPos();
        break;

      case 4:
        selesaikanPos();
        break;

      case 5:
        jalan = false;
        print("Terima kasih.");
        break;

      default:
        print("Menu tidak tersedia.");
    }
  }
}