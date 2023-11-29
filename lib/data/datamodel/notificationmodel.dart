class NotificationModel {
  String? notificationId;
  String? notificationTitle;
  String? notificationBody;
  String? notificationUserId;
  String? notificationDate;

  NotificationModel(
      {this.notificationId,
      this.notificationTitle,
      this.notificationBody,
      this.notificationUserId,
      this.notificationDate});

  NotificationModel.fromJson(Map<String, dynamic> json) {
    notificationId = json['notification_id'];
    notificationTitle = json['notification_title'];
    notificationBody = json['notification_body'];
    notificationUserId = json['notification_user_id'];
    notificationDate = json['notification_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['notification_id'] = notificationId;
    data['notification_title'] = notificationTitle;
    data['notification_body'] = notificationBody;
    data['notification_user_id'] = notificationUserId;
    data['notification_date'] = notificationDate;
    return data;
  }
}
