part of 'notificaciones_bloc.dart';

class NotificacionesState extends Equatable {
  final AuthorizationStatus status;

  final List<dynamic> notifications;

  const NotificacionesState(
      {this.status = AuthorizationStatus.notDetermined,
      this.notifications = const []});
  NotificacionesState copyWith({
    AuthorizationStatus? status,
    List<dynamic>? notifications,
  }) =>
      NotificacionesState(
        status: status ?? this.status,
        notifications: notifications ?? this.notifications,
      );

  @override
  List<Object> get props => [];
}
