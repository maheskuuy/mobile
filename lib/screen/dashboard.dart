import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:project_tiket/account.dart';
import 'package:project_tiket/const.dart';
import 'package:project_tiket/main.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_tiket/model/film.dart';
import 'package:project_tiket/models/NowShowing.dart';
import 'package:project_tiket/models/film_detail.dart';
import 'package:project_tiket/screen/login.dart';
import 'package:project_tiket/screen/search.dart';
import 'package:project_tiket/service/filmService.dart';

class dashboard extends StatefulWidget {
  const dashboard({super.key});

  @override
  State<dashboard> createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {

  Future getFilm() async {
    //mengambil data film
    var params = "function=get_film";
    var response = await http.get(Uri.parse(pallete.sUrl + params));
    // print(json.decode(response.body));
    return json.decode(response.body);
  }

  //bottom navigation bar
  int _selectedNavbar = 0;

  void _changeSelectedNavBar(int index) {
    setState(() {
      _selectedNavbar = index;
    });
  }
  // end

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xfF1C1D27),
      appBar: AppBar(
        backgroundColor: Color(0xfF1C1D27),
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.push(
              context, MaterialPageRoute(builder: (context) => (Profile())));
          },
          child: Container(
          padding: EdgeInsets.all(8),
          width: 58,
          child: CircleAvatar(   
            backgroundImage: AssetImage(
              'assets/images/man2.png'
            )
          ),
        ),
        ),
        
        //title
        centerTitle: true,
        title: Text('Hello, Azriel!'),
        foregroundColor: Colors.white,
        //action search
        actions: <Widget>[
          IconButton(
            icon: new Icon(Icons.search, color: Colors.white),
            onPressed: () {
              Navigator.push(context,
                          MaterialPageRoute(builder: (context) => searchPage()));
            },
          ),
          //action notification
          // IconButton(
          //   icon: new Icon(Icons.notifications_none, color: Colors.white),
          //   onPressed: () {},
          // ),
        ],
      ),
      //bottom navigation
      // bottomNavigationBar: BottomNavigationGM(),
      body: FutureBuilder(
          future: getFilm(),
          builder: (context, snapshot) {
            return Center(
              child: Container(
                child: ListView(
                  physics: ClampingScrollPhysics(),
                  children: <Widget>[
                    //Location

                    Padding(
                      padding: EdgeInsets.only(
                          top: 15, left: 16, right: 16, bottom: 20),
                      child: Text(
                        'Jember, Jawa Timur',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),

                    //SEDANG TAYANG
                    SizedBox(height: 10),
                    Padding(
                      padding: EdgeInsets.only(left: 16, right: 16, bottom: 5),
                      child: Text(
                        'Now Showing',
                        style: GoogleFonts.openSans(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 24,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 320,
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
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      FilmDetail(
                                                        Movie: snapshot
                                                                .data["data"]
                                                            [index],
                                                      )));
                                        },
                                        child: Container(
                                          height: 320,
                                          width: 200,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                  snapshot.data["data"][index]
                                                      ['Poster']),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 8,
                                        left: 8,
                                        child: Text(
                                          snapshot.data["data"][index]['Judul'],
                                          style: GoogleFonts.openSans(
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white,
                                              fontSize: 14,
                                              backgroundColor: Colors.black),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            );
                          }),
                    ),
                    //COMING SOON
                    SizedBox(height: 10),
                    Padding(
                      padding: EdgeInsets.only(left: 16, right: 16, bottom: 5),
                      child: Text(
                        'Coming Soon',
                        style: GoogleFonts.openSans(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 24,
                        ),
                      ),
                    ),
                    Container(
                      height: 320,
                      child: ListView.builder(
                          itemCount: showing.length,
                          padding: EdgeInsets.only(left: 0),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.only(right: 0),
                              width: 200,
                              child: Column(
                                children: <Widget>[
                                  Stack(
                                    children: <Widget>[
                                      Container(
                                        height: 320,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  showing[index].image),
                                              fit: BoxFit.cover),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 8,
                                        left: 8,
                                        child: Text(
                                          showing[index].nama,
                                          style: GoogleFonts.openSans(
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white,
                                              fontSize: 14),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            );
                          }),
                    ),
                  ],
                ),
              ),
            );
          }),

      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: ('Beranda'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.movie),
            label: ('Tiket'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.villa),
            label: ('Bioskop'),
          ),
        ],
        currentIndex: _selectedNavbar,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        onTap: _changeSelectedNavBar,
        backgroundColor: Colors.transparent,
        elevation: 5,
      ),
    );
  }
}
