import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_tiket/components/cinema_seat.dart';
import 'package:project_tiket/const.dart';

class PilihTiketView extends StatefulWidget {
   final Map DMovie; // pemanggil api sebelumnya
  bool isReserved;
  bool isSelected;
  
  PilihTiketView({Key? key, this.isSelected = false, this.isReserved = false, required this.DMovie,})
      : super(key: key);


  @override
  State<PilihTiketView> createState() => _PilihTiketViewState();
}

class _PilihTiketViewState extends State<PilihTiketView> {


 Future getFilm() async {
    //mengambil data film
    var params = "function=get_film";
    var response = await http.get(Uri.parse(pallete.sUrl + params));
    // print(json.decode(response.body));
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfF1C1D27),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
        leading: IconButton(
          icon: new Icon(Icons.arrow_back_ios_new, color: Colors.white),
          onPressed: () {},
        ),
        title: Text(
          widget.DMovie['Judul'],
          style: GoogleFonts.openSans(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              //kursi

              SizedBox(height: 30),
              Divider(
                height: 10,
                thickness: 5,
                color: Color(0xfF2B1D85),
                indent: 30,
                endIndent: 30,
              ),
              Container(
                height: 20,
                child: Text(
                  'Layar',
                  style:
                      GoogleFonts.openSans(fontSize: 15, color: Colors.white60),
                ),
              ),
              SizedBox(height: 10),
              FutureBuilder(
                  future: getFilm(),
                  builder: (context, snapshot) {
                    return Container(
                      height: 100,
                      child: ListView.builder(
                          itemCount: snapshot.data["data"].length,
                          padding: EdgeInsets.only(left: 20),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.only(right: 20),
                              child: Column(
                                children: <Widget>[
                                  Stack(
                                    children: <Widget>[
                                      Container(
                                        child: SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Column(
                                            children: <Widget>[
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: <Widget>[
                                                  GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        !widget.isReserved
                                                            ? widget.isSelected =
                                                                !widget
                                                                    .isSelected
                                                            : null;
                                                      });
                                                    },
                                                    child: Container(
                                                      margin: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 4.0,
                                                          vertical: 5.0),
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              9,
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              9,
                                                      decoration: BoxDecoration(
                                                          color: widget
                                                                  .isSelected
                                                              ? Color(
                                                                  0xFF6C61AF)
                                                              : !widget
                                                                      .isSelected
                                                                  ? Color(
                                                                      0xfF514F64)
                                                                  : null,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      5.0)),
                                                      child: Text(snapshot
                                                              .data["data"]
                                                          [index]['Durasi']),
                                                    ),
                                                  ),
                                                ],
                                              ),
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
              //row 1
              Container(
                height: 100,
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ItemStatus(
                      status: "Tersedia",
                      color: Color(0xfF514F64),
                    ),
                    ItemStatus(
                      status: "Tidak tersedia",
                      color: Color(0xfF282633),
                    ),
                    ItemStatus(
                      status: "Dipilih",
                      color: Color(0xFF6C61AF),
                    ),
                  ],
                ),
              ),
              Container(
                height: 110,
                decoration: BoxDecoration(
                  color: Color(0xFf272944),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class ItemStatus extends StatelessWidget {
  ItemStatus({
    Key? key,
    required this.status,
    required this.color,
  }) : super(key: key);

  final String status;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 25,
          width: 25,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        SizedBox(width: 7),
        Text(
          status,
          style: TextStyle(
            fontSize: 12,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

