class NotificationData {
  final String description, iconPath;
  final bool seen;

  NotificationData(
      {required this.description, required this.iconPath, required this.seen});

  factory NotificationData.fromJson(Map<String,dynamic> map){

    return NotificationData(description: map['description'], iconPath: map['iconPath'], seen: map['seen']);

  }
}
