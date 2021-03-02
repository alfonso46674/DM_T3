import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

part 'front_event.dart';
part 'front_state.dart';

class FrontBloc extends Bloc<FrontEvent, FrontState> {
  FrontBloc() : super(FrontInitial());

  List<String> list1 = ["Perro", "Gato"];
  List<String> list2 = ["Perro", "Gato"];
  int count = 0;
  int listSize = 0;
  int index = 0;

  @override
  Stream<FrontState> mapEventToState(
    FrontEvent event,
  ) async* {
    if (event is StartEvent) {
      int listSize = list1.length;
      count = 0;
      yield JuegoInicialState(
          palabra: list1[index], titulo: "The word is...", contador: count);
    } else if (event is SkipEvent) {
      index++;
      if (index < listSize) {
        // verificar que el indice no se sobrepase el tamaño de la lista y que se pueda seguir jugando
        yield JuegoNextState(
            palabra: list1[index], titulo: "The word is...", contador: count);
      } else {
        yield JuegoEndState(titulo: "Your scored", contador: count);
      }
    } else if (event is GotEvent) {
      if (list1[index] == list2[index]) count++;
      index++;
      if (index < listSize) {
        // verificar que el indice no se sobrepase el tamaño de la lista y que se pueda seguir jugando
        yield JuegoNextState(
            palabra: list1[index], titulo: "The word is...", contador: count);
      } else {
        yield JuegoEndState(titulo: "Your scored", contador: count);
      }
      yield JuegoNextState(
          palabra: list1[index], titulo: "The word is...", contador: count);
    } else if (event is EndEvent) {
      count = 0;
      yield JuegoEndState(titulo: "Your scored", contador: count);
    }
  }
}
