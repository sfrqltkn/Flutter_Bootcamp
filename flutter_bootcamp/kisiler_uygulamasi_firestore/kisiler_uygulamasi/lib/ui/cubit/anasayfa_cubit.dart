import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kisiler_uygulamasi/data/entity/kisiler.dart';
import 'package:kisiler_uygulamasi/data/repo/kisilerdao_repository.dart';

class AnasayfaCubit extends Cubit<List<Kisiler>> {
  AnasayfaCubit():super(<Kisiler>[]);

  var krepo = KisilerDaoRepository();

  var collectionKisiler = FirebaseFirestore.instance.collection("Kisiler");

  Future<void> kisileriYukle() async {
    collectionKisiler.snapshots().listen((event) {
      var kisilerListesi = <Kisiler>[];

      var documents = event.docs;
      for(var document in documents){
        var key = document.id;
        var data = document.data();
        var kisi = Kisiler.fromJson(data, key);
        kisilerListesi.add(kisi);
      }

      emit(kisilerListesi);
    });
  }

  Future<void> ara(String aramaKelimesi) async {
    collectionKisiler.snapshots().listen((event) {
      var kisilerListesi = <Kisiler>[];

      var documents = event.docs;
      for(var document in documents){
        var key = document.id;
        var data = document.data();
        var kisi = Kisiler.fromJson(data, key);

        if(kisi.kisi_ad.toLowerCase().contains(aramaKelimesi.toLowerCase())){
          kisilerListesi.add(kisi);
        }
      }

      emit(kisilerListesi);
    });
  }

  Future<void> sil(String kisi_id) async {
    await krepo.sil(kisi_id);
  }
}