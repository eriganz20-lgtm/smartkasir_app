// Model data representasi entitas Pelanggan / Member pada aplikasi SmartKasir
class Pelanggan {
  // Kunci primer unik auto-increment basis data SQLite
  final int? id;
  // Kode unik identitas member pelanggan (Contoh: CUST-001)
  final String kodePelanggan;
  // Nama lengkap pelanggan atau nama usaha binaan
  final String namaPelanggan;
  // Nomor kontak aktif WhatsApp pelanggan
  final String nomorWa;
  // Alamat domisili fisik pelanggan atau titik pengantaran barang
  final String alamat;
  // Koordinat garis lintang GPS (nullable jika belum diset)
  final double? latitude;
  // Koordinat garis bujur GPS (nullable jika belum diset)
  final double? longitude;
  // Catatan waktu pendaftaran pelanggan
  final String createdAt;

  // Konstruktor utama kelas Pelanggan
  Pelanggan({
    this.id,
    required this.kodePelanggan,
    required this.namaPelanggan,
    required this.nomorWa,
    required this.alamat,
    this.latitude,
    this.longitude,
    required this.createdAt,
  });

  // Mengonversi objek Pelanggan menjadi Map untuk operasi simpan ke SQLite
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'kode_pelanggan': kodePelanggan,
      'nama_pelanggan': namaPelanggan,
      'nomor_wa': nomorWa,
      'alamat': alamat,
      'latitude': latitude,
      'longitude': longitude,
      'created_at': createdAt,
    };
  }

  // Mengonversi baris Map dari tabel SQLite kembali menjadi objek Pelanggan
  factory Pelanggan.fromMap(Map<String, dynamic> map) {
    return Pelanggan(
      id: map['id'] as int?,
      kodePelanggan: map['kode_pelanggan'] as String? ?? '',
      namaPelanggan: map['nama_pelanggan'] as String? ?? '',
      nomorWa: map['nomor_wa'] as String? ?? '',
      alamat: map['alamat'] as String? ?? '',
      latitude: map['latitude'] != null
          ? (map['latitude'] as num).toDouble()
          : null,
      longitude: map['longitude'] != null
          ? (map['longitude'] as num).toDouble()
          : null,
      createdAt: map['created_at'] as String? ?? '',
    );
  }

  // Helper: apakah pelanggan sudah memiliki titik koordinat GPS
  bool get hasLocation => latitude != null && longitude != null;

  // Helper: koordinat dalam format teks ringkas
  String get coordinateText {
    if (hasLocation) {
      return '${latitude!.toStringAsFixed(6)}, ${longitude!.toStringAsFixed(6)}';
    }
    return 'Belum terekam';
  }
}
