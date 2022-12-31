class SegeraModel{
  String nama;
  String image;

  SegeraModel(this.nama, this.image);

}

List<SegeraModel>segara=segeraData
  .map((item)=>
    SegeraModel(item['nama']!, item['image']!))
    .toList();

  var segeraData=[
    {"nama": "Pengabdi Setan 2", "image": "assets/images/poster_pengabdi.png"},
    {"nama": "Love Run", "image": "assets/images/poster_love_run.png"},
    {"nama": "Mumun", "image": "assets/images/poster_mumun.png"},
  ];