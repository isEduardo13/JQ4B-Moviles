import 'package:flutter/material.dart';
import 'package:holaflutter/unidad_1/practica_1/models/partido.dart';

class ResultadosWidget extends StatelessWidget {
  ResultadosWidget({super.key});
  final List<Partido> _partidos = [
    Partido(
        visitante: "Pumas",
        amarillaVisitante: "1",
        golesVisitante: 2,
        local: "America",
        rojaLocal: "0",
        golesLocal: 1,
        rojaVisitante: "0",
        logoVisitante: "assets/images/pumas.png",
        logo: "assets/images/amex.png"),
    Partido(
        visitante: "Pumas",
        amarillaVisitante: "1",
        golesVisitante: 4,
        local: "America",
        rojaLocal: "0",
        golesLocal: 0,
        rojaVisitante: "0",
        logoVisitante: "assets/images/leon_mex.png",
        logo: "assets/images/puebla.png"),
    Partido(
        visitante: "Queretaro",
        amarillaVisitante: "1",
        golesVisitante: 3,
        local: "America",
        rojaLocal: "0",
        golesLocal: 1,
        rojaVisitante: "0",
        logoVisitante: "assets/images/queretaro.png",
        logo: "assets/images/santos.png")
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: _partidos.length,
        itemBuilder: (context, index) {
          Partido p = _partidos[index];
          return ResultadosWidgetCard(
              amarillaVisitante: p.amarillaVisitante,
              golesVisitante: p.golesVisitante,
              local: p.local,
              rojaLocal: p.rojaLocal,
              rojaVisitante: p.rojaVisitante,
              visitante: p.visitante,
              logo: p.logo,
              golesLocal: p.golesLocal,
              logoVisitante: p.logoVisitante);
        });
  }
}

class ResultadosWidgetCard extends StatelessWidget {
  final String visitante;
  final String amarillaVisitante;
  final int golesVisitante;
  final String local;
  final String rojaLocal;
  final String rojaVisitante;
  final String logo;
  final int golesLocal;
  final String logoVisitante;
  const ResultadosWidgetCard(
      {super.key,
      required this.amarillaVisitante,
      required this.golesVisitante,
      required this.rojaVisitante,
      required this.local,
      required this.rojaLocal,
      required this.visitante,
      required this.logo,
      required this.golesLocal,
      required this.logoVisitante});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      height: 200,
      width: 100,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                    child: ClipRect(
                  child: Image.asset(
                    logo,
                    fit: BoxFit.cover,
                    height: 50,
                    width: 50,
                  ),
                )),
                SizedBox(
                  width: 50,
                ),
                Text(local),
                SizedBox(
                  width: 50,
                ),
                Text(golesLocal.toString()),
                SizedBox(
                  width: 50,
                ),
                SizedBox(
                    child: golesLocal <= golesVisitante
                        ? Icon(Icons.arrow_circle_left)
                        : Text("")),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              children: [
                CircleAvatar(
                    child: ClipRect(
                  child: Image.asset(
                    logoVisitante,
                    fit: BoxFit.cover,
                    height: 50,
                    width: 50,
                  ),
                )),
                SizedBox(
                  width: 50,
                ),
                Text(visitante),
                SizedBox(
                  width: 50,
                ),
                Text(golesVisitante.toString()),
                SizedBox(
                  width: 50,
                ),
                SizedBox(
                    child: golesLocal <= golesVisitante
                        ? Icon(Icons.arrow_circle_left)
                        : Text("")),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text(
                "Tarjetas amarillas: ${amarillaVisitante} -  Tarjetas Rojas: ${rojaVisitante}")
          ],
        ),
      ),
    );
  }
}
