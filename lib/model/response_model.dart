class UserDetails {
  int userId;
  String userName;
  String apiToken;
  List<Notifications> notifications;

  UserDetails({this.userId, this.userName, this.apiToken, this.notifications});

  UserDetails.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    userName = json['user_name'];
    apiToken = json['api_token'];
    if (json['notifications'] != null) {
      notifications = new List<Notifications>();
      json['notifications'].forEach((v) {
        notifications.add(new Notifications.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['user_name'] = this.userName;
    data['api_token'] = this.apiToken;
    if (this.notifications != null) {
      data['notifications'] =
          this.notifications.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Notifications {
  String id;
  String type;
  int notifiableId;
  String notifiableType;
  Data data;
  Null readAt;
  String createdAt;
  String updatedAt;

  Notifications(
      {this.id,
        this.type,
        this.notifiableId,
        this.notifiableType,
        this.data,
        this.readAt,
        this.createdAt,
        this.updatedAt});

  Notifications.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    notifiableId = json['notifiable_id'];
    notifiableType = json['notifiable_type'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    readAt = json['read_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['notifiable_id'] = this.notifiableId;
    data['notifiable_type'] = this.notifiableType;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    data['read_at'] = this.readAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Data {
  int paymentId;
  String generatePaymentId;
  String message;
  int amount;

  Data({this.paymentId, this.generatePaymentId, this.message, this.amount});

  Data.fromJson(Map<String, dynamic> json) {
    paymentId = json['payment_id'];
    generatePaymentId = json['generate_payment_id'];
    message = json['message'];
    amount = json['amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['payment_id'] = this.paymentId;
    data['generate_payment_id'] = this.generatePaymentId;
    data['message'] = this.message;
    data['amount'] = this.amount;
    return data;
  }
}