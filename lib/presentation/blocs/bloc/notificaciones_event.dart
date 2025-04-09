part of 'notificaciones_bloc.dart';

sealed class NotificacionesEvent {
  const NotificacionesEvent();
}

class NotificationStatusChanged extends NotificacionesEvent {
  final AuthorizationStatus status;

  const NotificationStatusChanged(this.status);
}
