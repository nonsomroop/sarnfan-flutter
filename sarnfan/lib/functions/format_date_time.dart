String formatDateTime(String dateTime) {
  if (dateTime.isEmpty) {
    return '';
  }
  DateTime parsedDateTime = DateTime.parse(dateTime);
  String formattedDate = parsedDateTime
      .toLocal()
      .toString()
      .substring(0, 16)
      .replaceFirst('T', ' ');
  return formattedDate;
}
