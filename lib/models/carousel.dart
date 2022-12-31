class CarrouselModel{
  String image;

  CarrouselModel(this.image);
}

List<CarrouselModel> carousels =
carouselsData.map((item) => CarrouselModel(item['image']!)).toList();

var carouselsData =[
  {"image": "assets/images/carousel_qodrat.png"},
  {"image": "assets/images/carousel_pengabdisetan2.png"},
  {"image": "assets/images/carousel_blackpanther.png"},
];
