import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_tiket/const.dart';
import 'package:project_tiket/model/film.dart';
import 'package:project_tiket/screen/pilih_tiket_view.dart';
import 'package:project_tiket/service/filmService.dart';
import 'package:http/http.dart' as http;

class FilmDetail extends StatelessWidget {
  //API
  Future getColab() async {
    // mengambil data join table
    var params = "function=get_colab";
    var response = await http.get(Uri.parse(pallete.sUrl + params));
    // print(json.decode(response.body));
    return json.decode(response.body);
  }

  Future getJadwal() async {
    //mengambil data jadwal
    var params = "function=get_jadwal";
    var response = await http.get(Uri.parse(pallete.sUrl + params));
    // print(json.decode(response.body));
    return json.decode(response.body);
  }

  //END API

  final Map Movie; // pemanggil api sebelumnya

  FilmDetail({required this.Movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfF1C1D27),
      body: Stack(
        children: [
          Opacity(
              opacity: 0.4,
              child: Image.network(
                Movie['Poster'],
                height: 213,
                width: double.infinity,
                fit: BoxFit.fill,
              )),
          SingleChildScrollView(
            child: SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Icon(
                                Icons.arrow_back_ios_new,
                                color: Colors.white,
                                size: 30,
                              ))
                        ]),
                  ),
                  SizedBox(height: 120),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 8,
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network(
                              Movie['Poster'],
                              height: 189,
                              width: 132,
                            ),
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(left: 10, top: 20),
                            height: 180,
                            width: 230,
                            decoration:
                                BoxDecoration(color: Colors.transparent),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(0),
                                  child: Wrap(
                                    children: [
                                      Text(
                                        Movie['Judul'],
                                        style: GoogleFonts.openSans(
                                          color: Colors.white,
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Row(
                                    children: [
                                      Text(
                                        'Sutradara',
                                        style: GoogleFonts.openSans(
                                          color: Colors.white38,
                                          fontSize: 12,
                                          fontWeight: FontWeight.normal,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                      SizedBox(
                                        width: 60,
                                      ),
                                      Text(
                                        Movie['Sutradara'],
                                        style: GoogleFonts.openSans(
                                          color: Colors.white38,
                                          fontSize: 12,
                                          fontWeight: FontWeight.normal,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Row(
                                    children: [
                                      Text(
                                        'Durasi',
                                        style: GoogleFonts.openSans(
                                          color: Colors.white38,
                                          fontSize: 12,
                                          fontWeight: FontWeight.normal,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                      SizedBox(
                                        width: 78,
                                      ),
                                      Text(
                                        Movie['Durasi'],
                                        style: GoogleFonts.openSans(
                                          color: Colors.white38,
                                          fontSize: 12,
                                          fontWeight: FontWeight.normal,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Row(
                                    children: [
                                      Text(
                                        'Genre',
                                        style: GoogleFonts.openSans(
                                          color: Colors.white38,
                                          fontSize: 12,
                                          fontWeight: FontWeight.normal,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                      SizedBox(
                                        width: 80,
                                      ),
                                      Text(
                                        Movie['Genre'],
                                        style: GoogleFonts.openSans(
                                          color: Colors.white38,
                                          fontSize: 12,
                                          fontWeight: FontWeight.normal,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Row(
                                    children: [
                                      Text(
                                        'Aktor',
                                        style: GoogleFonts.openSans(
                                          color: Colors.white38,
                                          fontSize: 12,
                                          fontWeight: FontWeight.normal,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                      SizedBox(
                                        width: 85,
                                      ),
                                      Text(
                                        Movie['Aktor'],
                                        style: GoogleFonts.openSans(
                                          color: Colors.white38,
                                          fontSize: 12,
                                          fontWeight: FontWeight.normal,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'SINOPSIS',
                          style: GoogleFonts.openSans(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          Movie['Sinopsis'],
                          style: GoogleFonts.openSans(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'JADWAL',
                          style: GoogleFonts.openSans(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  // dropdown button
                  FutureBuilder(
                      future: getColab(),
                      builder: (context, snapshot) {
                        return Container(
                          height: 1000,
                          child: ListView.builder(
                              itemCount: snapshot.data["data"].length,
                              padding: EdgeInsets.only(left: 20),
                              scrollDirection: Axis.vertical,
                              itemBuilder: (context, index) {
                                return Container(
                                  margin: EdgeInsets.only(right: 20),
                                  child: Column(
                                    children: <Widget>[
                                      Stack(
                                        children: <Widget>[
                                          Container(
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 20),
                                              child: Column(
                                                children: [
                                                  Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Icon(
                                                        Icons.villa_outlined,
                                                        color: Colors.white,
                                                      ),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      Text(
                                                        snapshot.data["data"]
                                                                [index]
                                                            ['Nama_studio'],
                                                        style: GoogleFonts
                                                            .openSans(
                                                          color: Colors.white,
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                        textAlign:
                                                            TextAlign.left,
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                        width: 5,
                                                      ),
                                                      Text(
                                                        snapshot.data["data"]
                                                                [index]
                                                            ['alamat_studio'],
                                                        style: GoogleFonts
                                                            .openSans(
                                                          color: Colors.white,
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                        textAlign:
                                                            TextAlign.left,
                                                      ),
                                                    ],
                                                  ),
                                                  GestureDetector(
                                                    onTap: () {
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  PilihTiketView()));
                                                    },
                                                    child:Container(
                                                    child: Row(
                                                      children: [
                                                        Chip(
                                                          label: Text(snapshot
                                                                      .data[
                                                                  "data"][index]
                                                              ['Jam_mulai']),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                );
                              }),
                        );
                      }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


// SizedBox(
                  //   height: 10,
                  // ),
                 
                  //   child: Container(
                  //     padding: EdgeInsets.only(left: 15),
                  //     child: Row(
                  //       mainAxisAlignment: MainAxisAlignment.start,
                  //       children: [
                  //         Chip(
                  //           label: Text('10.00'),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),