class ShowingModel{
  String nama;
  String image;

  ShowingModel(this.nama, this.image);

}

List<ShowingModel>showing=showingData
  .map((item)=>
    ShowingModel(item['nama']!, item['image']!))
    .toList();

  var showingData=[
    {"nama": "Pengabdi Setan 2", "image": "assets/images/poster_pengabdi.png"},
    {"nama": "Love Run", "image": "assets/images/poster_love_run.png"},
    {"nama": "Mumun", "image": "assets/images/poster_mumun.png"},
  ];


  