// To parse this JSON data, do
//
//     final bookModels = bookModelsFromJson(jsonString);

import 'dart:convert';

List<BookModels> bookModelsFromJson(String str) => List<BookModels>.from(json.decode(str).map((x) => BookModels.fromJson(x)));

String bookModelsToJson(List<BookModels> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BookModels {
  String? gambar;
  String jenisBuku;
  String judul;
  String penulis;
  dynamic rating;
  String sinopsis;

  BookModels({
    this.gambar,
    required this.jenisBuku,
    required this.judul,
    required this.penulis,
    required this.rating,
    required this.sinopsis,
  });

  factory BookModels.fromJson(Map<String, dynamic> json) => BookModels(
    gambar: json["gambar"],
    jenisBuku: json["jenis_buku"],
    judul: json["judul"],
    penulis: json["penulis"],
    rating: json["rating"],
    sinopsis: json["sinopsis"],
  );

  Map<String, dynamic> toJson() => {
    "gambar": gambar,
    "jenis_buku": jenisBuku,
    "judul": judul,
    "penulis": penulis,
    "rating": rating,
    "sinopsis": sinopsis,
  };
}
