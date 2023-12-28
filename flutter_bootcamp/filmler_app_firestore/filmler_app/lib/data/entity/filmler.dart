class Filmler {
  String id;
  String ad;
  String resim;
  int fiyat;

  Filmler({required this.id,required this.ad,required this.resim,required this.fiyat});

  factory Filmler.fromJson(Map<dynamic,dynamic> json,String key){
    return Filmler(
        id: key,
        ad: json["ad"] as String,
        resim: json["resim"] as String,
        fiyat: json["fiyat"] as int);
  }
}