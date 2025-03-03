import 'package:asi_shop/models/user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserNotifier extends StateNotifier<User> {
  UserNotifier() : super(User('Thiago'));

  updateAsiPoints(int total) {
    final User curUser = state;
    curUser.asipoints = curUser.asipoints - total;
    state = curUser;
  }
}

final userProvider = StateNotifierProvider<UserNotifier, User>(
  (ref) => UserNotifier(),
);
