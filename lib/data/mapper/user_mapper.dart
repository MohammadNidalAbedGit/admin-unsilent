import 'package:admin_panel_unsilent/app/extensions.dart';
import 'package:admin_panel_unsilent/data/responses/user_entity.dart';

import '../../app/constants.dart';
import '../../domain/domain/user.dart';
import '../../domain/domain/user_response.dart';
import '../responses/user_entity_response.dart';

extension NonNullableUserResponse on UserEntity?{
User toMapper(){
  return User(
      this?.id.orEmpty() ?? Constants.empty,
      this?.username.orEmpty() ?? Constants.empty,
      this?.email.orEmpty() ?? Constants.empty,
      this?.numOfNotifications.orZero() ?? Constants.zero,
      this?.followers.orZero() ?? Constants.zero,
      this?.following.orZero() ?? Constants.zero,
      this?.gender.orEmpty() ?? Constants.empty,
      this?.role.orEmpty() ?? Constants.empty,
      this?.token.orEmpty() ?? Constants.empty
  );
 }
}

extension NonNullableAuthenticateResponse on UserEntityResponse?{
  UserResponse toMapper() {
    return UserResponse(this?.user.toMapper());
  }
}