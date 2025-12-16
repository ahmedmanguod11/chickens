import 'dart:convert';

import 'package:chickens/constants.dart';
import 'package:chickens/core/services/shared_preferences_singleton.dart';
import 'package:chickens/features/auth/data/models/user_model.dart';
import 'package:chickens/features/auth/domain/entites/user_entity.dart';



UserEntity? getUser() {
  var jsonString = Prefs.getString(kUserData);
  if (jsonString == null || jsonString.isEmpty) {
    // لو مفيش بيانات، رجّع null أو user افتراضي
    return null;
  }
  var userEntity = UserModel.fromJson(jsonDecode(jsonString));
  return userEntity;
}
