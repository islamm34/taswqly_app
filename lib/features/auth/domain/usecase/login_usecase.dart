import 'package:injectable/injectable.dart';

import '../../../../core/utils/api_result.dart';
import '../../../network/models/request/login_request.dart';
import '../repositories/auth_repo.dart';

@injectable
class LoginUsecase {
  AuthRepo _authRepo;

  LoginUsecase(this._authRepo);

  Future<ApiResult<void>> call(LoginRequest request) =>
      _authRepo.login(request);
}
