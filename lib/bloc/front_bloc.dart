import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'front_event.dart';
part 'front_state.dart';

class FrontBloc extends Bloc<FrontEvent, FrontState> {
  FrontBloc() : super(FrontInitial());

  List<String> list1 = ["Perro","Gato"];
  List<String> list2 = ["Perro","Gato"];

  @override
  Stream<FrontState> mapEventToState(
    FrontEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
