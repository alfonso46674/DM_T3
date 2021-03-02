part of 'front_bloc.dart';

abstract class FrontState extends Equatable {
  const FrontState();

  // @override
  // List<Object> get props => [];
}

class FrontInitial extends FrontState {
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class JuegoInicialState extends FrontState {
  final String palabra;
  final String titulo;
  final String contador;

  JuegoInicialState(
    this.palabra,
    this.titulo,
    this.contador,
  );

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class JuegoNextState extends FrontState {
  final String palabra;
  final String titulo;
  final String contador;

  JuegoNextState(
    this.palabra,
    this.titulo,
    this.contador,
  );

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}
