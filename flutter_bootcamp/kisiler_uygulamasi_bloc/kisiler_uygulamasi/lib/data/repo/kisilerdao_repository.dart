import 'package:kisiler_uygulamasi/data/entity/kisiler.dart';

class KisilerDaoRepository {
  Future<void> kaydet(String kisi_ad,String kisi_tel) async {
    print("Kişi Kaydet : $kisi_ad - $kisi_tel");
  }

  Future<void> guncelle(int kisi_id,String kisi_ad,String kisi_tel) async {
    print("Kişi Güncelle : $kisi_id - $kisi_ad - $kisi_tel");
  }

  Future<void> sil(int kisi_id) async {
    print("Kişi Sil : $kisi_id");
  }

  Future<List<Kisiler>> kisileriYukle() async {
    var kisilerListesi = <Kisiler>[];
    var k1 = Kisiler(kisi_id: 1, kisi_ad: "Ahmet", kisi_tel: "1111");
    var k2 = Kisiler(kisi_id: 2, kisi_ad: "Zeynep", kisi_tel: "2222");
    var k3 = Kisiler(kisi_id: 3, kisi_ad: "Beyza", kisi_tel: "3333");
    kisilerListesi.add(k1);
    kisilerListesi.add(k2);
    kisilerListesi.add(k3);
    return kisilerListesi;
  }

  Future<List<Kisiler>> ara(String aramaKelimesi) async {
    var kisilerListesi = <Kisiler>[];
    var k1 = Kisiler(kisi_id: 1, kisi_ad: "Ahmet", kisi_tel: "1111");
    kisilerListesi.add(k1);
    return kisilerListesi;
  }
}