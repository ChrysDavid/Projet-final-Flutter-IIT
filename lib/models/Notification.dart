class Notification {
  final int id;
  final int id_user;
  final String title;
  final String message;
  final String date_send;

  Notification({
    required this.id,
    required this.id_user,
    required this.title,
    required this.message,
    required this.date_send,
  });
}
