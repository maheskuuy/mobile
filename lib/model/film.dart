// // To parse this JSON data, do
// //
// //     final film = filmFromJson(jsonString);

// import 'dart:convert';

// List<Film> filmFromJson(String str) => List<Film>.from(json.decode(str).map((x) => Film.fromJson(x)));

// String filmToJson(List<Film> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class Film {
//     Film({
//         required this.idFilm,
//         required this.judul,
//         required this.sutradara,
//         required this.durasi,
//         required this.genre,
//         required this.sinopsis,
//         required this.aktor,
//         required this.poster,
//     });

//     String idFilm;
//     String judul;
//     String sutradara;
//     String durasi;
//     String genre;
//     String sinopsis;
//     String aktor;
//     String poster;

//     factory Film.fromJson(Map<String, dynamic> json) => Film(
//         idFilm: json["Id_film"],
//         judul: json["Judul"],
//         sutradara: json["Sutradara"],
//         durasi: json["Durasi"],
//         genre: json["Genre"],
//         sinopsis: json["Sinopsis"],
//         aktor: json["Aktor"],
//         poster: json["Poster"],
//     );

//     Map<String, dynamic> toJson() => {
//         "Id_film": idFilm,
//         "Judul": judul,
//         "Sutradara": sutradara,
//         "Durasi": durasi,
//         "Genre": genre,
//         "Sinopsis": sinopsis,
//         "Aktor": aktor,
//         "Poster": poster,
//     };
// }
