import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  int sayac = 0;

  @override
  void initState() {
    super.initState();
    //test();
    sayacKontrol();
  }

  Future<void> sayacKontrol() async {
    var sp = await SharedPreferences.getInstance();
    sayac = sp.getInt("sayac") ?? 0;
    setState(() {
      sayac = sayac + 1;
    });
    sp.setInt("sayac", sayac);
  }

  Future<void> test() async {
    var sp = await SharedPreferences.getInstance();

    //Veri Kaydı
    sp.setString("ad", "Ahmet");
    sp.setInt("yas", 23);
    sp.setDouble("boy", 1.78);
    sp.setBool("bekar", true);

    var arkadasListesi = <String>[];
    arkadasListesi.add("Ali");
    arkadasListesi.add("Ece");
    sp.setStringList("arkadasListesi", arkadasListesi);

    //Veri Silme
    //sp.remove("ad");

    //Veri Okuma
    String gelenAd = sp.getString("ad") ?? "isim yok";
    int gelenYas = sp.getInt("yas") ?? 0;
    double gelenBoy = sp.getDouble("boy") ?? 0.0;
    bool gelenBekar = sp.getBool("bekar") ?? false;
    print("Gelen Ad    : $gelenAd");
    print("Gelen Yaş   : $gelenYas");
    print("Gelen Boy   : $gelenBoy");
    print("Gelen Bekar : $gelenBekar");

    var gelenArkadasListesi = sp.getStringList("arkadasListesi") ?? <String>[];

    if(gelenArkadasListesi != null){
      for(var a in gelenArkadasListesi){
        print("Arkadaş : $a");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Shared Preferences"),),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("Açılış Sayısı : $sayac",style: TextStyle(fontSize: 50),)
          ],
        ),
      ),
    );
  }
}
