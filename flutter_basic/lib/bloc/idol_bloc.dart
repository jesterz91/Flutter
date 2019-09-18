import 'package:flutter_app/model/idol.dart';
import 'package:rxdart/rxdart.dart';

class IdolBloc {

  final _idolList = List<Idol>();
  final _idolSubject = BehaviorSubject<List<Idol>>.seeded([]);

  Stream<List<Idol>> get idolListStream => _idolSubject.stream;

  void like(Idol idol) {
    _idolList.add(idol);
    _idolSubject.add(_idolList);
  }

  void unlike(Idol idol) {
    _idolList.remove(idol);
    _idolSubject.add(_idolList);
  }
}