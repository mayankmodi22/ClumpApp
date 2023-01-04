// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.status,
    this.message,
    this.data,
  });

  bool? status;
  String? message;
  Data? data;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        status: json["status"] == null ? null : json["status"],
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status == null ? null : status,
        "message": message == null ? null : message,
        "data": data == null ? null : data?.toJson(),
      };
}

class Data {
  Data({
    this.userToken,
    this.user,
  });

  String? userToken;
  User? user;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        userToken: json["user_token"] == null ? null : json["user_token"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "user_token": userToken == null ? null : userToken,
        "user": user == null ? null : user?.toJson(),
      };
}

class User {
  User({
    this.userId,
    this.cmpLogo,
    this.profileImage,
    this.fullName,
    this.cmpName,
    this.cmpId,
    this.contactNo,
    this.userName,
    this.password,
    this.roleId,
    this.status,
    this.deviceId,
    this.deviceType,
    this.fcmToken,
    this.createdBy,
    this.createdTimeDate,
    this.updatedBy,
    this.updatedTimeDate,
    this.deleteData,
    this.isTrial,
    this.trialDate,
  });

  int? userId;
  String? cmpLogo;
  dynamic profileImage;
  String? fullName;
  String? cmpName;
  int? cmpId;
  int? contactNo;
  String? userName;
  String? password;
  int? roleId;
  int? status;
  String? deviceId;
  String? deviceType;
  String? fcmToken;
  String? createdBy;
  DateTime? createdTimeDate;
  dynamic updatedBy;
  dynamic updatedTimeDate;
  int? deleteData;
  int? isTrial;
  DateTime? trialDate;

  factory User.fromJson(Map<String, dynamic> json) => User(
        userId: json["user_id"] == null ? null : json["user_id"],
        cmpLogo: json["cmp_logo"] == null ? null : json["cmp_logo"],
        profileImage: json["profile_image"],
        fullName: json["full_name"] == null ? null : json["full_name"],
        cmpName: json["cmpName"] == null ? null : json["cmpName"],
        cmpId: json["cmp_id"] == null ? null : json["cmp_id"],
        contactNo: json["contactNo"] == null ? null : json["contactNo"],
        userName: json["user_name"] == null ? null : json["user_name"],
        password: json["password"] == null ? null : json["password"],
        roleId: json["role_id"] == null ? null : json["role_id"],
        status: json["status"] == null ? null : json["status"],
        deviceId: json["device_id"] == null ? null : json["device_id"],
        deviceType: json["device_type"] == null ? null : json["device_type"],
        fcmToken: json["fcm_token"] == null ? null : json["fcm_token"],
        createdBy: json["created_by"] == null ? null : json["created_by"],
        createdTimeDate: json["created_time_date"] == null
            ? null
            : DateTime.parse(json["created_time_date"]),
        updatedBy: json["updated_by"],
        updatedTimeDate: json["updated_time_date"],
        deleteData: json["delete_data"] == null ? null : json["delete_data"],
        isTrial: json["is_trial"] == null ? null : json["is_trial"],
        trialDate: json["trial_date"] == null
            ? null
            : DateTime.parse(json["trial_date"]),
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId == null ? null : userId,
        "cmp_logo": cmpLogo == null ? null : cmpLogo,
        "profile_image": profileImage,
        "full_name": fullName == null ? null : fullName,
        "cmpName": cmpName == null ? null : cmpName,
        "cmp_id": cmpId == null ? null : cmpId,
        "contactNo": contactNo == null ? null : contactNo,
        "user_name": userName == null ? null : userName,
        "password": password == null ? null : password,
        "role_id": roleId == null ? null : roleId,
        "status": status == null ? null : status,
        "device_id": deviceId == null ? null : deviceId,
        "device_type": deviceType == null ? null : deviceType,
        "fcm_token": fcmToken == null ? null : fcmToken,
        "created_by": createdBy == null ? null : createdBy,
        "created_time_date":
            createdTimeDate == null ? null : createdTimeDate?.toIso8601String(),
        "updated_by": updatedBy,
        "updated_time_date": updatedTimeDate,
        "delete_data": deleteData == null ? null : deleteData,
        "is_trial": isTrial == null ? null : isTrial,
        "trial_date": trialDate == null ? null : trialDate?.toIso8601String(),
      };
}
