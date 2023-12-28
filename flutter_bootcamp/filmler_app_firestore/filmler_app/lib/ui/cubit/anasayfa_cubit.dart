import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:filmler_app/data/entity/filmler.dart';
import 'package:filmler_app/data/repo/filmlerdao_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnasayfaCubit extends Cubit<List<Filmler>> {
  AnasayfaCubit():super(<Filmler>[]);

  var frepo = FilmlerDaoRepository();

  var collectionFilmler = FirebaseFirestore.instance.collection("Filmler");

  Future<void> filmleriYukle() async {
      collectionFilmler.get().then((value) {
        var filmlerListesi = <Filmler>[];

        var documents = value.docs;
        for(var document in documents){
          var key = document.id;
          var data = document.data();
          var film = Filmler.fromJson(data, key);
          filmlerListesi.add(film);
        }

        emit(filmlerListesi);
      });
  }
}