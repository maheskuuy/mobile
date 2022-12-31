import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_tiket/model/film.dart';
import 'package:project_tiket/service/filmService.dart';

class FilmDetail extends StatelessWidget {
  final Map product;

  FilmDetail({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
        backgroundColor: Color(0xfF1C1D27),
        body: Column(
          children: [
            Container(
              height: 230,
              width: 370,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(product['Poster']),
                      fit: BoxFit.fill,
                      opacity: 150)),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Padding(padding: EdgeInsets.only(left: 10)),
                 Text("Sinopsis",
                style: GoogleFonts.openSans(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
                ),
              ],
            ),           
            SizedBox(height: 20),
            Text(product['Sinopsis'],
                style: GoogleFonts.openSans(
                  color: Colors.white54,
                  fontSize: 15,
                )),
            SizedBox(height: 20),
            Text('Aktor:',
                style: GoogleFonts.openSans(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w700)),
            Text(product['Aktor'],
                style: GoogleFonts.openSans(
                  color: Colors.white,
                  fontSize: 15,
                )),
          ],
        ));
  }
}
