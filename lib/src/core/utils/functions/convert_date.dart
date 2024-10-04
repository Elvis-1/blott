DateTime? convertDate(int? timestamp) {
  return timestamp != null
      ? DateTime.fromMillisecondsSinceEpoch(timestamp * 1000)
      : null;
}
