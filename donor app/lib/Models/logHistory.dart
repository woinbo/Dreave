class UserLogHistory {
  final bool hasRequested;
  final bool hasAccepted;
  final bool hasRejected;
  final String requestorName;
  final String dateRequested;
  final double acceptedWithin;
  final String timeRequested;
  final String certificateLink;
  UserLogHistory(
      this.requestorName,
      this.dateRequested,
      this.acceptedWithin,
      this.timeRequested,
      this.certificateLink,
      this.hasAccepted,
      this.hasRequested,
      this.hasRejected);
}
