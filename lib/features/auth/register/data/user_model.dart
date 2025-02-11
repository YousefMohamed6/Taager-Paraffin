import 'package:tager_paraffin/core/managers/keys_manager.dart';

class UserModel {
  final String phone;

  UserModel._({required this.phone});

  factory UserModel.fromJson({required Map<String, dynamic> data}) {
    return UserModel._(
      phone: data[KeysManager.kphone],
    );
  }
}
