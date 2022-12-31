import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controlers/pilih_tiket_controller.dart';
import 'package:project_tiket/controlers/pilih_tiket_controller.dart';

class PilihTiketView extends GetView<PilihTiketController> {
  final PilihTiketController controller = Get.put(PilihTiketController());
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
          "Pengabdi Setan 2",
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
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          color: Colors.transparent,
                          child: Obx(
                            () => GridView.count(
                              padding: EdgeInsets.all(10),
                              scrollDirection: Axis.horizontal,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10,
                              crossAxisCount: 8,
                              children: List.generate(
                                controller.kursi.length,
                                (index) => Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                      color: ["status"] == "tersedia"
                                          ? Color(0xfF514F64)
                                          : Color(0xfF514F64),
                                      borderRadius: BorderRadius.circular(3)),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
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
              SizedBox(height: 10),

              Container(
                height: 100,
              ),
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
