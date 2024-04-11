import 'dart:developer';

import 'package:hive/hive.dart';

const kUserDataBoxName = 'UserData';

enum UserField {
  id,
  userId,
  email,
  userName,
  refresh,
  token,
  mobile,
  isAccountSetup,
  gender,
  buildingInternalId,
  buildingName,
}

extension UserFieldExtension on UserField {
  String get asString {
    switch (this) {
      case UserField.id:
        return '_id';
      case UserField.userId:
        return 'userId';
      case UserField.email:
        return 'email';
      case UserField.userName:
        return 'username';
      case UserField.refresh:
        return 'refresh';
      case UserField.token:
        return 'token';
      case UserField.mobile:
        return 'phone';
      case UserField.isAccountSetup:
        return 'isAccountSetup';
      case UserField.buildingName:
        return 'name';
      case UserField.buildingInternalId:
        return 'internalId';
      default:
        return '';
    }
  }
}

class LocalStoragaeService {
  static var userDataBox = Hive.box(kUserDataBoxName);
  static Future<bool> deleteUserData() async {
    bool isDone = false;
    try {
      await userDataBox.clear();
      isDone = true;
    } catch (e) {
      log(e.toString());
    }
    return isDone;
  }

  static void updateUserData(Map<dynamic, dynamic> userData) {
    userData.forEach(
      (key, value) async {
        await userDataBox.put(key, value);
      },
    );
  }

  static void clearUserData() {
    userDataBox.clear();
  }

  static dynamic getUserValue(UserField userField) {
    return userDataBox.get(userField.asString);
  }
}
