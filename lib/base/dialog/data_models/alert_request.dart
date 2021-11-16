class AlertRequest {
  final String title;
  final String description;
  final String okButtonTitle;
  final String? cancelButtonTitle;

  AlertRequest({
    required this.title,
    required this.description,
    required this.okButtonTitle,
    this.cancelButtonTitle,
  });
}
