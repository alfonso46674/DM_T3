import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/front_bloc.dart';

class Front extends StatefulWidget {
  Front({Key key}) : super(key: key);

  @override
  _FrontState createState() => _FrontState();
}

class _FrontState extends State<Front> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider(
        create: (context) => FrontBloc(),
        child: BlocConsumer<FrontBloc, FrontState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            if (state is JuegoInicialState) {
              return JugarWidget(
                palabra: state.palabra,
                titulo: state.titulo,
                contador: state.contador,
              );
            } else if (state is JuegoEndState) {
              return FinalizarWidget(
                contador: state.contador,
                titulo: state.titulo,
              );
            } else
              return VistaInicialWidget();
          },
        ),
      ),
    );
  }
}

class VistaInicialWidget extends StatelessWidget {
  const VistaInicialWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              flex: 4,
              child: Column(
                children: [
                  Text("Get ready to"),
                  SizedBox(height: 10.0),
                  Text(
                    "Guess the word!",
                    style: TextStyle(fontSize: 30),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MaterialButton(
                        child: Text(
                          "PLAY",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        color: Colors.green,
                        onPressed: () {
                          BlocProvider.of<FrontBloc>(context).add(StartEvent());
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FinalizarWidget extends StatelessWidget {
  final String titulo;
  final int contador;
  const FinalizarWidget({
    Key key,
    @required this.titulo,
    @required this.contador,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  SizedBox(
                    height: 240,
                  ),
                  Text(
                    this.titulo,
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  Text(
                    this.contador.toString(),
                    style: TextStyle(fontSize: 30),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MaterialButton(
                          child: Text("PLAY AGAIN"),
                          color: Colors.green,
                          onPressed: () {
                            BlocProvider.of<FrontBloc>(context)
                                .add(StartEvent());
                          }),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class JugarWidget extends StatefulWidget {
  final String titulo;
  final String palabra;
  final int contador;
  const JugarWidget({
    @required this.titulo,
    @required this.palabra,
    Key key,
    this.contador,
  }) : super(key: key);

  @override
  _JugarWidgetState createState() => _JugarWidgetState();
}

class _JugarWidgetState extends State<JugarWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              flex: 4,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 240,
                  ),
                  Text(
                    widget.titulo,
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  Text(
                    widget.palabra,
                    style: TextStyle(fontSize: 30),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  Text(widget.contador.toString()),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MaterialButton(
                          child: Text("SKIP"),
                          color: Colors.green,
                          onPressed: () {
                            BlocProvider.of<FrontBloc>(context)
                                .add(SkipEvent());
                          }),
                      MaterialButton(
                          child: Text("GOT IT"),
                          color: Colors.green,
                          onPressed: () {
                            BlocProvider.of<FrontBloc>(context).add(GotEvent());
                          }),
                      MaterialButton(
                          child: Text("END GAME"),
                          color: Colors.green,
                          onPressed: () {
                            BlocProvider.of<FrontBloc>(context).add(EndEvent());
                          }),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
