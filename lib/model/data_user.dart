// To parse this JSON data, do
//
//     final dtUser = dtUserFromJson(jsonString);

import 'dart:convert';

List<DtUser> dtUserFromJson(String str) => List<DtUser>.from(json.decode(str).map((x) => DtUser.fromJson(x)));

String dtUserToJson(List<DtUser> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DtUser {
    DtUser({
        required this.idUser,
        required this.username,
        required this.password,
        required this.email,
        required this.kontak,
        required this.alamat,
        required this.level,
    });

    String idUser;
    String username;
    String password;
    String email;
    String kontak;
    String alamat;
    String level;

    factory DtUser.fromJson(Map<String, dynamic> json) => DtUser(
        idUser: json["Id_user"],
        username: json["Username"],
        password: json["Password"],
        email: json["Email"],
        kontak: json["Kontak"],
        alamat: json["Alamat"],
        level: json["level"],
    );

    Map<String, dynamic> toJson() => {
        "Id_user": idUser,
        "Username": username,
        "Password": password,
        "Email": email,
        "Kontak": kontak,
        "Alamat": alamat,
        "level": level,
    };
}
