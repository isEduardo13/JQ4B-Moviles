import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:holaflutter/presentation/blocs/bloc/notificaciones_bloc.dart';

class NotificacionesScreen extends StatelessWidget {
  const NotificacionesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notificaciones'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            context.select((NotificacionesBloc bloc) =>
                Text(bloc.state.status.toString())),
            const Text("STatus de la notificacion"),
            OutlinedButton(
              onPressed: () {
                context
                    .read<NotificacionesBloc>()
                    .RequestNotificationPermission();
              },
              child: const Text("Autorizar notificacion"),
            ),
            Expanded(child: ListView.builder(itemBuilder: (context, index) {
              return ListTile();
            })),
          ],
        ),
      ),
    );
  }
}
