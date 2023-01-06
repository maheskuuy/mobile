class Keranjang {
  final int id;
  final int jumlah;
  final int total_harga;
  final String id_user;
  final String id_jadwal;

  Keranjang({required this.id, required this.jumlah,required this.total_harga,required this.id_user, required this.id_jadwal});

  factory Keranjang.fromJson(Map<String, dynamic> json) {
    return Keranjang(
      id: json['id'] as int,
      jumlah: json['jumlah'] as int,
      total_harga: json['Total_harga'] as int,
      id_user: json['Id_user'] as String,
      id_jadwal: json['Id_jadwal'] as String,
    );
  }
  
  factory Keranjang.fromMap(Map<String, dynamic> map) {
    return Keranjang(
      id: map['id'] as int,
      jumlah: map['jumlah'] as int,
      total_harga: map['Total_harga'] as int,
      id_user: map['Id_user'] as String,
      id_jadwal: map['Id_jadwal'] as String,
    );
  }
  
}