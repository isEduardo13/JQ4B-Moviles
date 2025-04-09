import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

part 'notificaciones_event.dart';
part 'notificaciones_state.dart';

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // Handle background messages here
  await Firebase.initializeApp();
}

class NotificacionesBloc
    extends Bloc<NotificacionesEvent, NotificacionesState> {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  NotificacionesBloc() : super(NotificacionesState()) {
    on<NotificationStatusChanged>((event, emit) {
      emit(state.copyWith(status: event.status));
      if (event.status == AuthorizationStatus.authorized) {
        getToken();
      }
    });
    _initialStatusCheck();
  }

  void RequestNotificationPermission() async {
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      badge: true,
      provisional: false,
      sound: true,
      announcement: false,
      carPlay: false,
      criticalAlert: false,
      providesAppNotificationSettings: false,
    );
    add(NotificationStatusChanged(settings.authorizationStatus));
  }

  void _initialStatusCheck() async {
    final Settings = await messaging.getNotificationSettings();
    add(NotificationStatusChanged(Settings.authorizationStatus));
  }

  void getToken() async {
    String? token = await messaging.getToken();
    if (token != null) {
      if (state.status != AuthorizationStatus.authorized) {
        return;
      }
      final tocken = await messaging.getToken();
      print("Token: $tocken");
    }
  }
}
