import 'package:flutter/material.dart';
import 'package:holaflutter/unidad_2/practica1/provider/counter_provider.dart';
import 'package:holaflutter/unidad_2/practica1/screens/focos_widget.dart';
import 'package:provider/provider.dart';

class ScaffoldUnidad2Widget extends StatelessWidget {
  const ScaffoldUnidad2Widget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Unidad 2'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        centerTitle: true,
      ),
      body: FocosWidget(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<CounterProvider>().increment();
        },
        child: Icon(
          Icons.add,
        ),
      ),
      // bottomNavigationBar: SafeArea(
      //     child: Container(
      //   height: 56,
      //   padding: EdgeInsets.all(10),
      //   margin: EdgeInsets.symmetric(horizontal: 10),
      //   decoration: BoxDecoration(
      //       color: Theme.of(context).colorScheme.inversePrimary,
      //       borderRadius: BorderRadius.circular(24),
      //       boxShadow: [
      //         BoxShadow(
      //             color: Theme.of(context).colorScheme.primary, blurRadius: 10)
      //       ]),
      // )),
    );
  }
}
