class Stock {
  List<Map<String, dynamic>> data = [
    {"kode_makanan": 0, "kode_cabang": 0, "jumlah_barang": 83},
    {"kode_makanan": 1, "kode_cabang": 0, "jumlah_barang": 100},
    {"kode_makanan": 2, "kode_cabang": 0, "jumlah_barang": 321},
    {"kode_makanan": 3, "kode_cabang": 0, "jumlah_barang": 213},
    {"kode_makanan": 4, "kode_cabang": 0, "jumlah_barang": 152},
    {"kode_makanan": 5, "kode_cabang": 0, "jumlah_barang": 54},
    {"kode_makanan": 6, "kode_cabang": 0, "jumlah_barang": 83},
    {"kode_makanan": 7, "kode_cabang": 0, "jumlah_barang": 14},
    {"kode_makanan": 8, "kode_cabang": 0, "jumlah_barang": 53},
    {"kode_makanan": 9, "kode_cabang": 0, "jumlah_barang": 94},
    {"kode_makanan": 10, "kode_cabang": 0, "jumlah_barang": 121},
    {"kode_makanan": 11, "kode_cabang": 0, "jumlah_barang": 100},

    {"kode_makanan": 0, "kode_cabang": 1, "jumlah_barang": 83},
    {"kode_makanan": 1, "kode_cabang": 1, "jumlah_barang": 100},
    {"kode_makanan": 2, "kode_cabang": 1, "jumlah_barang": 321},
    {"kode_makanan": 3, "kode_cabang": 1, "jumlah_barang": 213},
    {"kode_makanan": 4, "kode_cabang": 1, "jumlah_barang": 152},
    {"kode_makanan": 5, "kode_cabang": 1, "jumlah_barang": 54},
    {"kode_makanan": 6, "kode_cabang": 1, "jumlah_barang": 83},
    {"kode_makanan": 7, "kode_cabang": 1, "jumlah_barang": 14},
    {"kode_makanan": 8, "kode_cabang": 1, "jumlah_barang": 53},
    {"kode_makanan": 9, "kode_cabang": 1, "jumlah_barang": 94},
    {"kode_makanan": 10, "kode_cabang": 1, "jumlah_barang": 121},
    {"kode_makanan": 11, "kode_cabang": 1, "jumlah_barang": 100},

    {"kode_makanan": 0, "kode_cabang": 2, "jumlah_barang": 83},
    {"kode_makanan": 1, "kode_cabang": 2, "jumlah_barang": 100},
    {"kode_makanan": 2, "kode_cabang": 2, "jumlah_barang": 321},
    {"kode_makanan": 3, "kode_cabang": 2, "jumlah_barang": 213},
    {"kode_makanan": 4, "kode_cabang": 2, "jumlah_barang": 152},
    {"kode_makanan": 5, "kode_cabang": 2, "jumlah_barang": 54},
    {"kode_makanan": 6, "kode_cabang": 2, "jumlah_barang": 83},
    {"kode_makanan": 7, "kode_cabang": 2, "jumlah_barang": 14},
    {"kode_makanan": 8, "kode_cabang": 2, "jumlah_barang": 53},
    {"kode_makanan": 9, "kode_cabang": 2, "jumlah_barang": 94},
    {"kode_makanan": 10, "kode_cabang": 2, "jumlah_barang": 121},
    {"kode_makanan": 11, "kode_cabang": 2, "jumlah_barang": 100},

    {"kode_makanan": 0, "kode_cabang": 3, "jumlah_barang": 83},
    {"kode_makanan": 1, "kode_cabang": 3, "jumlah_barang": 100},
    {"kode_makanan": 2, "kode_cabang": 3, "jumlah_barang": 321},
    {"kode_makanan": 3, "kode_cabang": 3, "jumlah_barang": 213},
    {"kode_makanan": 4, "kode_cabang": 3, "jumlah_barang": 152},
    {"kode_makanan": 5, "kode_cabang": 3, "jumlah_barang": 54},
    {"kode_makanan": 6, "kode_cabang": 3, "jumlah_barang": 83},
    {"kode_makanan": 7, "kode_cabang": 3, "jumlah_barang": 14},
    {"kode_makanan": 8, "kode_cabang": 3, "jumlah_barang": 53},
    {"kode_makanan": 9, "kode_cabang": 3, "jumlah_barang": 94},
    {"kode_makanan": 10, "kode_cabang": 3, "jumlah_barang": 121},
    {"kode_makanan": 11, "kode_cabang": 3, "jumlah_barang": 100},
  ];

  int getJumlah(int kodeCabang, int kodeMakanan) {
    var result = data.firstWhere(
      (e) => e["kode_cabang"] == kodeCabang && e["kode_makanan"] == kodeMakanan,
      orElse: () => {"jumlah_barang": 0},
    );
    return result["jumlah_barang"];
  }
}
