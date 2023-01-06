import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_tiket/components/cinema_seat.dart';
import 'package:project_tiket/const.dart';
import 'package:project_tiket/screen/transaksi.dart';
import 'package:project_tiket/service/datatransaksi.dart';

class PilihTiketView extends StatefulWidget {
  final Map DMovie; // pemanggil api sebelumnya
  bool isReserved;
  bool isSelected;
  var indexkursi = 0;

  PilihTiketView({
    Key? key,
    this.isSelected = false,
    this.isReserved = false,
    required this.DMovie,
  }) : super(key: key);

  @override
  State<PilihTiketView> createState() => _PilihTiketViewState();
}

class _PilihTiketViewState extends State<PilihTiketView> {
  var order_time=DateTime.now();
  void createDataTransaksi() {
    transaksiService()
        .add_transaksi('', order_time.toString(), '5',
           widget.DMovie['Id_jadwal'], widget.DMovie['Id_studio'])
        .then((value) {
      setState(() {
      });
    });
  }

  int selectedIndex = -1;
  Future getFilm() async {
    //mengambil data film
    var params = "function=get_film";
    var response = await http.get(Uri.parse(pallete.sUrl + params));
    // print(json.decode(response.body));
    return json.decode(response.body);
  }

  //API jadwal kursi
  Future getjdwl_kursi() async {
    //mengambil data film
    var params = "function=getJdwl_kursi&idJdwl=" +
        widget.DMovie['Id_jadwal'] +
        "&idStudio=" +
        widget.DMovie['Id_studio'];
    var response = await http.get(Uri.parse(pallete.sUrl + params));
    // print(json.decode(response.body));
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    getjdwl_kursi();
    return Scaffold(
      backgroundColor: Color(0xfF1C1D27),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
        leading: IconButton(
          icon: new Icon(Icons.arrow_back_ios_new, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
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
          Container(
            child: ListView(
              physics: ClampingScrollPhysics(),
              children: <Widget>[
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
                        style: GoogleFonts.openSans(
                            fontSize: 15, color: Colors.white60),
                      ),
                    ),
                    SizedBox(height: 10),
                    FutureBuilder(
                        future: getjdwl_kursi(),
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
                                                scrollDirection:
                                                    Axis.horizontal,
                                                child: Column(
                                                  children: <Widget>[
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: <Widget>[
                                                        GestureDetector(
                                                          onTap: () {
                                                            setState(() {
                                                              selectedIndex =
                                                                  index;
                                                                });
                                                          },
                                                          child: Container(
                                                            margin:
                                                                const EdgeInsets
                                                                        .symmetric(
                                                                    horizontal:
                                                                        4.0,
                                                                    vertical:
                                                                        5.0),
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width /
                                                                9,
                                                            height: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width /
                                                                9,
                                                            decoration: BoxDecoration(
                                                                color: selectedIndex ==
                                                                        index
                                                                    ? Color(
                                                                        0xFF6C61AF)
                                                                    : Color(
                                                                        0xfF514F64),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5.0)),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
                                                              child: Text(
                                                                  snapshot.data[
                                                                              "data"]
                                                                          [index]
                                                                      [
                                                                      'No_kursi'],
                                                                  style: GoogleFonts
                                                                      .openSans(
                                                                          color:
                                                                              Colors.white)),
                                                            ),
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
                      height: 70,
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
                      height: 400,
                      width: 1000,
                      decoration: BoxDecoration(
                        color: Color(0xFf272944),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30)),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 120, top: 10),
                            child: Wrap(
                              children: [
                                Icon(
                                  Icons.villa_outlined,
                                  color: Colors.white,
                                  size: 35,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  widget.DMovie['Nama_studio'],
                                  style: GoogleFonts.openSans(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  widget.DMovie['alamat_studio'],
                                  style: GoogleFonts.openSans(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Wrap(
                              children: [
                                Container(
                                  height: 52,
                                  width: 98,
                                  decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          color: Colors.white, width: 1)),
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 3.0),
                                    child: Column(
                                      children: [
                                        Text(
                                          'Jam',
                                          style: GoogleFonts.openSans(
                                              color: Color(0xfF514F64),
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.center,
                                        ),
                                        SizedBox(height: 3),
                                        Text(widget.DMovie['Jam_mulai'],
                                            style: GoogleFonts.openSans(
                                                color: Colors.white,
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold),
                                            textAlign: TextAlign.center),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),

                                //MENAMPILKAN JAM TANGGAL DAN WAKTU

                                Container(
                                  height: 52,
                                  width: 98,
                                  decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          color: Colors.white, width: 1)),
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 3.0),
                                    child: Column(
                                      children: [
                                        Text(
                                          'Tanggal',
                                          style: GoogleFonts.openSans(
                                              color: Color(0xfF514F64),
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.center,
                                        ),
                                        SizedBox(height: 3),
                                        Text(widget.DMovie['Tgl_jadwal'],
                                            style: GoogleFonts.openSans(
                                                color: Colors.white,
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold),
                                            textAlign: TextAlign.center),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),

                          //MENAMPILKAN BANYAK KURSI TERPILIH

                          FutureBuilder(
                            future: getjdwl_kursi(),
                            builder: (context, snapshot) {
                              return Container(
                                height: 20,
                                child: ListView.builder(
                                  itemCount: snapshot.data["data"].length,
                                    padding: const EdgeInsets.only(left: 20),
                                    itemBuilder: (context, index) {
                                    return Row(
                                      children: [
                                        Text(
                                          'kursi terpilih',
                                          style: GoogleFonts.openSans(
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal,
                                            color: Colors.white24,
                                          ),
                                        ),
                                        Flexible(
                                          fit: FlexFit.tight,
                                          child: Padding(
                                            padding: EdgeInsets.only(right: 20),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Text(
                                                  snapshot.data["data"][index]['No_kursi'],
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.bold,
                                                      color: Colors.white),
                                                  maxLines: 1,
                                                  softWrap: false,
                                                  overflow: TextOverflow.fade,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ); 
                                    },                                  
                                ),
                              );
                            }
                          ),
                          SizedBox(
                            height: 10,
                          ),

                          //MENAMPILKAN HARGA

                          Container(
                            height: 20,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Row(
                                children: [
                                  Text(
                                    'Harga',
                                    style: GoogleFonts.openSans(
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.white24,
                                    ),
                                  ),
                                  Flexible(
                                    fit: FlexFit.tight,
                                    child: Padding(
                                      padding: EdgeInsets.only(right: 20),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            widget.DMovie['harga_tiket']
                                                .toString(),
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                            maxLines: 1,
                                            softWrap: false,
                                            overflow: TextOverflow.fade,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),

                          //MENAMPILKAN TOTAL HARGA

                          // Container(
                          //   height: 20,
                          //   child: Padding(
                          //     padding: const EdgeInsets.only(left: 20),
                          //     child: Row(
                          //       children: [
                          //         Text(
                          //           'Total',
                          //           style: GoogleFonts.openSans(
                          //             fontSize: 14,
                          //             fontWeight: FontWeight.normal,
                          //             color: Colors.white24,
                          //           ),
                          //         ),
                          //         Flexible(
                          //           fit: FlexFit.tight,
                          //           child: Padding(
                          //             padding: const EdgeInsets.only(right: 20),
                          //             child: Column(
                          //               mainAxisAlignment:
                          //                   MainAxisAlignment.spaceAround,
                          //               crossAxisAlignment:
                          //                   CrossAxisAlignment.end,
                          //               mainAxisSize: MainAxisSize.min,
                          //               children: const [
                          //                 Text(
                          //                   '+100',
                          //                   style: TextStyle(
                          //                       fontSize: 14,
                          //                       fontWeight: FontWeight.bold,
                          //                       color: Colors.white),
                          //                   maxLines: 1,
                          //                   softWrap: false,
                          //                   overflow: TextOverflow.fade,
                          //                 ),
                          //               ],
                          //             ),
                          //           ),
                          //         ),
                          //       ],
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        createDataTransaksi();
                        Navigator.push(context,
                          MaterialPageRoute(builder: (context) => transaksi()));
                      },
                      child: Container(
                        height: 40,
                        width: 500,
                        color: Color(0XfF425994),
                        child: Center(
                            child: Text(
                          'PESAN',
                          style: GoogleFonts.openSans(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        )),
                      ),
                    ),
                  ],
                ),
              ],
            ),
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
// decoration: BoxDecoration(
//                                                           color: widget
//                                                                   .isSelected
//                                                               ? Color(
//                                                                   0xFF6C61AF)
//                                                               : !widget
//                                                                       .isSelected
//                                                                   ? Color(
//                                                                       0xfF514F64)
//                                                                   : null,
//                                                           borderRadius:
//                                                               BorderRadius
//                                                                   .circular(
//                                                                       5.0)),

