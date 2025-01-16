import 'package:asi_shop/models/user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserNotifier extends StateNotifier<User> {
  UserNotifier() : super(User('Thiago'));
}

final userProvider = StateNotifierProvider<UserNotifier, User>(
  (ref) => UserNotifier(),
);
