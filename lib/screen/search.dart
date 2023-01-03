import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class searchPage extends StatefulWidget {
  const searchPage({super.key});

  @override
  State<searchPage> createState() => _searchPageState();
}

class _searchPageState extends State<searchPage> {

void UpdateList(String value){
  //fungsi untuk memfilter film
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfF1C1D27),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.0),
              TextField(
                style: GoogleFonts.openSans(color: Colors.black),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey.shade400,
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                  ),
                  hintText: "eg: Pengabdi Setan 2",
                  suffixIcon: Icon(Icons.search),
                  prefixIconColor: Colors.black,
                ),
              ),
              Expanded(child: ListView())
            ],
          ),
        ),
      ),
    );
  }
}
