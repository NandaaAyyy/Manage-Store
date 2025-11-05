class Transaksi {
  final int? id;
  final String kategori;
  final double nominal;
  final String keterangan;
  final String tanggal;

  Transaksi({
    this.id,
    required this.kategori,
    required this.nominal,
    required this.keterangan,
    required this.tanggal,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'kategori': kategori,
      'nominal': nominal,
      'keterangan': keterangan,
      'tanggal': tanggal,
    };
  }
}
