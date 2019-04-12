import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:bloc_pattern/bloc_pattern.dart';

class IncrementController implements BlocBase {

  //fluxo da variavel counter
  var _counterController = BehaviorSubject<int>(seedValue: 0);

  //saida
  Stream<int> get outCounter {
    return _counterController.stream;
  }

  Sink<int> get inCounter => _counterController.sink;
  
  void increment(){
    inCounter.add(_counterController.value + 1);
  }
  
  @override
  void dispose() {
    _counterController.close();
  }
  
}